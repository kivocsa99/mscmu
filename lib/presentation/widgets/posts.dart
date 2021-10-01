import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:motion_toast/motion_toast.dart';
import 'package:motion_toast/resources/arrays.dart';
import 'package:mscmu/application/provider/current_user.provider.dart';
import 'package:mscmu/infrastructure/upload/services/upload.repository.dart';
import 'package:mscmu/presentation/widgets/button_widget.dart';
import 'package:mscmu/presentation/widgets/field.dart';
import 'package:mscmu/presentation/widgets/toast_icon_widget.dart';
import '../../application/posts/use_cases/create_post/create_post_input.dart';
import '../../application/posts/use_cases/create_post/create_post_use_case.dart';
import '../../application/provider/posts.repository.provider.dart';
import '../../application/provider/sharedpref/pref_provider.dart';
import '../../domain/models/postmodel.dart';
import 'shimmer_affect.dart';
import 'package:path/path.dart';

class Posts extends HookWidget {
  const Posts({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final percentag = useState("");
    final current = useProvider(currentUserProvider);
    final prefs = useProvider(sharedPreferences);
    final scrollcontoller = useScrollController();
    final _formKey = useState(GlobalKey<FormState>());
    File? file;
    final fileName = useState('No File Selected');
    UploadTask? task;
    final _post = useState(const PostModel());
    Widget buildUploadStatus(UploadTask task) => StreamBuilder<TaskSnapshot>(
          stream: task.snapshotEvents,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              final snap = snapshot.data!;
              final progress = snap.bytesTransferred / snap.totalBytes;
              final percentage = (progress * 100).toStringAsFixed(2);

              return Text(
                '$percentage %',
                style:
                    const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              );
            } else {
              return Container();
            }
          },
        );
    return Column(
      children: [
        const Text(
          "NewsFeed",
          style: TextStyle(
              fontSize: 20, color: Colors.black, fontWeight: FontWeight.bold),
        ),
        const SizedBox(
          height: 10,
        ),
        current.maybeWhen(
            data: (user) => SizedBox(
                  width: 40,
                  height: 40,
                  child: FittedBox(
                    child: FloatingActionButton(
                      heroTag: "post",
                      child: const Icon(Icons.add),
                      onPressed: () async {
                        if (user.accepted == true) {
                          showModalBottomSheet(
                              isScrollControlled: true,
                              shape: const RoundedRectangleBorder(
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(30.0),
                                    topRight: Radius.circular(30.0)),
                              ),
                              context: context,
                              builder: (context) {
                                return StatefulBuilder(builder:
                                    (BuildContext context,
                                        StateSetter setState) {
                                  return Padding(
                                    padding: EdgeInsets.only(
                                      bottom: MediaQuery.of(context)
                                          .viewInsets
                                          .bottom,
                                    ),
                                    child: SingleChildScrollView(
                                      child: Form(
                                        child: Column(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            const SizedBox(
                                              height: 10,
                                            ),
                                            const Text(
                                              "NewPost",
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            const SizedBox(
                                              height: 10,
                                            ),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: Field(
                                                  max: 1,
                                                  label: 'Title',
                                                  validator: RequiredValidator(
                                                      errorText:
                                                          "This Field is required"),
                                                  onChanged: (value) =>
                                                      setState(() {
                                                        _post.value = _post
                                                            .value
                                                            .copyWith(
                                                                title: value);
                                                      })),
                                            ),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: Field(
                                                label: 'Body',
                                                max: null,
                                                keyboard:
                                                    TextInputType.multiline,
                                                onChanged: (value) =>
                                                    setState(() {
                                                  _post.value = _post.value
                                                      .copyWith(body: value);
                                                }),
                                                validator: RequiredValidator(
                                                    errorText:
                                                        "This Field is required"),
                                              ),
                                            ),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: ButtonWidget(
                                                text: 'Select File',
                                                icon: Icons.attach_file,
                                                onClicked: () async {
                                                  FilePickerResult? _result =
                                                      await FilePicker.platform
                                                          .pickFiles(
                                                    type: FileType.image,
                                                  );
                                                  if (_result != null) {
                                                    file = File(_result
                                                        .files.single.path!);
                                                    print(file!.path);

                                                    setState(() {
                                                      fileName.value =
                                                          basename(file!.path);
                                                    });
                                                  } else {}
                                                },
                                              ),
                                            ),
                                            const SizedBox(height: 8),
                                            Center(
                                              child: Text(
                                                fileName.value,
                                                style: const TextStyle(
                                                    fontSize: 16,
                                                    fontWeight:
                                                        FontWeight.w500),
                                              ),
                                            ),
                                            const SizedBox(height: 10),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: ButtonWidget(
                                                text: 'Upload File',
                                                icon:
                                                    Icons.cloud_upload_outlined,
                                                onClicked: () async {
                                                  setState(() {
                                                    task =
                                                        FirebaseApi.uploadFile(
                                                            "files", file!);
                                                  });
                                                  if (task == null) return;
                                                  final snap = await task!
                                                      .whenComplete(() {});
                                                  final downloadurl = await snap
                                                      .ref
                                                      .getDownloadURL();
                                                  print(downloadurl);
                                                  setState(() {
                                                    fileName.value =
                                                        "No File Selected";
                                                  });
                                                },
                                              ),
                                            ),
                                            const SizedBox(height: 20),
                                            task != null
                                                ? StreamBuilder<TaskSnapshot>(
                                                    stream:
                                                        task!.snapshotEvents,
                                                    builder:
                                                        (context, snapshot) {
                                                      if (snapshot.hasData) {
                                                        final snap =
                                                            snapshot.data!;
                                                        final progress =
                                                            snap.bytesTransferred /
                                                                snap.totalBytes;
                                                        final percentage =
                                                            (progress * 100)
                                                                .toStringAsFixed(
                                                                    2);
                                                        setState(() {
                                                          percentag.value =
                                                              percentage;
                                                        });
                                                        return Text(
                                                          '$percentage %',
                                                          style: const TextStyle(
                                                              fontSize: 20,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold),
                                                        );
                                                      } else {
                                                        return Container();
                                                      }
                                                    },
                                                  )
                                                : const SizedBox(
                                                    height: 10,
                                                  ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  );
                                });
                              });
                          // context.read(createpostUseCaseProvider).execute(
                          //     CreatepostInput(
                          //         yearid: user.yearid,
                          //         adminavatar: "adminavatar",
                          //         adminname: "adminname",
                          //         title: "title",
                          //         body: "body",
                          //         image: "image"));
                        } else {
                          MotionToast.error(
                                  position: MOTION_TOAST_POSITION.TOP,
                                  animationType: ANIMATION.FROM_TOP,
                                  title: "Permission Denied",
                                  titleStyle: const TextStyle(
                                      fontWeight: FontWeight.bold),
                                  description:
                                      "You don't have any permission for adding posts yet !")
                              .show(context);
                        }
                        //TODO else statment and ui for add post
                      },
                    ),
                  ),
                ),
            orElse: () => const SizedBox.shrink()),
        prefs.when(
            data: (data) {
              final yearid = useProvider(prefChangeNotifierProvider).yearId;
              final posts = useProvider(allPostsProvider(yearid));

              return posts.when(
                  data: (post) {
                    return ListView.custom(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      childrenDelegate: SliverChildBuilderDelegate(
                          (context, index) => PostWidget(
                                postModel: post[index],
                              ),
                          childCount: post.length),
                      controller: scrollcontoller,
                      scrollDirection: Axis.vertical,
                    );
                  },
                  loading: () => ListView.custom(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        childrenDelegate: SliverChildBuilderDelegate(
                            (context, index) => const ShimmerAffect(),
                            childCount: 10),
                        controller: scrollcontoller,
                        scrollDirection: Axis.vertical,
                      ),
                  error: (error, stack) {
                    return Center(
                      child: Text('$error'),
                    );
                  });
            },
            loading: () => const CircularProgressIndicator(),
            error: (error, stack) => Center(
                  child: Text("$error"),
                )),
        const SizedBox(
          height: 10,
        ),
        const SizedBox(
          height: 10,
        ),
      ],
    );
  }
}

