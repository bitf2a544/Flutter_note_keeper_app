import 'package:flutter/material.dart';

import 'note_detail.dart';

class NoteListScreen extends StatefulWidget {
  @override
  _NoteListScreenState createState() => _NoteListScreenState();
}

class _NoteListScreenState extends State<NoteListScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Notes List")),
      body: getNotesListView(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          moveToNoteDetailScreen("Add Note");
          debugPrint("clickedFAB ");
        },
        child: Icon(Icons.add),
      ),
    );
  }

  void moveToNoteDetailScreen(var title) {
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return NoteDetail(title);
    }));
  }

  // ListView getNotesListView() {}

  List<String> getListofString() {
    var items = List<String>.generate(100, (index) => "Item $index");
    return items;
  }

  Widget getNotesListView() {
    var listItems = getListofString();
    var listView = ListView.builder(itemBuilder: (context, index) {
      //this builder method is memory efficent and will be called only not of items visible on screen
      return ListTile(
        leading: Icon(Icons.wb_sunny),
        title: Text(listItems[index]),
        onTap: () {
          debugPrint("${listItems[index]} clicked");
        },
      );
    });
  }

  String downloadFile() {
    Future<String> result = Future.delayed(Duration(seconds: 6), () {
      return "My Secret file content";
    });
  }
}
