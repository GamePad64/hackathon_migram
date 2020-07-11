import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:url_launcher/url_launcher.dart';
import 'relocation.dart';
import 'orders.dart';
import 'services.dart';
import 'styles.dart';

class EmptyAppBar  extends StatelessWidget implements PreferredSizeWidget {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
  @override
  Size get preferredSize => Size(0.0,0.0);
}

class MainScreen extends StatefulWidget {
  MainScreen({Key key}) : super(key: key);

  @override
  _MainScreenState createState() => _MainScreenState();
}


class _MainScreenState extends State<MainScreen> with TickerProviderStateMixin {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        top: false,
        child: IndexedStack(
          index: _currentIndex,
          children: [RelocationWidget(), OrdersWidget(), ServicesWidget(), Container()],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (int index) {
          setState(() {
            _currentIndex = index;
          });
        },
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.directions_walk),
              title: Text('Переезд')
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.build),
              title: Text('Работа')
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.shopping_basket),
              title: Text('Услуги')
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.chat_bubble),
              title: Text('Поддержка')
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.phone),
        onPressed: () => {
          showDialog(
            context: context,
            builder: (BuildContext context){
              return CupertinoAlertDialog(
                title: Text("Вызов консультанта"),
                content: Text("В случае непридвиденной ситации, вы можете обратиться к нашему консультанту то телефону.\n\nКонсультант принимает звонки круглосуточно"),
                  actions: [
                    FlatButton(
                      child: Text("Вызов"),
                      onPressed: () async {
                        await launch("tel://+75559992233");
                        Navigator.of(context).pop();
                      },
                    ),
                    FlatButton(
                      child: Text("Отмена"),
                      onPressed: (){ Navigator.of(context).pop(); },
                    )
                  ]
              );
            }
          )
        },
      ),
      appBar: AppBar(title: Text("Переезд"),),
    );
  }
}
