import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:mscmu/application/provider/current_user.provider.dart';
import '../widgets/news_header.dart';
import '../widgets/posts.dart';
import '../widgets/yearsrow.dart';

class MainScreen extends HookWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: const [
            NewsHeader(),
            YearsRow(),
            Posts(),
            SizedBox(
              height: 50,
            )
          ],
        ),
      ),
    );
  }
}
