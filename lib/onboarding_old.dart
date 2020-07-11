import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'mainscreen.dart';
import 'styles.dart';

class OnboardingScreen extends StatefulWidget {
  _OnboardingScreenState createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final int _num_pages = 3;

  final PageController _pageController = PageController(initialPage: 0);
  int _current_page = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
//      appBar: AppBar(
//        title: Text('widget.title'),
//      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            stops: [0,1],
            colors: [
              Color(0xFF3594DD),
              Color(0xFF5B16D0),
            ]
          )
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 40.0, horizontal: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                height: 500.0,
                child: PageView(
                  physics: ClampingScrollPhysics(),
                  controller: _pageController,
                  onPageChanged: (int page){
                    setState(() {
                      _current_page = page;
                    });
                  },
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Column(
                        children: [
                          Center(
                              child: SvgPicture.asset(
                                  'assets/images/undraw_aircraft_fbvl.svg',
                                height: 200.0,
                              )
                          ),
                          SizedBox(height: 30.0,),
                          Text("Решение \"всё в одном\" для успешного переезда в Россию", style: kTitleStyle, textAlign: TextAlign.center,),
                          SizedBox(height: 30.0,),
                          Text("Поможем с покупкой билетов, оформлением документов, заселением в жильё и поиском работы", style: kSubtitleStyle,)
                        ],
                      ),
                    )
                  ],
                ),
              ),
              RaisedButton(
                color: Colors.black,
                onPressed: (){},
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset('assets/images/salamport.png', width: 30, height: 30,),
                    Text("SalamPort ID", style: TextStyle(color: Colors.white)),
                  ],
                ),
              ),
              RaisedButton(
                color: Colors.white,
                onPressed: (){},
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset('assets/images/sber.png', width: 30, height: 30,),
                    Text("Сбербанк ID", style: TextStyle(color: Colors.black),),
                  ],
                ),
              ),
              RaisedButton(
                color: Colors.white,
                onPressed: (){ Navigator.push(context, MaterialPageRoute(builder: (ctxt) => MainScreen()));},
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.phone_android, color: Colors.black54,),
                    Text("Регистрация по номеру телефона", style: TextStyle(color: Colors.black)),
                  ],
                ),
              ),
            ],
          ),
        ),
      )
    );
  }
}
