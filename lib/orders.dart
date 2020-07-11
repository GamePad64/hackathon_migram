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
  TabController _tabController;

  List<bool> entryChecks = [false, false];
  final List<String> entries = <String>['Разрешение на работу / Патент', 'Созвон с агентством по найму'];
  List<String> entry_desc = ['Направьтесь в консульство России в Ташкенте\nПолучите разрешение на работу.\n\nАдрес консульства: Ташкент, ул. Нукус, 83.\nтел. (8-10-998-71) 120-35-04 (круглосуточно)', ''];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            height: 160,
            child: SfRadialGauge(
              axes: [
                RadialAxis(
                  startAngle: 90, endAngle: (90.0+360.0),
                  minimum: 0, maximum: 13, interval: 1, showLabels: false, showTicks: false,
                  pointers: [
                    RangePointer(value: 6)
                  ],
                  annotations: [
                    GaugeAnnotation(
                      widget: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text("6 / 13", style: TextStyle(fontWeight: FontWeight.w200, fontSize: 40),),
                          Text("Задач выполнено", style: TextStyle(fontWeight: FontWeight.w400, fontSize: 12),)
                        ],
                      )
                    )
                  ]
                )
              ],
            ),
          ),
        ),
        TabBar(
          tabs: [
            Tab(text: "Перед релокацией",),
            Tab(text: "После релокации",),
          ],
          controller: _tabController,
          labelColor: Colors.black54,
        ),
        Expanded(
          child: TabBarView(
            controller: _tabController,
            children: [
              Container(
                child: ListView.builder(
                  padding: const EdgeInsets.all(8),
                  itemCount: entries.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Container(
                      child: Card(
                        child: ExpansionTile(
                          title: Row(children: [
                            Checkbox(
                              value: entryChecks[index],
                              onChanged: (bool newValue) {
                                setState(() {
                                  entryChecks[index] = newValue;
                                });
                              }
                            ),
                            Flexible(child: Text('${entries[index]}', overflow: TextOverflow.ellipsis,),),
                          ]),
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text('${entry_desc[index]}', overflow: TextOverflow.ellipsis,),
                            )
                          ],
                        )
                      ),
                    );
                  })
              ),
              Text("Tab 2"),
            ],
          ),
        )
      ],
    );
  }
}
