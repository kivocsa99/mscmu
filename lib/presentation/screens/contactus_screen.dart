import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactusScreen extends HookWidget {
  const ContactusScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(
          height: 10,
        ),
        Image.asset("images/logo.png"),
        Divider(
          thickness: 5,
          color: Colors.blue[100],
        ),
        const Center(
          child: Text(
            "You Can Always Reach Us On :",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Container(
          padding: const EdgeInsets.all(15.0),
          child: GestureDetector(
            onTap: () async {
              //todo iphone
              try {
                bool launched = await launch('fb://page/1446249115607763',
                    forceSafariVC: false, forceWebView: false);

                if (!launched) {
                  await launch(
                      'https://www.facebook.com/medicine.surgery.mutah',
                      forceSafariVC: false,
                      forceWebView: false);
                }
              } catch (e) {
                await launch('https://www.facebook.com/medicine.surgery.mutah',
                    forceSafariVC: false, forceWebView: false);
              }
            },
            child: const ListTile(
              leading: Icon(FontAwesomeIcons.facebookSquare),
              title: Text("medicine.surgery.mutah"),
            ),
          ),
        ),
        Container(
          padding: const EdgeInsets.all(15.0),
          child: GestureDetector(
            onTap: () async {
              await launch(
                  'https://www.youtube.com/channel/UC7HSntyIHRgjY7S-Si1nhVg',
                  forceSafariVC: false,
                  forceWebView: false);
            },
            child: const ListTile(
              leading: Icon(FontAwesomeIcons.youtube),
              title: Text("Msc-Mu Youtube"),
            ),
          ),
        ),
      ],
    );
  }
}
