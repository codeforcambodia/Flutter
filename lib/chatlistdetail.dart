import 'package:flutter/material.dart';

class ChatListDetail extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return ChatListDetailState();
  }
}

class ChatListDetailState extends State<ChatListDetail>{
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            // Transform.rotate(
            //   // angle: 45 / 360 * 3.14 * 2,
            //   child: ,
            // ),
            Hero(
              tag: 'my_tag',
              child: Container(
                margin: EdgeInsets.only(top: 50.0),
                color: Colors.lightBlue,
                child: Image.asset('assets/koompi_logo.png', width: 50.0, height: 50.0,),
              ),
            )
          ],
        ),
      ),
    );
  }
}