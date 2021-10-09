import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import '../widgets/archives.dart';
import '../widgets/courses.dart';

class LibraryScreen extends HookWidget {
  const LibraryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 1,
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          bottom: TabBar(
              unselectedLabelColor: Colors.blue,
              indicatorSize: TabBarIndicatorSize.tab,
              indicator: BoxDecoration(
                  gradient:const LinearGradient(
                      colors: [Colors.blueGrey, Colors.blueAccent]),
                  borderRadius: BorderRadius.circular(50),
                  color: Colors.redAccent),
              tabs:const [
                Tab(
                  child: Align(
                    alignment: Alignment.center,
                    child: Text("Archives"),
                  ),
                ),
                Tab(
                  child: Align(
                    alignment: Alignment.center,
                    child: Text("Courses"),
                  ),
                ),
              ]),
        ),
        body: const TabBarView(children: [
          Archive(),
          Courses(),
        ]),
      ),
    );
  }
}
