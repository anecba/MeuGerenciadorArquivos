import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tccgerenciadorapp/Categoria/listaCategorias.dart';
import 'package:tccgerenciadorapp/GerenciadorArquivos/telaGerenciarArquivos.dart';
import 'package:tccgerenciadorapp/Home/home.dart';
import 'package:tccgerenciadorapp/Quiz/TelaQuiz.dart';

import '../TesteBotao.dart';

class DrawerCustomizado extends StatefulWidget {
  @override
  _DrawerCustomizadoState createState() => _DrawerCustomizadoState();
}

class _DrawerCustomizadoState extends State<DrawerCustomizado> {
  @override
  Widget build(BuildContext context) {
    return ListView(
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
                      borderRadius:
                      BorderRadius.all(Radius.circular(50.0)),
                      elevation: 10,
                      child: Padding(
                          padding: EdgeInsets.all(0.0),
                          child: Image.asset('images/logoF.png',
                              width: 100, height: 100))),
                  Padding(
                      padding: EdgeInsets.all(6.0),
                      child: Text(
                        'Flutter',
                        style: TextStyle(
                            color: Colors.white, fontSize: 20.0),
                      ))
                ],
              ),
            )),
        CustomizeListTile(
            Icons.person,
            'Página inicial',
                () => {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => (HomeApp())))
            }),
        CustomizeListTile(
            Icons.person,
            'Arquivos',
                () => {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => (OrganizadorApp())))
            }),
        CustomizeListTile(
            Icons.person,
            'Categorias',
                () => {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => (ListaCategorias())))
            }),
        CustomizeListTile(
            Icons.person,
            'Quiz',
                () => {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => (QuizApp())))
            }),
        CustomizeListTile(
            Icons.person,
            'teste',
                () => {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => (FlutterDemo())))
            }),
      ],
    );
  }
}

class CustomizeListTile extends StatelessWidget {
  IconData icon;
  String text;
  Function onTap;
  CustomizeListTile(this.icon, this.text, this.onTap);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(8.0, 0, 8.0, 0),
      child: Container(
        decoration: BoxDecoration(
            border: Border(bottom: BorderSide(color: Colors.grey.shade400))),
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
                      child: Text(
                        text,
                        style: TextStyle(fontSize: 16.0),
                      ),
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
