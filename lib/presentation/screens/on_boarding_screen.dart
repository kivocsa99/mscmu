import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'welcome_screen.dart';

class OnBoardingScreen extends HookWidget {
  const OnBoardingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _introKey = useState(GlobalKey<IntroductionScreenState>());

    void _onIntroEnd(context) {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (_) => const WelcomeScreen()),
      );
    }

    Widget _buildImage(String assetName, [double width = 250]) {
      return Image.asset('images/$assetName', width: width);
    }

    const bodyStyle = TextStyle(fontSize: 19.0);

    const pageDecoration = PageDecoration(
      titleTextStyle: TextStyle(fontSize: 28.0, fontWeight: FontWeight.w700),
      bodyTextStyle: bodyStyle,
      descriptionPadding: EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 16.0),
      pageColor: Colors.white,
      imagePadding: EdgeInsets.zero,
    );

    return IntroductionScreen(
      key: _introKey.value,
      globalBackgroundColor: Colors.white,
      globalHeader: Align(
        alignment: Alignment.topRight,
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.only(top: 16, right: 16),
            child: _buildImage('logo.png', 100),
          ),
        ),
      ),
      globalFooter: SizedBox(
        width: double.infinity,
        height: 60,
        child: ElevatedButton(
          child: const Text(
            'Lets me start NOW!',
            style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
          ),
          onPressed: () => _onIntroEnd(context),
        ),
      ),
      pages: [
        PageViewModel(
          title: "Let's Start Our journey",
          body:
              "Instead of having to go to our website , we provided this app for you !",
          image: _buildImage('logo.png'),
          decoration: pageDecoration,
        ),
        PageViewModel(
          title: "Learn as you go",
          body:
              "Download the mscmu app and get access to all of your lecturesand class News.",
          image: _buildImage('img3.jpg'),
          decoration: pageDecoration,
        ),
        PageViewModel(
          title: "Download , play and Share",
          body:
              "Download your lectures and Play all of your records , you can even SHARE!",
          image: _buildImage('img3.jpg'),
          decoration: pageDecoration,
        ),
      ],
      onDone: () => _onIntroEnd(context),
      showSkipButton: true,
      skipFlex: 0,
      nextFlex: 0,
      skip: const Text('Skip'),
      next: const Icon(Icons.arrow_forward),
      done: const Text('Done', style: TextStyle(fontWeight: FontWeight.w600)),
      curve: Curves.fastLinearToSlowEaseIn,
      controlsMargin: const EdgeInsets.all(16),
      controlsPadding: const EdgeInsets.fromLTRB(8.0, 4.0, 8.0, 4.0),
      dotsDecorator: const DotsDecorator(
        size: Size(10.0, 10.0),
        color: Color(0xFFBDBDBD),
        activeSize: Size(22.0, 10.0),
        activeShape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(25.0)),
        ),
      ),
      dotsContainerDecorator: const ShapeDecoration(
        color: Colors.black87,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(8.0)),
        ),
      ),
    );
  }
}
