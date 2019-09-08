import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    title: "Notes App",
    home: NotesList(),
  ));
}

class NotesList extends StatefulWidget {
  @override
  _NotesListState createState() => _NotesListState();
}

class _NotesListState extends State<NotesList> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}