import 'dart:async';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:flutter_file_manager/flutter_file_manager.dart';
import 'package:simple_permissions/simple_permissions.dart';
import 'package:tccgerenciadorapp/Home/home.dart';
import 'package:tccgerenciadorapp/Quiz/TelaQuiz.dart';

class OrganizadorApp extends StatefulWidget {
  _OrganizadorState createState() => _OrganizadorState();
}

class _OrganizadorState extends State<OrganizadorApp> {
  @override
  Widget build(BuildContext context) {
    SimplePermissions.requestPermission(Permission.ReadExternalStorage);
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Flutter File Manager Example"),
        ),
        drawer: Drawer(
          child: ListView(
            children: <Widget>[
              DrawerHeader(
                  decoration: BoxDecoration(
                      gradient: LinearGradient(colors: <Color>[
                        Colors.deepOrange,
                        Colors.orangeAccent
                      ])),
                  child: Container(
                    child: Column(
                      children: <Widget>[
                        Material(
                            borderRadius: BorderRadius.all(Radius.circular(50.0)),
                            elevation: 10,
                            child: Padding(
                                padding: EdgeInsets.all(0.0),
                                child: Image.asset('images/logoF.png',
                                    width: 100, height: 100))),
                        Padding(
                            padding: EdgeInsets.all(6.0),
                            child: Text(
                              'Flutter',
                              style:
                              TextStyle(color: Colors.white, fontSize: 20.0),
                            ))
                      ],
                    ),
                  )),
              CustomizeListTile(
                  Icons.person,
                  'Página inicial',
                      () => {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => (HomeApp())))
                  }),
              CustomizeListTile(
                  Icons.person,
                  'Arquivos',
                      () => {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => (OrganizadorApp())))
                  }),
              CustomizeListTile(
                  Icons.person,
                  'Categorias',
                      () => {
                  }),
              CustomizeListTile(
                  Icons.person,
                  'Quiz',
                      () => {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => (QuizApp())))
                  }),
            ],
          ),
        ),
        body: FutureBuilder(
            future: _files(),
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                return ListView.builder(
                  itemCount: snapshot.data?.length ?? 0,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text(snapshot.data[index].path.split('/').last),
                    );
                  },
                );
              } else if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(child: Text("Loading"));
              }
            }),
      ),
    );
  }

  _files() async {
    var root = await getExternalStorageDirectory();
    var files = await FileManager(root: root).walk().toList();
    return files;
  }
}

class CustomizeListTile extends StatelessWidget{
  IconData icon;
  String text;
  Function onTap;
  CustomizeListTile(this.icon, this.text, this.onTap);
  @override
  Widget build(BuildContext context){
    return Padding(
      padding: const EdgeInsets.fromLTRB(8.0, 0, 8.0, 0),
      child: Container(
        decoration: BoxDecoration(
            border: Border(bottom: BorderSide(color: Colors.grey.shade400))
        ),
        child: InkWell(
          splashColor: Colors.orangeAccent,
          onTap: onTap,
          child: Container(
            height: 50,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Icon(icon),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(text, style: TextStyle(
                          fontSize: 16.0
                      ),),
                    ),
                  ],
                ),
                Icon(Icons.arrow_right)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
