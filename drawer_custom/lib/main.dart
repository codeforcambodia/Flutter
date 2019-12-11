import 'package:drawer_custom/SecondPage.dart';
import 'package:drawerbehavior/drawerbehavior.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return 
    // CupertinoApp(
    //   routes: {
    //     '/': (_) => MyHomePage(),
    //     'homepage': (_) => HomePage(),
    //     'second': (_) => SecondPage()
    //   },
    // );
    MaterialApp(
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
        // is not restarted.second
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
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      child: Center(
        child: CupertinoButton(
          child: Text('Take me deeper!'),
          onPressed: () => Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => HomePage())),
        ),
      ),
    );
  }
}

class HomePage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return HomeState();
  }
}

class HomeState extends State<HomePage> {

  final menu = Menu(
    items: [
      new MenuItem(
        id: 'Home',
        title: 'Home'
      ),
      new MenuItem(
        id: 'Profile',
        title: 'Profile'
      ),
      new MenuItem(
        id: 'Second page',
        title: 'Second page'
      ),
      new MenuItem(
        id: 'Setting',
        title: 'Setting'
      ),
      new MenuItem(
        id: 'Logout',
        title: 'Logout'
      )
    ]
  );

  var selectedMenuItemId = 'home';
  var _widget = Text('Home');

  @override
  Widget build(BuildContext context) {
    return DrawerScaffold(
      percentage: 0.6,
      appBar: AppBarProps(
        title: _widget
      ),
      menuView: MenuView(
        menu: menu,
        animation: true,
        color: Colors.grey,
        selectedItemId: selectedMenuItemId,
        onMenuItemSelected: (String itemId) {
          setState(() {
            selectedMenuItemId = itemId;
            if (itemId != "Second page") {
              _widget = Text(itemId);
            } 
          });
        },
      ),
      contentView: Screen(
        contentBuilder: (context) => LayoutBuilder(
          builder: (context, constraint) => GestureDetector(
            child: Container(
              color: Colors.white,
              width: constraint.maxWidth,
              height: constraint.maxHeight,
              child: selectedMenuItemId == 'Second page' ? SecondPage() : _widget 
            ),
            onTap: () {
              Scaffold.of(context).showSnackBar(SnackBar(
                content: Text("Clicked"),
                duration: Duration(seconds: 3),
              ));
            },
          ),
        ),
        color: Colors.white
      ),
    );
  }
}
