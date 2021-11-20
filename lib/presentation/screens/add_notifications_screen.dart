import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:mscmu/application/notifications/use_cases/create_notification_.input.dart';
import 'package:mscmu/application/notifications/use_cases/create_notification_use_case/create_notification_use_case.dart';
import 'package:mscmu/application/provider/years.repository.provider.dart';
import 'package:mscmu/domain/models/notificationmodel.dart';
import 'package:mscmu/presentation/widgets/button_widget.dart';
import 'package:mscmu/presentation/widgets/field.dart';
import 'package:mscmu/presentation/widgets/shimmer_affect.dart';

class AddNotificationsScreen extends HookWidget {
  const AddNotificationsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _notification = useState(const NotificationsModel());
    final _key = useState(GlobalKey<FormState>());
    final years = useProvider(allYearsProvider);
    final yearId = useState(15);
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
              "NewNotification",
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
                  onChanged: (value) => _notification.value =
                      _notification.value.copyWith(title: value)),
            ),
            years.when(
              data: (years) => Column(children: [
                SizedBox(
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
                const SizedBox(
                  height: 10,
                ),
              ]),
              loading: () => const ShimmerAffect(height: 100, width: 100),
              error: (error, stack) => Center(
                child: Text("$error"),
              ),
            ),
            ButtonWidget(
                icon: FontAwesomeIcons.upload,
                text: "Publish Notification",
                onClicked: () async {
                  if (_key.value.currentState!.validate()) {
                    _key.value.currentState!.reset();
                    FocusScope.of(context).unfocus();
                    await context
                        .read(createNotificationUseCaseProvider)
                        .execute(CreateNotificationInput(
                          yearid: yearId.value,
                          title: _notification.value.title,
                        ));
                  }
                })
          ],
        ),
      ),
    );
  }
}
