import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'dart:math';
import 'package:flutter_circular_chart/flutter_circular_chart.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) => AnimatedMyChart()
      },
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
    );
  }
}

class AnimatedMyChart extends StatelessWidget{
  final GlobalKey<AnimatedCircularChartState> _chartKey = new GlobalKey<AnimatedCircularChartState>();
  List<CircularStackEntry> data = <CircularStackEntry>[
    new CircularStackEntry([
      CircularSegmentEntry(500.0, Colors.red[200], rankKey: 'Q1')
    ], rankKey: 'Quarterly Profits')
  ];
  Widget build(BuildContext context) {
    return AnimatedCircularChart(
      duration: Duration(seconds: 1),
      startAngle: 180.0,
      key: _chartKey,
      size: Size(300.0, 300.0),
      percentageValues: true,
      holeLabel: '100%',
      labelStyle: new TextStyle(
        color: Colors.blueGrey[600],
        fontWeight: FontWeight.bold,
        fontSize: 24.0,
      ),
      edgeStyle: SegmentEdgeStyle.flat,
      initialChartData: <CircularStackEntry>[
        new CircularStackEntry(
          <CircularSegmentEntry>[
            new CircularSegmentEntry(
              45.0,
              Colors.blue[400], 
              rankKey: 'completed',
            ),
            // new CircularSegmentEntry(
            //   90.0,
            //   Colors.red,
            //   rankKey: 'remaining',
            // ),
          ],
          rankKey: 'progress',
        ),
      ],
      chartType: CircularChartType.Radial,
    );
  }
}

// class GaugeChart extends StatelessWidget {
//   final List<charts.Series> seriesList;
//   final bool animate;
//   GaugeChart(this.seriesList, {this.animate});

//   /// Creates a [PieChart] with sample data and no transition.
//   factory GaugeChart.withSampleData() {
//     return new GaugeChart(
//       _createSampleData(),
//       // Disable animations for image tests.
//       animate: true,
//     );
//   }


//   @override
//   Widget build(BuildContext context) {
//     return new charts.PieChart(seriesList,
//         animate: true,
//         animationDuration: Duration(seconds: 1),
//         // Configure the width of the pie slices to 30px. The remaining space in
//         // the chart will be left as a hole in the center. Adjust the start
//         // angle and the arc length of the pie so it resembles a gauge.
//         defaultRenderer: new charts.ArcRendererConfig(
//             arcWidth: 40, startAngle: 20, arcLength: 4.396));
//   }

//   /// Create one series with sample hard coded data.
//   static List<charts.Series<GaugeSegment, String>> _createSampleData() {
//     final data = [
//       new GaugeSegment('1', 75),
//       new GaugeSegment('2', 100),
//       new GaugeSegment('High', 50),
//       new GaugeSegment('Highly Unusual', 5),
//     ];

//     return [
//       new charts.Series<GaugeSegment, String>(
//         id: 'Segments',
//         domainFn: (GaugeSegment segment, _) => segment.segment,
//         measureFn: (GaugeSegment segment, _) => segment.size,
//         data: data,
//       )
//     ];
//   }
// }

// /// Sample data type.
// class GaugeSegment {
//   final String segment;
//   final int size;

//   GaugeSegment(this.segment, this.size);
// }
   