import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../../application/provider/folders.repository.provider.dart';
import '../../navigate.dart';
import 'sharedcontent_screen.dart';
import '../widgets/shimmer_affect.dart';

class MainFoldersScreen extends HookWidget {
  final int? id;

  const MainFoldersScreen({Key? key, this.id}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final scrollController = useScrollController();
    final mainfolders = useProvider(mainFoldersProvider(id!));
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
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          const SizedBox(
            height: 30,
          ),
          mainfolders.when(
              data: (data) => data.fold((l) => Text(l.toString()), (r) {
                    return r != null
                        ? ListView.separated(
                            separatorBuilder: (context, index) =>
                                const Divider(),
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemBuilder: (context, index) {
                              return ListTile(
                                onTap: () {
                                  changeScreen(context,
                                      SharedContentScreen(id: r[index].id));
                                },
                                leading: const Icon(FontAwesomeIcons.folder),
                                title: Text("${r[index].name}"),
                              );
                            },
                            itemCount: r.length,
                            controller: scrollController,
                            scrollDirection: Axis.vertical,
                          )
                        : const SizedBox.shrink();
                  }),
              loading: () => ListView.separated(
                    separatorBuilder: (context, index) => const Divider(),
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) => const ShimmerAffect(
                      height: 50,
                      width: 100,
                    ),
                    itemCount: 4,
                    controller: scrollController,
                    scrollDirection: Axis.vertical,
                  ),
              error: (error, _) => Center(child: Text("$error"))),
        ]),
      ),
    );
  }
}
