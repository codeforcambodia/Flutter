import 'package:flutter/material.dart';
import 'package:search_dropdown/countries.dart';
import 'package:autocomplete_textfield/autocomplete_textfield.dart';

class SearchDropDown extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return _SearchDropDownState();
  }
}

class _SearchDropDownState extends State<SearchDropDown> {
  List<String> add;
  bool _showDropDown = false;
  String currentText = "";
  GlobalKey<AutoCompleteTextFieldState<String>> key = GlobalKey();
  SimpleAutoCompleteTextField textField;

  TextEditingController _controller = TextEditingController();
  FocusNode _focusNode = FocusNode();
  // unFocusNode() {
  //   _controller.text = "";
  //   _showDropDown = !_showDropDown;
  //   setState(() {
  //     text = "Changed";
  //   });
  // }

  textChanged(String texts) async {
    // _controller.text = "Hello world";
    await Future.delayed(Duration(milliseconds: 100), () {
    print("Before ${_controller.text}");
      setState(() {
        _controller.text = texts;
        currentText = texts;
      });
    });
    print("After ${_controller.text}");
    // setState(() {
    //   _controller.text = texts;
    //   currentText = texts;
    //   print(_controller.text);
    // });
  }

  // _SearchDropDownState() {
  //   textField = ;
  // }

  // selectCountry(String country) {
  //   setState(() {
  //     _focusNode.unfocus();
  //     _controller.text = country;
  //     _showDropDown = false;
  //   });
  // }
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          SimpleAutoCompleteTextField(
            style: TextStyle(color: Colors.blue),
            key: key,
            controller: _controller,
            suggestions: countries,
            focusNode: _focusNode,
            // textSubmitted: (mytext) {
            //   // currentText = mytext;
            //   textChanged(mytext);
            // },
            submitOnSuggestionTap: true,
            textSubmitted: (text){
              textChanged(text);
            },
            decoration: InputDecoration(
              suffixIcon: Icon(Icons.search),
            ),
          ),
          Text(currentText, style: TextStyle(color: Colors.white),)
        ],
      )
      // Column(
      //   mainAxisAlignment: MainAxisAlignment.center,
      //   children: <Widget>[
      //     Container(
      //       decoration: BoxDecoration(
      //         border: Border.all(width: 1, color: Colors.grey)
      //       ),
      //       child: Row(
      //         mainAxisSize: MainAxisSize.min,
      //         children: <Widget>[
      //           Expanded(
      //             child: textField
      //             // TextFormField(
      //             //   controller: _controller,
      //             //   focusNode: _focusNode,
      //             //   decoration: InputDecoration(
      //             //     border: InputBorder.none,
      //             //   ),
      //             //   onChanged: (data) {
      //             //     print(data);
      //             //     setState(() {
      //             //       _showDropDown = true;
      //             //     });
      //             //   },
      //             // ),
      //           ),
      //           IconButton(
      //             icon: Icon(Icons.arrow_drop_down),
      //             onPressed: () {
      //               unFocusNode();
      //             },
      //           )
      //         ],
      //       ),
      //     ),
      //     _showDropDown == true ? SingleChildScrollView(
      //       child: Container(
      //         decoration: BoxDecoration(
      //           border: Border.all(width: 1, color: Colors.grey)
      //         ),
      //         height: 150.0,
      //         child: ListView.builder(
      //           shrinkWrap: true,
      //           itemCount: countries.length,
      //           itemBuilder: (BuildContext context, int index) {
      //             return Column(
      //               mainAxisSize: MainAxisSize.min,
      //               children: <Widget>[
      //                 ListTile(
      //                   title: Text(countries[index]),
      //                   onTap: () {
      //                     selectCountry(countries[index]);
      //                   },
      //                 ),
      //                 Divider(
      //                   color: Colors.grey,
      //                 ),
      //               ],
      //             );
      //           },
      //         ),
      //       ),
      //     ) : Container()
      //   ],
      // ),
    );
  }
}