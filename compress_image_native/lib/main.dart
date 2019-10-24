import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_native_image/flutter_native_image.dart';
import 'package:http_parser/http_parser.dart';
import 'package:image/image.dart' as img;
import 'package:image_picker/image_picker.dart';
import 'dart:convert';

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

  bool loading = false;
  File images;
  String token = "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjVkOTZmNTEwMzNiZTE0MDAyYjkyMDAwYSIsImVtYWlsIjoiY29uZGF2ZWF0QGdtYWlsLmNvbSIsImlhdCI6MTU3MTQ4MTUxMSwiZXhwIjoxNTcxNTY3OTExfQ.3osDfngARTQ6TcCBYUlAE2jUmHWoT5N5Ia-swGD-oIM";
  String url = "https://s3.zeetomic.com";

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
            images != null ? Image.file(images) : Container(),
            loading == true ? CircularProgressIndicator() : Container()
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          setState(() {
            loading = true;
          });
          Map<String, String> headers = {
            'Authorization': 'Bearer $token',
          };
          File image = await ImagePicker.pickImage(source: ImageSource.camera);
          // ImageProperties properties = await FlutterNativeImage.getImageProperties(image.path);
          // img.Image resizedImage = img.copyResize(imageTemp, width: 800);
          List<int> compress = await FlutterImageCompress.compressWithFile(
            image.path,
            minWidth: 800,
            minHeight: 500,
            quality: 94,
            rotate: 90,
          );
          // var c = await FlutterImageCompress.compressWithList(compress)
          // img.Image resizedImg = img.copyResize(compressImage);

          
          /* Resize image file */
          // img.Image imageTemp = img.decodeImage(image.readAsBytesSync());
          // img.Image resizedImg = img.copyResize(imageTemp, width: 800); 
          /* Make request */
          var request = new http.MultipartRequest('POST', Uri.parse('$url/uploadoc'));
          /* Make Form of Multipart */
          var multipartFile = new http.MultipartFile.fromBytes(
            'file',
            compress,
            // img.encodeJpg(resizedImg),
            filename: 'image_picker.jpg',
            contentType: MediaType.parse('image/jpeg'),
          );
          /* Concate Token With Header */
          request.headers.addAll(headers);
          request.files.add(multipartFile);
          /* Start send to server */
          var response = await request.send();
          response.stream.transform(utf8.decoder).listen((onData){
            print(onData);
          });

          setState(() {
            images = image;
            loading = false;
          });
        },
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
