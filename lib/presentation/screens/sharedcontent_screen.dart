import 'dart:io';
import 'dart:isolate';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter_downloader/flutter_downloader.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:motion_toast/motion_toast.dart';
import '../../application/downloader/use_cases/download_file/download_file.input.dart';
import '../../application/downloader/use_cases/download_file/download_file.use_case.dart';
import '../../application/provider/content.repository.provider.dart';
import '../../domain/models/filemodel.dart';
import '../../domain/models/foldermodel.dart';
import '../../navigate.dart';
import 'player_screen.dart';
import '../widgets/shimmer_affect.dart';
import 'package:permission_handler/permission_handler.dart';

class SharedContentScreen extends StatefulHookWidget {
  final int? id;
  const SharedContentScreen({this.id, Key? key}) : super(key: key);

  @override
  _SharedContentScreenState createState() => _SharedContentScreenState();
}

class _SharedContentScreenState extends State<SharedContentScreen> {
  final _port = ReceivePort();

  @override
  void initState() {
    IsolateNameServer.registerPortWithName(_port.sendPort, "downloading");
    _port.listen((message) {
      String id = message[0];
      DownloadTaskStatus status = message[1];
      int progress = message[2];
    });
    FlutterDownloader.registerCallback(downloadCallBack);

    super.initState();
  }

  @override
  void dispose() {
    IsolateNameServer.removePortNameMapping('downloading');
    super.dispose();
  }

  static downloadCallBack(id, status, progress) {
    SendPort sendPort = IsolateNameServer.lookupPortByName("downloading")!;
    sendPort.send([id, status, progress]);
  }

  @override
  Widget build(BuildContext context) {
    final progress = useState(0);
    final content = useProvider(contentProvider(widget.id!));
    final scrollController = useScrollController();
    List<FolderModel>? folders;
    List<FileModel>? files;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Image.asset(
          "images/logo.png",
          scale: 10,
        ),
        centerTitle: true,
        shape:const  RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(20.0),
            bottomRight: Radius.circular(20.0),
          ),
        ),
      ),
      body: SingleChildScrollView(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          content.when(
              data: (data) => data.fold(
                      (l) => Center(child: Text(l.toString())), (content) {
                    folders = content.folders;
                    files = content.files;
                    return Column(
                      children: [
                        folders != null
                            ? Column(
                                children: [
                                  const SizedBox(
                                    height: 10,
                                  ),
                                 const Text(
                                    "Folders",
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  ListView.separated(
                                    shrinkWrap: true,
                                    physics:const NeverScrollableScrollPhysics(),
                                    separatorBuilder: (context, index) =>
                                        const Divider(),
                                    itemBuilder: (context, index) {
                                      return SizedBox(
                                        width: 100,
                                        height: 50,
                                        child: ListTile(
                                          onTap: () {
                                            changeScreen(
                                                context,
                                                SharedContentScreen(
                                                    id: folders![index].id));
                                          },
                                          leading:const Icon(Icons.book),
                                          title:
                                              Text("${folders![index].name}"),
                                        ),
                                      );
                                    },
                                    itemCount: folders!.length,
                                    controller: scrollController,
                                    scrollDirection: Axis.vertical,
                                  )
                                ],
                              )
                            : const SizedBox.shrink(),
                        files != null
                            ? Column(
                                children: [
                                  Text(progress.value.toString()),
                                 const Text(
                                    "Files",
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  ListView.separated(
                                    separatorBuilder: (context, index) =>
                                       const Divider(),
                                    shrinkWrap: true,
                                    physics:const NeverScrollableScrollPhysics(),
                                    itemBuilder: (context, index) {
                                      return Slidable(
                                        actionPane:const SlidableDrawerActionPane(),
                                        actionExtentRatio: 0.25,
                                        child: Container(
                                          color: Colors.white,
                                          child: ListTile(
                                            title:
                                                Text('${files![index].name}'),
                                            
                                          ),
                                        ),
                                        actions: <Widget>[
                                          files![index].name!.contains("mp4")
                                              ? IconSlideAction(
                                                  caption: 'Play',
                                                  color: Colors.blue,
                                                  icon: Icons.play_circle,
                                                  onTap: () async {
                                                    changeScreen(
                                                        context,
                                                        PlayerScreen(
                                                          url:
                                                              files![index].url,
                                                        ));
                                                  },
                                                )
                                              : const SizedBox.shrink(),
                                          IconSlideAction(
                                            caption: 'Download',
                                            color: Colors.green,
                                            icon: Icons.download,
                                            onTap: () async {
                                              final status = await Permission
                                                  .storage
                                                  .request();
                                              if (status.isGranted) {
                                                String file =
                                                    files![index].name!;
                                                bool hey = await File(
                                                        "/storage/emulated/0/Download/$file")
                                                    .exists();

                                                if (hey) {
                                                  MotionToast.error(
                                                    title: "Download Error",
                                                    titleStyle:const TextStyle(
                                                        fontWeight:
                                                            FontWeight.bold),
                                                    description:
                                                        "You already have this file , Therefore it won't be downloaded",
                                                    descriptionStyle:
                                                       const TextStyle(fontSize: 12),
                                                    width: 300,
                                                  ).show(context);
                                                } else {
                                                  await context
                                                      .read(
                                                          downloaderUseCaseProvider)
                                                      .execute(
                                                          DownloadFileUseCaseInput(
                                                              filename:
                                                                  files![index]
                                                                      .name,
                                                              url: files![index]
                                                                  .url,
                                                              directory:
                                                                  "/storage/emulated/0/Download/"))
                                                      .then((result) =>
                                                          result.fold((l) {
                                                            MotionToast.error(
                                                              title:
                                                                  "Download Error",
                                                              titleStyle:const TextStyle(
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold),
                                                              description:
                                                                  "Sorry , Error While Downloading ",
                                                              descriptionStyle:
                                                                 const TextStyle(
                                                                      fontSize:
                                                                          12),
                                                              width: 300,
                                                            ).show(context);
                                                          }, (r) {
                                                            MotionToast.success(
                                                              title:
                                                                  "File Downloaded successfully",
                                                              titleStyle: const TextStyle(
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold),
                                                              description:
                                                                  "File has been downloaded , PLease check your notification",
                                                              descriptionStyle:
                                                                 const TextStyle(
                                                                      fontSize:
                                                                          12),
                                                              width: 300,
                                                            ).show(context);
                                                          }));
                                                }
                                              } else {
                                              }
                                            },
                                          ),
                                        ],
                                        secondaryActions: <Widget>[

                                        ],
                                      );
                                    },
                                    itemCount: files!.length,
                                    controller: scrollController,
                                    scrollDirection: Axis.vertical,
                                  )
                                ],
                              )
                            :const SizedBox.shrink(),
                      ],
                    );
                  }),
              loading: () => ListView.separated(
                    shrinkWrap: true,
                    physics:const NeverScrollableScrollPhysics(),
                    separatorBuilder: (context, index) => const Divider(),
                    itemBuilder: (context, index) {
                      return const ShimmerAffect(
                        height: 50,
                        width: 100,
                      );
                    },
                    itemCount: 10,
                    controller: scrollController,
                    scrollDirection: Axis.vertical,
                  ),
              error: (error, _) => Center(
                    child: Text("$error"),
                  ))
        ],
      )),
    );
  }
}
