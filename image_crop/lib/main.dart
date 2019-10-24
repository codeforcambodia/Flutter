import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:image_cropper/image_cropper.dart';

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

class _MyHomePageState extends State<MyHomePage>{

  File _imageFile;

  imagePick() async {
    var image = await ImagePicker.pickImage(source: ImageSource.camera);
    print(image);
    if (image != null ){
      setState(() {
        _imageFile = image;
      });
    }
  }

  cropImage() async {
    var crop = await ImageCropper.cropImage(sourcePath: _imageFile.path);
    setState(() {
      _imageFile = crop;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: _imageFile != null ? Container(
        height: 160.0,
        width: 160.0,
        child: Image.file(_imageFile),
      ) : Container(),
      bottomNavigationBar: BottomAppBar(
        child: Row(
          children: <Widget>[
            IconButton(
              icon: Icon(Icons.camera),
              onPressed: () async {
                var image = await ImagePicker.pickImage(source: ImageSource.camera);
                print(image);
                if (image != null ){
                  setState(() {
                    _imageFile = image;
                  });
                }
              },
            ),
            Expanded(child: Text(''),),
            IconButton(
              icon: Icon(Icons.photo_album),
              onPressed: () {
                cropImage();
              },
            )
          ],
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
