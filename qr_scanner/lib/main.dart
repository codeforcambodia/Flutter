import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:async';
/* QR Code Generate */
import 'package:qr_flutter/qr_flutter.dart';
import 'dart:ui';
import 'dart:io';
import 'dart:typed_data';
/* Bar Code Scanner */
import 'package:barcode_scan/barcode_scan.dart';

void main() {
  // debugPaintSizeEnabled = true;
  runApp(MyApp()); 
}

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

  /* QR Code Qenerate Size */
  static const double _topSectionTopPadding = 50.0;
  static const double _topSectionBottomPadding = 20.0;
  static const double _topSectionHeight = 50.0;

  String _dataString = "Hello from this QR";
  GlobalKey globalKey = GlobalKey();
  final TextEditingController _textController = TextEditingController();
  String _inputErrorText;

  String barcode = "";

  /* QR Scanner */
  Future scan() async {
    try {
      String barcode = await BarcodeScanner.scan();
      setState(() {
        this.barcode = barcode;
      });
    } on PlatformException catch (e) {
      if (e.code == BarcodeScanner.CameraAccessDenied) {
        setState(() {
          this.barcode = "The user did not grant the camera permission!";
        });
      } else {
        setState(() {
          this.barcode = "Unknown error: $e";
        });
      }
    } on FormatException {
      setState(() {
        this.barcode = "null (User returned using the 'back' -button before scanning anything. Result)";
      });
    } catch (e){
      setState(() {
        this.barcode = "Unknown error: $e";
      });
    }
  }

  /* QR Generator */

  Future<void> _captureAndSharing() async {
    // try{
    //   RenderRepaintBoundary boundary = globalKey.currentContext.findRenderObject();
    //   var image = await boundary.toImage();
    //   ByteData byteData = await image.toByteData(format: ImageByteFormat.png);
    //   Uint8List pngByte = byteData.buffer.asUint8List();

    //   final tempDir = await getTemporaryDirectory();
    //   final file = await new File('${tempDir.path}/image.png').create();
    //   await file.writeAsBytes(pngByte);

    //   final channel = const MethodChannel('channel:me.alfian.share/share');
    //   channel.invokeMethod('shareFile', 'image.png');

    // } catch (e) {
    //   print(e.toString());
    // }
  }

  @override
  Widget build(BuildContext context) {
    final bodyHeight = MediaQuery.of(context).size.height - MediaQuery.of(context).viewInsets.bottom;
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Container(
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.all(10.0),
              child: Text(barcode),
            ),
            RaisedButton(
              child: Text('Scan QR Code'),
              onPressed: scan,
            ),
            RaisedButton(
              child: Text('Share QR Code'),
              onPressed: () {},
              // _captureAndSharing,
            ),
            Row(
              children: <Widget>[
                Expanded(
                  child:  TextField(
                    controller: _textController,
                    decoration:  InputDecoration(
                      hintText: "Enter a custom message",
                      errorText: _inputErrorText,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10.0),
                  child:  FlatButton(
                    child:  Text("Generate QR"),
                    onPressed: () {
                      setState((){
                        _dataString = _textController.text;
                        _inputErrorText = null;
                      });
                    },
                  ),
                )
              ],
            ),
            Container(
              padding: EdgeInsets.all(110.0),
              child: RepaintBoundary(
                key: globalKey,
                child: new QrImage(
                foregroundColor: Color(hexColor('#5F707A')),
                embeddedImage: AssetImage('assets/3.png'),
                  embeddedImageStyle: QrEmbeddedImageStyle(
                    size: Size(50, 50),
                  ),
                  version: 10,
                  data: _dataString,
                  gapless: true,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  hexColor(String colorhexcode){
    String colornew = '0xff' + colorhexcode;
    colornew = colornew.replaceAll('#', '');
    int colorint = int.parse(colornew);
    return colorint;
  }
}