class PostWidget extends StatelessWidget {
  final PostModel? postModel;
  const PostWidget({Key? key, this.postModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 0.0),
      elevation: 0.0,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        color: Colors.white,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  _PostHeader(
                    post: postModel,
                  ),
                  const SizedBox(height: 10.0),
                  Text(postModel!.title!),
                  const SizedBox(height: 20.0),
                  Text(postModel!.body!),
                ],
              ),
            ),
            postModel?.image != ""
                ? Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: GestureDetector(
                      child: Hero(
                        tag: '${postModel!.image}',
                        child: Image.network(postModel!.image!),
                      ),
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (_) {
                          return DetailScreen(
                            imageurl: postModel!.image,
                          );
                        }));
                      },
                    ),
                  )
                : const SizedBox.shrink(),
          ],
        ),
      ),
    );
  }
}

class _PostHeader extends StatelessWidget {
  final PostModel? post;

  const _PostHeader({
    Key? key,
    this.post,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ProfileAvatar(imageUrl: post!.adminavatar),
        const SizedBox(width: 8.0),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                post!.adminname!,
                style: const TextStyle(
                  fontWeight: FontWeight.w600,
                ),
              ),
              Row(
                children: [
                  Text(
                    '${post!.time} • ',
                    style: TextStyle(
                      color: Colors.grey[600],
                      fontSize: 12.0,
                    ),
                  ),
                  Icon(
                    Icons.public,
                    color: Colors.grey[600],
                    size: 12.0,
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class ProfileAvatar extends StatelessWidget {
  final String? imageUrl;

  const ProfileAvatar({
    Key? key,
    this.imageUrl,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CircleAvatar(
          radius: 20.0,
          backgroundColor: Colors.lightBlue,
          child: CircleAvatar(
            radius: 20.0,
            backgroundColor: Colors.grey[200],
            backgroundImage: NetworkImage(imageUrl!),
          ),
        ),
      ],
    );
  }
}

class DetailScreen extends StatelessWidget {
  final String? imageurl;
  const DetailScreen({Key? key, this.imageurl}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        child: Center(
          child: Hero(
            tag: 'imageHero',
            child: Image.network(imageurl!),
          ),
        ),
        onTap: () {
          Navigator.pop(context);
        },
      ),
    );
  }
}
