import 'package:flutter/material.dart';
import 'package:tccgerenciadorapp/Drawer/drawer.dart';

class DropdownCategorias extends StatefulWidget {
  @override
  _DropdownCategoriasState createState() {
    return _DropdownCategoriasState();
  }
}

class _DropdownCategoriasState extends State<DropdownCategorias> {
  String _value;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Categorias'),
        backgroundColor: Colors.deepOrange,
      ),
      drawer: Drawer(child: DrawerCustomizado()),
      body: Container(
        child: Column (
          children: <Widget>[
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
          ],
        ),
      ),
    );
  }
}
