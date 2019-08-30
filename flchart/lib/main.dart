import 'dart:async';

import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/rendering.dart';

void main() {
  debugPaintSizeEnabled = true;
  runApp(MyApp()); 
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  
  StreamController<LineTouchResponse> controller;

  @override
  void initState() {
    super.initState();

    controller = StreamController();
    controller.stream.distinct().listen((LineTouchResponse response){});
  }

  @override
  void dispose() {
    super.dispose();
    controller.close();
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Container(
        margin: EdgeInsets.only(top: 50.0),
        width: double.infinity,
        height: 300,
        child: FlChart(
          chart: LineChart(
            LineChartData(
              lineTouchData: LineTouchData(
                touchResponseSink: controller.sink,
                touchTooltipData: TouchTooltipData(
                  tooltipBgColor: Colors.blueGrey.withOpacity(0.8)
                )
              ),
              // gridData: FlGridData(
              //   show: true
              // ),
              // titlesData: FlTitlesData(
              //   leftTitles: SideTitles(
              //     showTitles: true,
              //     textStyle: TextStyle(
              //       color: Color(0xff75729e),
              //       fontWeight: FontWeight.bold,
              //       fontSize: 14,
              //     ),
              //     getTitles: (value) {
              //       switch(value.toInt()) {
              //         case 1: return '1m';
              //         case 2: return '2m';
              //         case 3: return '3m';
              //         case 4: return '5m';
              //       }
              //       return '';
              //     },
              //     margin: 8,
              //     reservedSize: 30,
              //   ),
              //   bottomTitles: SideTitles(
              //     showTitles: true,
              //     reservedSize: 22,
              //     textStyle: TextStyle(
              //       color: const Color(0xff72719b),
              //       fontWeight: FontWeight.bold,
              //       fontSize: 16,
              //     ),
              //     margin: 10,
              //     getTitles: (value) {
              //       switch(value.toInt()) {
              //         case 2:
              //           return 'SEPT';
              //         case 7:
              //           return 'OCT';
              //         case 12:
              //           return 'DEC';
              //       }
              //       return '';
              //     },
              //   ),
              // ),
              borderData: FlBorderData(
                show: false,
                border: Border(
                  bottom: BorderSide(
                    color: Colors.red,
                    width: 2,
                  ),
                  left: BorderSide(
                    color: Colors.transparent,
                  ),
                  right: BorderSide(
                    color: Colors.transparent,
                  ),
                  top: BorderSide(
                    color: Colors.transparent,
                  ),
                )
              ),
              minX: 0,
              maxX: 14,
              maxY: 4,
              minY: 0,
              lineBarsData: [
                LineChartBarData(
                  spots: [
                    /* Down */
                    FlSpot(0, 0),
                    /* Middle */
                    FlSpot(1, 0.3),
                    /* Up */
                    FlSpot(2.5, 1),
                    FlSpot(3.5, 1.2),
                    FlSpot(4.5, 1.15),
                    /* Down */
                    FlSpot(5.3, 0.9),
                    /* Middle */
                    FlSpot(6.5, 0.5),
                    /* Down */
                    FlSpot(7.3, 0.4),
                    FlSpot(8.3, 0.5),
                    /* Middle */
                    FlSpot(9.5, 1),
                    FlSpot(10.3, 1.25),
                    /* Up */
                    FlSpot(11, 1.35),
                    FlSpot(12, 1.45),
                    // /* Up */
                    // /* Down */
                    // FlSpot(15.3, 1.1)
                  ],
                  isCurved: true,
                  colors: [
                    Color(0xff4af699),
                  ],
                  barWidth: 5,
                  isStrokeCapRound: true,
                  dotData: FlDotData(
                    show: false,
                  ),
                  belowBarData: BelowBarData(
                    show: false,
                  ),
                ),
              ],
            )
          ),
        ),
      )// This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
