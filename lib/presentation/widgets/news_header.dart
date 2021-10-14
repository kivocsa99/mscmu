import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../application/provider/news.repository.provider.dart';
import 'shimmer_affect.dart';

class NewsHeader extends HookWidget {
  const NewsHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final newsprovider = useProvider(allNewsProvider);
    final _index = useState(0);
    final _fbProtocolUrl = useState("");
    final slideController = useState(CarouselController());
    List<Widget> shimmer = [
      const ShimmerAffect(),
      const ShimmerAffect(),
      const ShimmerAffect(),
    ];

    return Expanded(
        flex: 0,
        child: newsprovider.when(
            data: (data) => Column(children: [
                  CarouselSlider(
                    carouselController: slideController.value,
                    items: data!
                        .map((news) => SizedBox(
                              child: GestureDetector(
                                onTap: () async {
                                  if (Platform.isIOS) {
                                    _fbProtocolUrl.value =
                                        "fb://profile/1446249115607763";
                                  } else {
                                    _fbProtocolUrl.value =
                                        'fb://page/1446249115607763';
                                  }
                                  try {
                                    bool launched = await launch(
                                        _fbProtocolUrl.value,
                                        forceSafariVC: false,
                                        forceWebView: false);

                                    if (!launched) {
                                      await launch(news.url!,
                                          forceSafariVC: false,
                                          forceWebView: false);
                                    }
                                  } catch (e) {
                                    await launch(news.url!,
                                        forceSafariVC: false,
                                        forceWebView: false);
                                  }
                                },
                                child: Container(
                                  margin: const EdgeInsets.all(5.0),
                                  child: ClipRRect(
                                      borderRadius: const BorderRadius.all(
                                          Radius.circular(5.0)),
                                      child: Stack(
                                        children: <Widget>[
                                          CachedNetworkImage(
                                            imageUrl: news.picture!,
                                            errorWidget:
                                                (context, url, error) =>
                                                    const Icon(Icons.error),
                                          ),
                                          Positioned(
                                            bottom: 0.0,
                                            left: 0.0,
                                            right: 0.0,
                                            child: Container(
                                              decoration: const BoxDecoration(
                                                gradient: LinearGradient(
                                                  colors: [
                                                    Color.fromARGB(
                                                        200, 0, 0, 0),
                                                    Color.fromARGB(0, 0, 0, 0)
                                                  ],
                                                  begin: Alignment.bottomCenter,
                                                  end: Alignment.topCenter,
                                                ),
                                              ),
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      vertical: 10.0,
                                                      horizontal: 20.0),
                                              child: Text(
                                                news.title!,
                                                style: const TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 20.0,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      )),
                                ),
                              ),
                            ))
                        .toList(),
                    options: CarouselOptions(
                      autoPlay: true,
                      enlargeCenterPage: true,
                      aspectRatio: 2.0,
                      onPageChanged: (index, reason) {
                        _index.value = index;
                      },
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: data.asMap().entries.map((entry) {
                      return GestureDetector(
                        onTap: () {
                          slideController.value.animateToPage(entry.key);
                        },
                        child: Container(
                          width: 12.0,
                          height: 12.0,
                          margin: const EdgeInsets.symmetric(
                              vertical: 8.0, horizontal: 4.0),
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: (Theme.of(context).brightness ==
                                          Brightness.dark
                                      ? Colors.white
                                      : Colors.black)
                                  .withOpacity(
                                      _index.value == entry.key ? 0.9 : 0.4)),
                        ),
                      );
                    }).toList(),
                  ),
                ]),
            loading: () => CarouselSlider(
                  carouselController: slideController.value,
                  items: shimmer
                      .map((image) => SizedBox(
                            child: Container(
                              margin: const EdgeInsets.all(5.0),
                              child: ClipRRect(
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(5.0)),
                                  child: Stack(
                                    children: <Widget>[
                                      image,
                                    ],
                                  )),
                            ),
                          ))
                      .toList(),
                  options: CarouselOptions(
                    autoPlay: true,
                    enlargeCenterPage: true,
                    aspectRatio: 2.0,
                    onPageChanged: (index, reason) {
                      _index.value = index;
                    },
                  ),
                ),
            error: (error, stack) => Center(
                  child: Text("$error"),
                )));
  }
}
