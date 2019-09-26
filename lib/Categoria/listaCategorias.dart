import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:tccgerenciadorapp/Drawer/drawer.dart';

class ListaCategorias extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _ListaCategoriasState();
  }
}

class _ListaCategoriasState extends State<ListaCategorias> {
  String _value;

  @override
  void initState() {
    SystemChrome.setEnabledSystemUIOverlays([]);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Categorias'),
          backgroundColor: Colors.deepOrange,
        ),
        drawer: Drawer(child: DrawerCustomizado()),
        body: SingleChildScrollView(
          child: Container(
            height: 500,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  IconButton(
                      onPressed: (){},
                      icon: Icon(Icons.filter_list),
                      alignment: Alignment.centerLeft,
                      padding: EdgeInsets.all(8.0)
                  ),
                  Container(
                    color: Colors.pink,
                    child: DropdownButton<String>(
                      items: [
                        DropdownMenuItem<String>(
                          child: Text('Item 1'),
                          value: 'um',
                        ),
                        DropdownMenuItem<String>(
                          child: Text('Item 2'),
                          value: 'dois',
                        ),
                        DropdownMenuItem<String>(
                          child: Text('Item 3'),
                          value: 'Três',
                        ),
                      ],
                      onChanged: (String value) {
                        setState(() {
                          _value = value;
                        });
                      },
                      hint: Text('Selecione o item'),
                      value: _value,
                    ),
                  ),
                ]
              ),
            ),
          ),
        )
    );
  }
}