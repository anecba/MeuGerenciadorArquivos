import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:tccgerenciadorapp/Drawer/drawer.dart';
import 'package:tccgerenciadorapp/GerenciadorArquivos/telaGerenciarArquivos.dart';
import 'package:tccgerenciadorapp/Quiz/TelaQuiz.dart';
import 'package:tccgerenciadorapp/AnotacaoTxt/ListaAnotacoes.dart';
import 'package:tccgerenciadorapp/Home/home.dart';

class TelaCategorias extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Tela de categorias',
      theme: ThemeData(
        primarySwatch: Colors.deepOrange,
      ),
      home: ListaCategorias(),
    );
  }
}

class ListaCategorias extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _ListaCategoriasState();
  }
}

class _ListaCategoriasState extends State<ListaCategorias> {
  @override
  void initState() {
    SystemChrome.setEnabledSystemUIOverlays([]);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Página inicial'),
          backgroundColor: Colors.deepOrange,
        ),
        drawer: Drawer(child: DrawerCustomizado()),
        body: NoteList()
    );
  }
}