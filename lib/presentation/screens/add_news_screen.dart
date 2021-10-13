import 'dart:io';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mscmu/application/news/use_cases/create_news.input.dart';
import 'package:mscmu/application/news/use_cases/create_news_use_case.dart';
import 'package:mscmu/application/notifications/use_cases/create_notification_.input.dart';
import 'package:mscmu/application/notifications/use_cases/create_notification_use_case/create_notification_use_case.dart';
import 'package:mscmu/application/provider/current_user.provider.dart';
import 'package:mscmu/application/provider/news.repository.provider.dart';
import 'package:mscmu/domain/models/newsmodel.dart';
import 'package:path/path.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../infrastructure/upload/services/upload.repository.dart';
import '../widgets/button_widget.dart';
import '../widgets/field.dart';

class AddNewsScreen extends StatefulHookWidget {
  const AddNewsScreen({Key? key}) : super(key: key);

  @override
  _AddNewsScreenState createState() => _AddNewsScreenState();
}

class _AddNewsScreenState extends State<AddNewsScreen> {
  UploadTask? task;
  File? file;

  @override
  Widget build(BuildContext context) {
    var fileName = file != null ? basename(file!.path) : 'No File Selected';
    final _news = useState(const NewsModel());
    final _key = useState(GlobalKey<FormState>());
    final admin = useProvider(currentUserProvider);
    return Scaffold(
      body: SingleChildScrollView(
        child: Form(
          key: _key.value,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const SizedBox(
                height: 10,
              ),
              const Text(
                "AddNews",
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
                        _news.value = _news.value.copyWith(title: value)),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Field(
                    max: 1,
                    label: 'Url',
                    validator:
                        RequiredValidator(errorText: "This Field is required"),
                    onChanged: (value) =>
                        _news.value = _news.value.copyWith(url: value)),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ButtonWidget(
                  text: 'Select File',
                  icon: Icons.attach_file,
                  onClicked: () async {
                    await selectFile();
                    setState(() {
                      _news.value =
                          _news.value.copyWith(picture: basename(file!.path));
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
                      _news.value = _news.value.copyWith(picture: urlDownload);
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
                data: (user) => ButtonWidget(
                  icon: FontAwesomeIcons.upload,
                  text: "Publish Post",
                  onClicked: () async {
                    if (_key.value.currentState!.validate()) {
                      _key.value.currentState!.reset();
                      context.read(createNewsUseCaseProvider).execute(
                          CreateNewsInput(
                              url: _news.value.url,
                              picture: _news.value.picture,
                              title: _news.value.title));
                    }
                  },
                ),
              )
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
