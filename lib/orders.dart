import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:steps_indicator/steps_indicator.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';
import 'package:url_launcher/url_launcher.dart';
import 'styles.dart';

class OrdersWidget extends StatefulWidget {
  OrdersWidget({Key key}) : super(key: key);

  @override
  _OrdersWidgetState createState() => _OrdersWidgetState();
}

class _OrdersWidgetState extends State<OrdersWidget> with TickerProviderStateMixin {
  List<bool> entryChecks = [false, false];
  List<String> entry_workcount = ['4 работника', '20 работников', '1 работник'];
  List<String> entry_cal = ['16.07.2020', '16.07.2020', '17.07.2020'];
  List<String> entry_time = ['c 07:00 до 19:00', 'c 14:00 до 19:00', 'c 09:00 до 21:00'];
  List<String> entry_address = ['Россия, Москва, район Некрасовка, ул. Рождественская, д. 6', 'Россия, Москва, район Хамовники, ул. Льва Толстого, д. 16', 'Россия, Москва, метро Краснопресненская'];
  List<String> entry_salary = ['1000 ₽', '1800 ₽', '4000 ₽'];
  List<String> entry_headcount = ['1 / 4', '18 / 20', '0 / 1'];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        child: ListView.builder(
            padding: const EdgeInsets.all(8),
            itemCount: entry_workcount.length,
            itemBuilder: (BuildContext context, int index) {
              return Card(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ListTile(
                      title: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Flexible(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Icon(Icons.person),
                                    Text(
                                      '${entry_workcount[index]}',
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ],
                                ),
                                SizedBox(height: 8.0,),
                                Container(
                                  child: Container(
                                    child: Row(
                                      children: [
                                        Icon(Icons.calendar_today),
                                        Flexible(
                                          child: Text(
                                            '${entry_cal[index]}',
                                            softWrap: true,
                                          ),
                                        ),
                                        Icon(Icons.timer),
                                        Flexible(
                                          child: Text(
                                            '${entry_time[index]}',
                                            softWrap: true,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                SizedBox(height: 8.0,),
                                Text(entry_address[index], softWrap: true,)
                              ]
                            ),
                          ),
                          Column(
                            children: [
                              Card(
                                color: Colors.lime,
                                child: Padding(
                                  padding: const EdgeInsets.all(4.0),
                                  child: Text(entry_salary[index], style: TextStyle(fontWeight: FontWeight.bold),),
                                ),
                              ),
                              Card(
                                color: Colors.greenAccent,
                                child: Padding(
                                  padding: const EdgeInsets.all(4.0),
                                  child: Row(
                                    children: [
                                      Icon(Icons.person, size: 16.0,),
                                      Text(entry_headcount[index], style: TextStyle(fontWeight: FontWeight.bold),),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          )
                        ]
                      ),
                    ),
                  )
              );
            })
    );
  }
}
