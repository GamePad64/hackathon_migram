import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class ServicesWidget extends StatefulWidget {
  ServicesWidget({Key key}) : super(key: key);

  @override
  _ServicesWidgetState createState() => _ServicesWidgetState();
}

class _ServicesWidgetState extends State<ServicesWidget> with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(),
        ),
        Expanded(
            child: GridView.count(
              primary: false,
              padding: const EdgeInsets.all(20),
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              crossAxisCount: 3,
              children: [
                Center(
                  child: Column(
                    children: [
                      Image.asset(
                        'assets/images/gosu.webp',
                        height: 64.0,
                      ),
                      Text("Госуслуги", style: TextStyle(fontWeight: FontWeight.bold),)
                    ],
                  ),
                ),
                Center(
                  child: Column(
                    children: [
                      Image.asset(
                        'assets/images/yatrans.webp',
                        height: 64.0,
                      ),
                      Text("Переводчик", style: TextStyle(fontWeight: FontWeight.bold),)
                    ],
                  ),
                ),
                Center(
                  child: Column(
                    children: [
                      Image.asset(
                        'assets/images/megafon.webp',
                        height: 64.0,
                      ),
                      Text("Мой мобильный", style: TextStyle(fontWeight: FontWeight.bold),)
                    ],
                  ),
                ),
                Center(
                  child: Column(
                    children: [
                      Image.asset(
                        'assets/images/sber.png',
                        height: 64.0,
                      ),
                      Text("Мой банк", style: TextStyle(fontWeight: FontWeight.bold),)
                    ],
                  ),
                ),
              ],
            )
        )
      ],
    );
  }
}
