import 'package:flutter/material.dart';
import '../rest_api/restApi.dart';

class FutureBuilderWidget extends StatefulWidget {
  @override
  FutureBuilderState createState() => FutureBuilderState();
}

class FutureBuilderState extends State<FutureBuilderWidget> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('FutureBuilder'),
      ),
      body: FutureBuilder(
        future: fetchData(),
        builder: (BuildContext context, AsyncSnapshot snapshot){
          return snapshot.hasData 
          /* if snapshot retreive data from future and then display a lists of user name */
          ? 
          ListView.builder(
            itemCount: snapshot.data.length,
            itemBuilder: (BuildContext context, int index){
              return Card(
                margin: EdgeInsets.all(10.0),
                child: Center(child: Text(snapshot.data[index]['name']),),
              );
            },
          )
          /* if snap no retrieve data from future just show loading progress */
          : Center(child: CircularProgressIndicator(),);
        },
      )
    );
  }
}
