import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:flutter_file_manager/flutter_file_manager.dart';
import 'package:simple_permissions/simple_permissions.dart';
import 'package:tccgerenciadorapp/Drawer/drawer.dart';

class OrganizadorApp extends StatefulWidget {
  _OrganizadorState createState() => _OrganizadorState();
}

class _OrganizadorState extends State<OrganizadorApp> {
  Icon cusIcon = Icon(Icons.search);
  Widget cusSearchBar = Text("Gerenciador de arquivos");
  String dropdownValue = 'One';

  @override
  Widget build(BuildContext context) {
    SimplePermissions.requestPermission(Permission.ReadExternalStorage);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: cusSearchBar,
          actions: <Widget>[
            IconButton(
              icon: cusIcon,
              onPressed: () {
                setState(() {
                  if (this.cusIcon.icon == Icons.search) {
                    this.cusIcon = Icon(Icons.cancel);
                    this.cusSearchBar = TextField(
                        textInputAction: TextInputAction.go,
                        decoration: InputDecoration(
                            border: InputBorder.none, hintText: "Pesquisa"),
                        style: TextStyle(color: Colors.white, fontSize: 16.0));
                  } else {
                    this.cusIcon = Icon(Icons.search);
                    this.cusSearchBar = Text("Gerenciador de arquivos");
                  }
                });
              },
            ),
          ],
        ),
        drawer: Drawer(child: DrawerCustomizado()),
        body: FutureBuilder(
            future: _files(),
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                return ListView.builder(
                  itemCount: snapshot.data?.length ?? 0,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text(snapshot.data[index].path.split('/').last),
                      onTap: () => {
                            showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return AlertDialog(
                                    title: Text("OPA!"),
                                    content: Text("Uia não é que funciona?"),
                                    actions: <Widget>[
                                      DropdownButton<String>(
                                          value: dropdownValue,
                                          iconSize: 24,
                                          elevation: 16,
                                          onChanged: (String newValue) {
                                            setState(() {
                                              dropdownValue = newValue;
                                            });
                                          },
                                          items: <String>['One', 'Two', 'Free', 'Four']
                                              .map<DropdownMenuItem<String>>((String value) {
                                            return DropdownMenuItem<String>(
                                              value: value,
                                              child: Text(value),
                                            );
                                          })
                                              .toList(),
                                          style: TextStyle(
                                              color: Colors.deepPurple)),
                                    ],
                                  );
                                })
                          },
                    );
                  },
                );
              } else if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(child: Text("Carregando"));
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

