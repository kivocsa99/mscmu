import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:mscmu/application/provider/all_users.provider.dart';
import 'package:mscmu/application/provider/user.repository.provider.dart';
import 'package:mscmu/domain/models/adminmodel.dart';

class Management extends HookWidget {
  const Management({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    List<AdminModel> accepted;
    List<AdminModel> unAccepted;

    final allUsers = useProvider(allUserProvider);
    return allUsers.maybeWhen(
      orElse: () => const SizedBox.shrink(),
      data: (users) {
        accepted = users.where((admin) => admin.accepted == true).toList();
        unAccepted = users.where((admin) => admin.accepted == false).toList();
        return SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(
                height: 10,
              ),
              const Text("NON-ACCEPTED USERS"),
              ListView.separated(
                separatorBuilder: (context, index) => const Divider(),
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (BuildContext context, index) {
                  return ListTile(
                    leading: const Icon(FontAwesomeIcons.user),
                    title: Text(unAccepted[index].name!),
                    trailing: GestureDetector(
                        onTap: () => context
                            .read(adminRepositoryProvider)
                            .acceptedAdmin(unAccepted[index].id!),
                        child: const Icon(
                          FontAwesomeIcons.checkCircle,
                          color: Colors.green,
                        )),
                  );
                },
                itemCount: unAccepted.length,
              ),
              const Text("ACCEPTED USERS"),
              ListView.separated(
                separatorBuilder: (context, index) => const Divider(),
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (BuildContext context, index) {
                  return ListTile(
                    leading: const Icon(FontAwesomeIcons.user),
                    title: Text(accepted[index].name!),
                    subtitle: Text(accepted[index].email!),
                    trailing: GestureDetector(
                        onTap: () => context
                            .read(adminRepositoryProvider)
                            .unacceptAdmin(accepted[index].id!),
                        child: const Icon(
                          FontAwesomeIcons.timesCircle,
                          color: Colors.red,
                        )),
                  );
                },
                itemCount: accepted.length,
              ),
            ],
          ),
        );
      },
    );
  }
}
