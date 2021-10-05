import 'dart:io';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
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
    final fileName = file != null ? basename(file!.path) : 'No File Selected';
    final _post = useState(const PostModel());
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
        child: Form(
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
                  onChanged: (value) => setState(() {
                    _post.value = _post.value.copyWith(body: value);
                  }),
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
              Center(
                child: Text(
                  fileName,
                  style: const TextStyle(
                      fontSize: 16, fontWeight: FontWeight.w500),
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

                    print('Download-Link: $urlDownload');
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
              ButtonWidget(
                  icon: FontAwesomeIcons.upload,
                  text: "Publish Post",
                  onClicked: () async {
                    await context.read(createpostUseCaseProvider).execute(
                        CreatepostInput(
                            yearid: widget.yearid,
                            adminavatar: widget.avatar,
                            adminname: widget.name,
                            title: _post.value.title,
                            body: _post.value.body,
                            image: _post.value.image));
                    Navigator.of(context).pop();
                  })
            ],
          ),
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
