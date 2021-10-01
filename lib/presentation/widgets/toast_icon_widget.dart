import 'package:flutter/material.dart';
import 'package:flutter_styled_toast/flutter_styled_toast.dart';


///
///created time: 2019-06-25 16:42
///author linzhiliang
///version 1.5.0
///since
///file name: toast_content_widget.dart
///description: Toast with icon
///
class IconToastWidget extends StatelessWidget {
  final Key? key;
  final Color? backgroundColor;
  final String? message;
  final Widget? textWidget;
  final double? height;
  final double? width;
  final IconData? icon;
  final EdgeInsetsGeometry? padding;

  const IconToastWidget({
    this.key,
    this.backgroundColor,
    this.textWidget,
    this.message,
    this.height,
    this.width,
    @required this.icon,
    this.padding,
  }) : super(key: key);

  factory IconToastWidget.fail({String? msg}) => IconToastWidget(
        message: msg,
        icon:Icons.dangerous ,
      );

  factory IconToastWidget.success({String? msg}) => IconToastWidget(
        message: msg,
        icon:Icons.check_circle_outline,
      );

  @override
  Widget build(BuildContext context) {
    Widget content = Material(
      color: Colors.transparent,
      child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 50.0),
          padding: padding,
          decoration: ShapeDecoration(
            color: backgroundColor ?? const Color(0x9F000000),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
          ),
          child: Wrap(
            alignment: WrapAlignment.spaceEvenly,
            crossAxisAlignment: WrapCrossAlignment.center,
            children: <Widget>[
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 5.0),
                child: Icon(icon)
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 5.0),
                child: textWidget,
              ),
            ],
          )),
    );

    return content;
  }
}

///
///created time: 2019-06-17 16:22
///author linzhiliang
///version 1.5.0
///since
///file name: styled_toast.dart
///description: Banner type toast widget, example of custom toast content widget when you use [showToastWidget]
///
class BannerToastWidget extends StatelessWidget {
  final Key? key;
  final Color? backgroundColor;
  final String? message;
  final Widget? textWidget;
  final double? offset;
  final double? height;
  final double? width;

  const BannerToastWidget(
      {this.key,
      this.backgroundColor,
      this.textWidget,
      this.message,
      this.height,
      this.width,
      this.offset})
      : super(key: key);

  factory BannerToastWidget.success(
          {String? msg, Widget? text, BuildContext? context}) =>
      BannerToastWidget(
        backgroundColor: context != null
            ? Theme.of(context).toggleableActiveColor
            : Colors.green,
        message: msg,
        textWidget: text,
      );

  factory BannerToastWidget.fail(
          {String? msg, Widget? text, BuildContext? context}) =>
      BannerToastWidget(
        backgroundColor: context != null
            ? Theme.of(context).errorColor
            : const Color(0xEFCC2E2E),
        message: msg,
        textWidget: text,
      );

  @override
  Widget build(BuildContext context) {
    Widget content = Container(
      width: MediaQuery.of(context).size.width,
      padding: const EdgeInsets.all(17.0),
      height: 60.0,
      alignment: Alignment.center,
      color: backgroundColor ?? Theme.of(context).backgroundColor,
      child: textWidget ??
          Text(
            message ?? '',
            style: const TextStyle(fontSize: 16, color: Colors.white),
          ),
    );

    return content;
  }
}

