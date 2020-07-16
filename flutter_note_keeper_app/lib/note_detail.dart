import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class NoteDetail extends StatefulWidget {
  var appBarTitle = '';

  NoteDetail(var title1) {
    appBarTitle = title1;
  }

  @override
  _NoteDetailState createState() => _NoteDetailState(this.appBarTitle);
}

class _NoteDetailState extends State<NoteDetail> {
  var dropDownSelectedStr = "High";
  var _priorityList = ['High', 'Low', 'Medium'];
  TextEditingController title = new TextEditingController();
  TextEditingController description = new TextEditingController();
  var appBarTitle = '';

  _NoteDetailState(var title1) {
    appBarTitle = title1;
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: () {
          //write the things that u want to handle on Backpress
          debugPrint("onWillPop inside");
        },
        child: Scaffold(
            appBar: AppBar(
              title: Text(appBarTitle),
              leading: IconButton(
                  icon: Icon(Icons.arrow_back),
                  onPressed: () {
                    moveToPreviousScreen();
                  }),
            ),
            body: Padding(
              padding: EdgeInsets.all(20.0),
              child: Column(children: <Widget>[
                ListTile(
                    title: DropdownButton<String>(
                  items: _priorityList.map((String value) {
                    return new DropdownMenuItem<String>(
                      value: value,
                      child: new Text(value),
                    );
                  }).toList(),
                  onChanged: (String selectedValue) {
                    setState(() {
                      dropDownSelectedStr = selectedValue;
                    });
                  },
                  value:
                      dropDownSelectedStr, //tis line display selected value on drop down list
                )),
                Container(
                    margin: EdgeInsets.fromLTRB(0.0, 5.0, 0.0, 5.0),
                    child: TextField(
                      keyboardType: TextInputType.text,
                      controller: title,
                      decoration: InputDecoration(
                          labelText: "Title",
                          border: new OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          )),
                    )),
                Container(
                  margin: EdgeInsets.fromLTRB(0.0, 5.0, 0.0, 5.0),
                  child: TextField(
                    controller: description,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                        hintText: 'Description',
                        labelText: "Enter description",
                        border: new OutlineInputBorder(
                            borderSide: new BorderSide(color: Colors.teal))),
                  ),
                ),
                Row(
                  children: <Widget>[
                    Expanded(
                        child: RaisedButton(
                      textColor: Colors.black,
                      color: Colors.deepPurple,
                      child: Text("Save"),
                      onPressed: () {
                        debugPrint(
                            "Title ${title.text} and Descript ${description.text}");
                      },
                    )),
                    Container(
                      width: 10.0,
                    ),
                    Expanded(
                        child: RaisedButton(
                      textColor: Colors.black,
                      color: Colors.deepPurple,
                      child: Text("Delete"),
                      onPressed: () {},
                    ))
                  ],
                ),
              ]),
            )));
  }

  void moveToPreviousScreen() {
    Navigator.pop(context);
  }
}
