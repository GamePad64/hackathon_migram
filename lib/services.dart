import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'dart:core';


extension IndexedIterable<E> on Iterable<E> {
  Iterable<T> mapIndexed<T>(T f(E e, int i)) {
    var i = 0;
    return this.map((e) => f(e, i++));
  }
}


class ServicesWidget extends StatefulWidget {
  ServicesWidget({Key key}) : super(key: key);

  @override
  _ServicesWidgetState createState() => _ServicesWidgetState();
}

class _ServicesWidgetState extends State<ServicesWidget> with TickerProviderStateMixin {
  final List<String> entry_text = <String>['Госуслуги', 'Переводчик', 'Мой мобильный', 'Мой банк', 'Налоговая служба', 'Пенсионный фонд', 'Мои Документы', 'Трудовая Евразия'];
  List<String> entry_img = ['gosu', 'yatrans', 'megafon', 'sber', 'fns', 'pfr', 'mfc', 'eurasia'];
  List<String> entry_link = ['https://gosuslugi.ru', 'https://translate.yandex.ru/?lang=uz-ru', 'https://megafon.ru', 'https://online.sberbank.ru', 'https://nalog.ru', 'http://www.pfrf.ru/', 'https://md.mos.ru/', 'https://vk.com/eurasialabor'];

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
            children:
              entry_text.mapIndexed((element, index) {
                return Center(
                  child: GestureDetector(
                    onTap: () async {
                      await launch(entry_link[index]);
                    },
                    child: Column(
                      children: [
                        Image.asset(
                          'assets/images/${entry_img[index]}.webp',
                          height: 64.0,
                        ),
                        Text(element, style: TextStyle(fontWeight: FontWeight.bold), textAlign: TextAlign.center,)
                      ],
                    ),
                  ),
                );
              }).toList()
          )
        )
      ],
    );
  }
}
