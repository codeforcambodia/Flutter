import 'package:flutter/material.dart';
import 'package:responsive_ui/avatarImageView.dart';
import 'package:responsive_ui/chatlistdetail.dart';

class ChatListPage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return ChatListPageState();
  }
}

class ChatListPageState extends State<ChatListPage> with TickerProviderStateMixin{

  Widget build(BuildContext context){
    // var hasDetailPage = MediaQuery.of(context).orientation == Orientation.landscape;
    Widget child = _buildChat(context, 3);
    return Scaffold(
      appBar: AppBar(
        title: Text("Chats"),
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Hero(
              tag: 'my_tag',
              child: Container(
                color: Colors.lightBlue,
                child: Image.asset('assets/koompi_logo.png', width: 100.0, height: 100.0,),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Text("Navigator"),
        onPressed: () => Navigator.push(
          context,
          PageRouteBuilder(
            pageBuilder: (context, animation, secondaryAnimation) => ChatListDetail(),
            transitionDuration: Duration(milliseconds: 500),
            transitionsBuilder: (context, animation, secondaryAnimation, child){
              return FadeTransition(
                opacity: animation,
                child: child,
              );
            }
          )
        ),
      ),
      // SafeArea(
      //   child: Column(
      //     children: <Widget>[
      //       LayoutBuilder(
      //         builder: (BuildContext context, BoxConstraints constrant){
      //           var hasDetailsPage = constrant.maxWidth > 600;
      //           if (hasDetailsPage){
      //             return Row(
      //               children: <Widget>[
      //                 SizedBox(
      //                   width: 250,
      //                   height: double.infinity,
      //                   child: Container(
      //                     decoration: BoxDecoration(
      //                       border: Border(right: BorderSide(color: Colors.black.withOpacity(0.5), width: 1.0))
      //                     ),
      //                     child: _buildList(context, 3),
      //                   ),
      //                 ),
      //                 Expanded(
      //                   child: _buildChat(context, 3),
      //                 )
      //               ],
      //             );
      //           } else {
      //             return _buildList(context, 3);
      //           }
      //         },
      //       )
      //     ],
      //   ),
      // ),
    );
  }
}

Widget _buildList(BuildContext context, int amountIndex){
  return ListView.builder(
    itemCount: amountIndex,
    itemBuilder: (context, int index){
      return Column(
        children: <Widget>[
          ListTile(
            title: Text("Androidy Googler, Swity macky, You D, Best"),
            subtitle: Text("Calm down peeps :)"),
          ),
          Divider(color: Colors.grey,)
        ],
      );
    },
  );
}

Widget _buildChat(BuildContext context, int index){
  return ListView.builder(
    shrinkWrap: true,
    itemCount: index,
    itemBuilder: (context, index){
      return Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              Container(
                color: Colors.grey,
                width: 100.0,
                height: 100.0,
                child: avatar(),
              ),
              Card(child: Text("hello"))
            ],
          )
        ],
      );
    },
  );
}