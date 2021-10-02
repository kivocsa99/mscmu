import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactusScreen extends HookWidget {
  const ContactusScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        // mainAxisAlignment: MainAxisAlignment.,
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
                try {
                  bool launched = await launch('fb://page/1446249115607763',
                      forceSafariVC: false);

                  if (!launched) {
                    await launch(
                        'https://www.facebook.com/medicine.surgery.mutah',
                        forceSafariVC: false);
                  }
                } catch (e) {
                  await launch(
                      'https://www.facebook.com/medicine.surgery.mutah',
                      forceSafariVC: false);
                }
              },
              child: const ListTile(
                leading: Icon(Icons.facebook),
                title: Text("medicine.surgery.mutah"),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
