import 'dart:io';
import 'dart:isolate';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter_downloader/flutter_downloader.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:motion_toast/motion_toast.dart';
import 'package:path_provider/path_provider.dart';
import 'package:share/share.dart';
import 'package:url_launcher/url_launcher.dart';
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
  int progress = 0;

  @override
  void initState() {
    IsolateNameServer.registerPortWithName(_port.sendPort, "downloading");
    _port.listen((message) {
      String id = message[0];
      DownloadTaskStatus status = message[1];
      progress = message[2];
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
    final externalStorageDirPath = useState("");
    final exists = useState(false);
    final content = useProvider(contentProvider(widget.id!));
    final scrollController = useScrollController();
    List<String> extenstions = [
      "m4a",
      "flac",
      "mp3",
      "mp4",
      "wav",
      "wma",
      "aac"
    ];
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
        shape: const RoundedRectangleBorder(
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
                                    physics:
                                        const NeverScrollableScrollPhysics(),
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
                                          leading: const Icon(
                                              FontAwesomeIcons.folderOpen),
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
                                  const SizedBox(
                                    height: 10,
                                  ),
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
                                    physics:
                                        const NeverScrollableScrollPhysics(),
                                    itemBuilder: (context, index) {
                                      return Slidable(
                                        actionPane:
                                            const SlidableDrawerActionPane(),
                                        actionExtentRatio: 0.25,
                                        child: Container(
                                          color: Colors.white,
                                          child: ListTile(
                                            title:
                                                Text('${files![index].name}'),
                                            leading: files![index]
                                                    .name!
                                                    .endsWith("pdf")
                                                ? const Icon(
                                                    FontAwesomeIcons.filePdf)
                                                : files![index]
                                                        .name!
                                                        .endsWith("pptx")
                                                    ? const Icon(
                                                        FontAwesomeIcons
                                                            .filePowerpoint)
                                                    : extenstions.any(
                                                            (element) =>
                                                                files![index]
                                                                    .name!
                                                                    .endsWith(
                                                                        element))
                                                        ? const Icon(
                                                            FontAwesomeIcons
                                                                .fileAudio)
                                                        : files![index]
                                                                .name!
                                                                .endsWith("ppt")
                                                            ? const Icon(
                                                                FontAwesomeIcons
                                                                    .filePowerpoint)
                                                            : const Icon(
                                                                FontAwesomeIcons.link),
                                          ),
                                        ),
                                        actions: <Widget>[
                                          extenstions.any((element) =>
                                                  files![index]
                                                      .name!
                                                      .endsWith(element))
                                              ? IconSlideAction(
                                                  caption: 'Play',
                                                  color: Colors.blue,
                                                  icon: FontAwesomeIcons
                                                      .playCircle,
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
                                          files![index].out_link == null
                                              ? IconSlideAction(
                                                  caption: 'Download',
                                                  color: Colors.green,
                                                  icon:
                                                      FontAwesomeIcons.download,
                                                  onTap: () async {
                                                    final status =
                                                        await Permission.storage
                                                            .request();
                                                    if (status.isGranted) {
                                                      String file =
                                                          files![index].name!;

                                                      if (Platform.isAndroid) {
                                                        externalStorageDirPath
                                                                .value =
                                                            "/storage/emulated/0/Download/";
                                                        exists
                                                            .value = await File(
                                                                "/storage/emulated/0/Download/$file")
                                                            .exists();
                                                      } else {
                                                        externalStorageDirPath
                                                                .value =
                                                            (await getApplicationDocumentsDirectory())
                                                                .path;
                                                        exists
                                                            .value = await File(
                                                                "${externalStorageDirPath.value}/$file")
                                                            .exists();
                                                      }

                                                      if (exists.value &&
                                                          Platform.isAndroid) {
                                                        MotionToast.error(
                                                          title:
                                                              "Download Error",
                                                          titleStyle:
                                                              const TextStyle(
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold),
                                                          description:
                                                              "You already have this file , Therefore it won't be downloaded",
                                                          descriptionStyle:
                                                              const TextStyle(
                                                                  fontSize: 12),
                                                          width: 300,
                                                        ).show(context);
                                                      } else if (exists.value &&
                                                          Platform.isIOS) {
                                                        var id = await File(
                                                            "${externalStorageDirPath.value}/$file");
                                                        id.delete();
                                                        context
                                                            .read(
                                                                downloaderUseCaseProvider)
                                                            .execute(DownloadFileUseCaseInput(
                                                                filename:
                                                                    files![index]
                                                                        .name,
                                                                url: files![
                                                                        index]
                                                                    .url,
                                                                directory:
                                                                    externalStorageDirPath
                                                                        .value))
                                                            .then(
                                                                (result) =>
                                                                    result.fold(
                                                                        (l) {
                                                                      MotionToast
                                                                          .error(
                                                                        title:
                                                                            "Download Error",
                                                                        titleStyle:
                                                                            const TextStyle(fontWeight: FontWeight.bold),
                                                                        description:
                                                                            "Sorry , Error While Downloading ",
                                                                        descriptionStyle:
                                                                            const TextStyle(fontSize: 12),
                                                                        width:
                                                                            300,
                                                                      ).show(
                                                                          context);
                                                                    }, (r) {
                                                                      MotionToast
                                                                          .success(
                                                                        title: Platform.isIOS
                                                                            ? "Downloaded"
                                                                            : "Downloading File",
                                                                        titleStyle:
                                                                            const TextStyle(fontWeight: FontWeight.bold),
                                                                        description: Platform.isIOS
                                                                            ? "File hase been Downloaded"
                                                                            : "File is downloading , Please check your notification",
                                                                        descriptionStyle:
                                                                            const TextStyle(fontSize: 12),
                                                                        width:
                                                                            300,
                                                                      ).show(
                                                                          context);
                                                                    }));
                                                        if (Platform.isIOS) {
                                                          if (progress != 100) {
                                                            showDialog(
                                                                barrierDismissible:
                                                                    false,
                                                                context:
                                                                    context,
                                                                builder:
                                                                    (BuildContext
                                                                        context) {
                                                                  return AlertDialog(
                                                                      content:
                                                                          Row(
                                                                    children: const [
                                                                      CircularProgressIndicator(),
                                                                      SizedBox(
                                                                        width:
                                                                            10,
                                                                      ),
                                                                      Text(
                                                                          "Downloading ...")
                                                                    ],
                                                                  ));
                                                                });
                                                          }
                                                        }
                                                      } else {
                                                        context
                                                            .read(
                                                                downloaderUseCaseProvider)
                                                            .execute(DownloadFileUseCaseInput(
                                                                filename:
                                                                    files![index]
                                                                        .name,
                                                                url: files![
                                                                        index]
                                                                    .url,
                                                                directory:
                                                                    externalStorageDirPath
                                                                        .value))
                                                            .then(
                                                                (result) =>
                                                                    result.fold(
                                                                        (l) {
                                                                      MotionToast
                                                                          .error(
                                                                        title:
                                                                            "Download Error",
                                                                        titleStyle:
                                                                            const TextStyle(fontWeight: FontWeight.bold),
                                                                        description:
                                                                            "Sorry , Error While Downloading ",
                                                                        descriptionStyle:
                                                                            const TextStyle(fontSize: 12),
                                                                        width:
                                                                            300,
                                                                      ).show(
                                                                          context);
                                                                    }, (r) {
                                                                      MotionToast
                                                                          .success(
                                                                        title: Platform.isIOS
                                                                            ? "Downloaded"
                                                                            : "Downloading File",
                                                                        titleStyle:
                                                                            const TextStyle(fontWeight: FontWeight.bold),
                                                                        description: Platform.isIOS
                                                                            ? "File hase been Downloaded"
                                                                            : "File is downloading , Please check your notification",
                                                                        descriptionStyle:
                                                                            const TextStyle(fontSize: 12),
                                                                        width:
                                                                            300,
                                                                      ).show(
                                                                          context);
                                                                    }));
                                                        if (Platform.isIOS) {
                                                          if (progress != 100) {
                                                            showDialog(
                                                                barrierDismissible:
                                                                    false,
                                                                context:
                                                                    context,
                                                                builder:
                                                                    (BuildContext
                                                                        context) {
                                                                  return AlertDialog(
                                                                      content:
                                                                          Row(
                                                                    children: const [
                                                                      CircularProgressIndicator(),
                                                                      SizedBox(
                                                                        width:
                                                                            10,
                                                                      ),
                                                                      Text(
                                                                          "Downloading ...")
                                                                    ],
                                                                  ));
                                                                });
                                                          }
                                                        }
                                                      }
                                                    } else {
                                                      MotionToast.error(
                                                        title:
                                                            "Permission Denied",
                                                        titleStyle:
                                                            const TextStyle(
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold),
                                                        description:
                                                            "Sorry , You have Denied Folder access permission ",
                                                        descriptionStyle:
                                                            const TextStyle(
                                                                fontSize: 12),
                                                        width: 300,
                                                      ).show(context);
                                                    }
                                                  },
                                                )
                                              : IconSlideAction(
                                                  caption: 'Open',
                                                  color: Colors.red,
                                                  icon: Icons.open_in_browser,
                                                  onTap: () async {
                                                    await launch(files![index]
                                                        .out_link!);
                                                  }),
                                        ],
                                        secondaryActions: <Widget>[
                                          IconSlideAction(
                                              caption: 'Share',
                                              color: Colors.red,
                                              icon: FontAwesomeIcons.share,
                                              onTap: () async {
                                                Share.share(files![index].url!);
                                              }),
                                        ],
                                      );
                                    },
                                    itemCount: files!.length,
                                    controller: scrollController,
                                    scrollDirection: Axis.vertical,
                                  )
                                ],
                              )
                            : const SizedBox.shrink(),
                      ],
                    );
                  }),
              loading: () => ListView.separated(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
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
