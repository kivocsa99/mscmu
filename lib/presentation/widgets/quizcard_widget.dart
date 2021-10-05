import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class QuizCardWidget extends StatelessWidget {
  final String title;
  final VoidCallback onTap;

  const QuizCardWidget({
    Key? key,
    required this.title,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            border: const Border.fromBorderSide(
              BorderSide(
                color: Colors.blue,
              ),
            ),
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 40,
                width: 40,
                child: Icon(FontAwesomeIcons.questionCircle),
              ),
              const SizedBox(
                height: 24,
              ),
              Text(
                title,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.w400,
                ),
              ),
              const SizedBox(
                height: 24,
              ),
            ],
          )),
    );
  }
}
