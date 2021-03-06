import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mscmu/application/provider/current_user.provider.dart';
import 'package:mscmu/application/provider/years.repository.provider.dart';
import '../../application/posts/use_cases/create_post/create_post_input.dart';
import '../../application/posts/use_cases/create_post/create_post_use_case.dart';
import 'package:path/path.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../domain/models/postmodel.dart';
import '../../infrastructure/upload/services/upload.repository.dart';
import '../widgets/button_widget.dart';
import '../widgets/field.dart';

class AddPostScreen extends StatefulHookWidget {
  final String? avatar;
  final String? name;
  final int? yearid;

  const AddPostScreen({this.avatar, this.name, this.yearid, Key? key})
      : super(key: key);

  @override
  _AddPostScreenState createState() => _AddPostScreenState();
}

class _AddPostScreenState extends State<AddPostScreen> {
  UploadTask? task;
  File? file;

  @override
  Widget build(BuildContext context) {
    var fileName = file != null ? basename(file!.path) : 'No File Selected';
    final _post = useState(const PostModel());
    final _key = useState(GlobalKey<FormState>());
    final admin = useProvider(currentUserProvider);
    final year = useProvider(allYearsProvider);
    final yearId = useState(0);
    return SingleChildScrollView(
      child: Form(
        key: _key.value,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(
              height: 10,
            ),
            const Text(
              "NewPost",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Field(
                  max: 1,
                  label: 'Title',
                  validator:
                      RequiredValidator(errorText: "This Field is required"),
                  onChanged: (value) =>
                      _post.value = _post.value.copyWith(title: value)),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Field(
                label: 'Body',
                max: null,
                keyboard: TextInputType.multiline,
                onChanged: (value) =>
                    _post.value = _post.value.copyWith(body: value),
                validator:
                    RequiredValidator(errorText: "This Field is required"),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ButtonWidget(
                text: 'Select File',
                icon: Icons.attach_file,
                onClicked: () async {
                  await selectFile();
                  setState(() {
                    _post.value =
                        _post.value.copyWith(image: basename(file!.path));
                  });
                },
              ),
            ),
            const SizedBox(height: 8),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Field(
                label: fileName,
                max: null,
                keyboard: TextInputType.multiline,
                read: true,
              ),
            ),
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ButtonWidget(
                text: 'Upload File',
                icon: Icons.cloud_upload_outlined,
                onClicked: () async {
                  if (file == null) return;

                  final fileName = basename(file!.path);
                  final destination = 'files/$fileName';

                  task = FirebaseApi.uploadFile(destination, file!);
                  setState(() {});

                  if (task == null) return;

                  final snapshot = await task!.whenComplete(() {});
                  final urlDownload = await snapshot.ref.getDownloadURL();

                  setState(() {
                    _post.value = _post.value.copyWith(image: urlDownload);
                  });
                },
              ),
            ),
            const SizedBox(height: 20),
            task != null ? buildUploadStatus(task!) : Container(),
            const SizedBox(
              height: 10,
            ),
            admin.maybeWhen(
              orElse: () => const SizedBox.shrink(),
              data: (user) => year.maybeWhen(
                orElse: () => const SizedBox.shrink(),
                data: (years) => SizedBox(
                  height: 250,
                  child: CupertinoPicker(
                    looping: true,
                    children: years.classes!
                        .map((e) => Center(
                              child: Text(e.name!),
                            ))
                        .toList(),
                    itemExtent: 46,
                    onSelectedItemChanged: (index) async {
                      yearId.value = years.classes![index].id!;
                    },
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            admin.maybeWhen(
              orElse: () => const SizedBox.shrink(),
              data: (user) => ButtonWidget(
                icon: FontAwesomeIcons.upload,
                text: "Publish Post",
                onClicked: () async {
                  if (_key.value.currentState!.validate()) {
                    _key.value.currentState!.reset();
                    FocusScope.of(context).unfocus();
                    await context.read(createpostUseCaseProvider).execute(
                        CreatepostInput(
                            yearid: user.fulladmin == false
                                ? user.yearid
                                : yearId.value,
                            adminavatar: user.avatar,
                            adminname: user.name,
                            title: _post.value.title,
                            body: _post.value.body,
                            image: _post.value.image));
                  }
                },
              ),
            ),
            const SizedBox(
              height: 100,
            ),
          ],
        ),
      ),
    );
  }

  Future selectFile() async {
    final result = await FilePicker.platform
        .pickFiles(type: FileType.image, allowMultiple: false);

    if (result == null) return;
    final path = result.files.single.path!;

    setState(() => file = File(path));
  }

  Widget buildUploadStatus(UploadTask task) => StreamBuilder<TaskSnapshot>(
        stream: task.snapshotEvents,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final snap = snapshot.data!;
            final progress = snap.bytesTransferred / snap.totalBytes;
            final percentage = (progress * 100).toStringAsFixed(2);
            return Text(
              '$percentage %',
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            );
          } else {
            return Container();
          }
        },
      );
}
