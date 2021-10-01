import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../../application/provider/sharedpref/pref_provider.dart';
import '../../application/provider/years.repository.provider.dart';
import '../../domain/models/classmodel.dart';
import '../../domain/models/yearmodel.dart';
import 'shimmer_affect.dart';

class YearsRow extends HookWidget {
  const YearsRow({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final years = useProvider(allYearsProvider);
    final scrollcontoller = useScrollController();
    return Column(
      children: [
        const Text(
          "Class",
          style: TextStyle(
              fontSize: 20, color: Colors.black, fontWeight: FontWeight.bold),
        ),
        const SizedBox(
          height: 10,
        ),
        years.when(
            data: (years) => SizedBox(
                  height: 80.0,
                  child: ListView.builder(
                      controller: scrollcontoller,
                      scrollDirection: Axis.horizontal,
                      itemCount: years.classes.length,
                      itemBuilder: (context, index) {
                        ClassModel classes = years.classes[index];
                        return ClassWidget(classes, index);
                      }),
                ),
            loading: () => SizedBox(
                  height: 80,
                  child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: 10,
                      itemBuilder: (context, index) {
                        return const ShimmerAffect();
                      }),
                ),
            error: (error, stack) => Center(
                  child: Text('$error'),
                )),
        const SizedBox(
          height: 10,
        )
      ],
    );
  }
}

class ClassWidget extends HookWidget {
  final ClassModel _classModel;
  final int index;

  const ClassWidget(this._classModel, this.index, {Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final role = useState("");
    final disableButton = useState(false);
    final yearId2 = useState(15);
    return Padding(
      padding: const EdgeInsets.all(2.0),
      child: InkWell(
        onTap: () {
          if (_classModel.isclinical == false) {
            context.read(prefChangeNotifierProvider).setYearId2(_classModel.id);
          } else {
            showDialog(
              context: context,
              builder: (context) {
                return StatefulBuilder(
                    builder: (BuildContext context, StateSetter setState) {
                  return AlertDialog(
                    title: const Center(child: Text('Select your class')),
                    content: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        GestureDetector(
                            child: Container(
                              height: 80,
                              width: 80,
                              margin: const EdgeInsets.all(15.0),
                              decoration: BoxDecoration(
                                color: role.value == "Majors"
                                    ? Colors.lightBlue
                                    : Colors.transparent.withOpacity(0.3),
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: const [
                                  Icon(Icons.medical_services),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    "Majors",
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ],
                              ),
                            ),
                            onTap: () async {
                              setState(() {
                                disableButton.value = true;
                                role.value = "Majors";
                                yearId2.value = 9;
                              });
                            }),
                        GestureDetector(
                            child: Container(
                              height: 80,
                              width: 80,
                              margin: const EdgeInsets.all(15.0),
                              decoration: BoxDecoration(
                                color: role.value == "Minors"
                                    ? Colors.lightBlue
                                    : Colors.transparent.withOpacity(0.3),
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: const [
                                  Icon(Icons.medical_services),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    "Minors",
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ],
                              ),
                            ),
                            onTap: () async {
                              setState(() {
                                disableButton.value = true;
                                role.value = "Minors";
                                yearId2.value = 10;
                              });
                            }),
                      ],
                    ),
                    actions: [
                      TextButton(
                        onPressed: () async {
                          Navigator.pop(context);
                        },
                        child:const Text('CANCEL'),
                      ),
                      TextButton(
                        onPressed: () async {
                          context
                              .read(prefChangeNotifierProvider)
                              .setYearId2(yearId2.value);
                          Navigator.pop(context);
                        },
                        child:const Text('ACCEPT'),
                      ),
                    ],
                  );
                });
              },
            );
          }
        },
        child: SizedBox(
          width: 100,
          height: 100,
          child: ListTile(
            title: Image.asset(
              "images/logo.png",
              width: 40,
              height: 40,
            ),
            subtitle: Container(
                alignment: Alignment.topCenter, child: Text(_classModel.name)),
          ),
        ),
      ),
    );
  }
}
