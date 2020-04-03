import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:fabs/unicorndial.dart';

void main() => runApp(MyApp());

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
  int _counter = 0; bool refresh = false;

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }
  
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    var childButtons = List<UnicornButton>();

    childButtons.add(UnicornButton(
        hasLabel: true,
        labelText: "Choo choo",
        currentButton: FloatingActionButton(
          heroTag: "train",
          backgroundColor: Colors.redAccent,
          mini: true,
          child: Icon(Icons.train),
          onPressed: () {},
        )));

    childButtons.add(UnicornButton(
        currentButton: FloatingActionButton(
            heroTag: "airplane",
            backgroundColor: Colors.greenAccent,
            mini: true,
            child: Icon(Icons.airplanemode_active))));

    childButtons.add(UnicornButton(
        currentButton: FloatingActionButton(
            heroTag: "directions",
            backgroundColor: Colors.blueAccent,
            mini: true,
            child: Icon(Icons.directions_car))));

    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(icon: Icon(Icons.radio), onPressed: () async {
          var menu = await Navigator.push(context, MaterialPageRoute(builder: (context) => Page2()));
          if (menu == false){
              setState(() {
                refresh = true;
              });
            await Future.delayed(Duration(milliseconds: 500), (){
              setState(() {
                refresh = false;
              });
              print(refresh);
            });
          }
        },),
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          // Column is also a layout widget. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.
          //
          // Invoke "debug painting" (press "p" in the console, choose the
          // "Toggle Debug Paint" action from the Flutter Inspector in Android
          // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
          // to see the wireframe for each widget.
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.display1,
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        shape: CircularNotchedRectangle(),
        notchMargin: -10.0,
        color: Colors.red,
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            IconButton(
              icon: Icon(Icons.menu),
              onPressed: () {setState(() {
                
              });},
            ),
            IconButton(
              icon: Icon(Icons.search),
              onPressed: () {},
            ),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: 
      Container(
        width: 100.0,
        height: 100.0,
        child: UnicornDialer(
          refresh: refresh,
          childPadding: 50.0,
          hasBackground: false,
          hasNotch: true,
          backgroundColor: Color.fromRGBO(255, 255, 255, 0.6),
          parentButtonBackground: Colors.redAccent,
          orientation: UnicornOrientation.VERTICAL,
          parentButton: Padding(
            padding: EdgeInsets.all(10.0),
            child: Image.asset("assets/koompi_for_qr.png"),
          ),
          finalButtonIcon: Padding(
            padding: EdgeInsets.all(10.0),
            child: Image.asset("assets/koompi_for_qr.png"),
          ),
          childButtons: childButtons
        ),
      )
      // FloatingActionButton(onPressed: (){},)
      // SpeedDial(
      //     // both default to 16
      //     marginRight: 18,
      //     marginBottom: 20,
      //     animatedIcon: AnimatedIcons.menu_close,
      //     animatedIconTheme: IconThemeData(size: 22.0),
      //     // this is ignored if animatedIcon is non null
      //     // child: Icon(Icons.add),
      //     // visible: _dialVisible,
      //     // If true user is forced to close dial manually 
      //     // by tapping main button and overlay is not rendered.
      //     closeManually: false,
      //     curve: Curves.bounceIn,
      //     overlayColor: Colors.black,
      //     overlayOpacity: 0.5,
      //     onOpen: () => print('OPENING DIAL'),
      //     onClose: () => print('DIAL CLOSED'),
      //     tooltip: 'Speed Dial',
      //     heroTag: 'speed-dial-hero-tag',
      //     backgroundColor: Colors.white,
      //     foregroundColor: Colors.black,
      //     elevation: 8.0,
      //     shape: CircleBorder(),
      //     children: [
      //       SpeedDialChild(
      //         child: Icon(Icons.accessibility),
      //         backgroundColor: Colors.red,
      //         label: 'First',
      //         labelStyle: TextStyle(fontSize: 18.0),
      //         onTap: () => print('FIRST CHILD')
      //       ),
      //       SpeedDialChild(
      //         child: Icon(Icons.brush),
      //         backgroundColor: Colors.blue,
      //         label: 'Second',
      //         labelStyle: TextStyle(fontSize: 18.0),
      //         onTap: () => print('SECOND CHILD'),
      //       ),
      //       SpeedDialChild(
      //         child: Icon(Icons.keyboard_voice),
      //         backgroundColor: Colors.green,
      //         label: 'Third',
      //         labelStyle: TextStyle(fontSize: 18.0),
      //         onTap: () => print('THIRD CHILD'),
      //       ),
      //     ],
      //   ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

class Page2 extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return Page2State();
  }
}

class Page2State extends State<Page2>{


  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: RaisedButton(
          onPressed: (){
            Navigator.of(context).pop(false);
          },
        ),
      ),
    );
  }
}
