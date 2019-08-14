import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  /* Variable get only date not include time */
  int inputNow;
  int dateNow;

  @override
  initState(){
    super.initState();
    inputNow = timeStampConvertorInput("2019-03-12");
    dateNow = timeStampConvertorRealTime();
  }
  /* Convert date from user input to timestamp */
  int timeStampConvertorInput(String date){
    /* Format of date */
    DateFormat dateFormat = DateFormat('yyyy-MM-dd');
    DateTime dateTime = dateFormat.parse(date);
    return dateTime.millisecondsSinceEpoch;
  }

  /* Convert date now to timestamp */
  int timeStampConvertorRealTime(){
    DateFormat dateFormat = DateFormat("yyyy-MM-dd");
    String dateTime = dateFormat.format(DateTime.now());
    print(dateTime);
    DateTime date = dateFormat.parse(dateTime);
    return date.millisecondsSinceEpoch;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            /* Display timestamp get date from user input */
            Text(
              'Only Date from user input to timestamp',
            ),
            Text("$inputNow"),
            /* Display date time in real time */
            Text(
              'Only Date now to timestamp',
            ),
            Text('$dateNow')

          ],
        ),
      ),
    );
  }
}
