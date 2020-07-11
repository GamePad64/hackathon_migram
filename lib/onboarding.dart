import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hackathon_trud/login.dart';
import 'package:introduction_screen/introduction_screen.dart';

class OnBoardingPage extends StatefulWidget {
  @override
  _OnBoardingPageState createState() => _OnBoardingPageState();
}

class _OnBoardingPageState extends State<OnBoardingPage> {
  final introKey = GlobalKey<IntroductionScreenState>();

  void _onIntroEnd(context) {
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(builder: (_) => LoginScreen()),
    );
  }

  Widget _buildImage(String assetName) {
    return Align(
      child: SvgPicture.asset('assets/images/$assetName.svg', width: 350.0),
      alignment: Alignment.bottomCenter,
    );
  }

  @override
  Widget build(BuildContext context) {
    const bodyStyle = TextStyle(fontSize: 19.0);
    const pageDecoration = const PageDecoration(
      titleTextStyle: TextStyle(fontSize: 28.0, fontWeight: FontWeight.w700),
      bodyTextStyle: bodyStyle,
      descriptionPadding: EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 16.0),
      pageColor: Colors.white,
      imagePadding: EdgeInsets.zero,
    );

    return IntroductionScreen(
      key: introKey,
      pages: [
        PageViewModel(
          title: "Поможем с релокацией в Россию",
          body:
          "Мы проконсультируем по вопросам покупки билетов, релокации и легализации в России.",
          image: _buildImage('undraw_aircraft_fbvl'),
          decoration: pageDecoration,
        ),
        PageViewModel(
          title: "Поможем с заселением",
          body:
          "Мы подберём вам жильё по средствам в соответствии с вашими требованиями.",
          image: _buildImage('undraw_quite_town_mg2q'),
          decoration: pageDecoration,
        ),
        PageViewModel(
          title: "Трудоустройство для рабочих",
          body:
          "В приложении есть список рабочих заданий. Вы можете принять задание и получить деньги на карту в тот же день.",
          image: _buildImage('undraw_Directions_re_kjxs'),
          decoration: pageDecoration,
        ),
        PageViewModel(
          title: "Поможем с вопросами легализации",
          body: "Мы расскажем, какие документы вам потребуются, чтобы легально устроиться на работу в России.",
          image: _buildImage('undraw_user_flow_vr6w'),
          decoration: pageDecoration,
        ),
      ],
      onDone: () => _onIntroEnd(context),
      //onSkip: () => _onIntroEnd(context), // You can override onSkip callback
      showSkipButton: true,
      skipFlex: 0,
      nextFlex: 0,
      skip: const Text('Пропустить'),
      next: const Icon(Icons.arrow_forward),
      done: const Text('Далее', style: TextStyle(fontWeight: FontWeight.w600)),
      dotsDecorator: const DotsDecorator(
        size: Size(10.0, 10.0),
        color: Color(0xFFBDBDBD),
        activeSize: Size(22.0, 10.0),
        activeShape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(25.0)),
        ),
      ),
    );
  }
}
