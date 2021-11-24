import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mscmu/application/posts/use_cases/edit_post/edit_post_input.dart';
import 'package:mscmu/application/posts/use_cases/edit_post/edit_post_use_case.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../constants.dart';
import '../../domain/models/postmodel.dart';
import '../widgets/button_widget.dart';
import '../widgets/field.dart';

class EditPostScreen extends HookWidget {
  final PostModel? post;

  const EditPostScreen({this.post, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _key = useState(GlobalKey<FormState>());
    final _post = useState(const PostModel());
    return Scaffold(
      appBar: appbar(),
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
                "EditPost",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Field(
                    initial: post!.title,
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
                  initial: post!.body,
                  label: 'Body',
                  max: null,
                  keyboard: TextInputType.multiline,
                  onChanged: (value) =>
                      _post.value = _post.value.copyWith(body: value),
                  validator:
                      RequiredValidator(errorText: "This Field is required"),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              ButtonWidget(
                icon: FontAwesomeIcons.upload,
                text: "Edit Post",
                onClicked: () async {
                  if (_key.value.currentState!.validate()) {
                    _key.value.currentState!.reset();
                    FocusScope.of(context).unfocus();
                    await context.read(editPostProvider).execute(EditPostInput(
                          id: post!.id,
                          title: _post.value.title != post!.title
                              ? _post.value.title
                              : post!.title,
                          body: _post.value.body != post!.body
                              ? _post.value.body
                              : post!.body,
                        ));
                    Navigator.pop(context);
                  }
                },
              ),
              const SizedBox(
                height: 100,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
