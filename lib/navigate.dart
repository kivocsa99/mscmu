import 'package:flutter/material.dart';

void changeScreen(BuildContext context, Widget widget)async{
 await Navigator.push(context, MaterialPageRoute(builder: (context) => widget));
}

void changeScreenReplacement(BuildContext context, Widget widget)async{
 await Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => widget));
}