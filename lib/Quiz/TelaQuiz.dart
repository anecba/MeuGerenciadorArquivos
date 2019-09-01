import 'package:flutter/material.dart';
import './Quiz1.dart';
import 'package:tccgerenciadorapp/Home/home.dart';
import 'package:tccgerenciadorapp/GerenciadorArquivos/telaGerenciarArquivos.dart';

class QuizApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Quiz',
      home: AnimalQuiz(),
    );
  }
}

class AnimalQuiz extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return AnimalQuizState();
  }
}

class AnimalQuizState extends State<AnimalQuiz> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("Multiple choice quiz"),
        backgroundColor: Colors.green,
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
      body: Container(
          margin: EdgeInsets.all(15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              MaterialButton(
                height: 50.0,
                color: Colors.green,
                onPressed: startQuiz,
                child: Text(
                  "Quiz 1",
                  style: TextStyle(fontSize: 18.0, color: Colors.white),
                ),
              )
            ],
          )),
    );
  }

  //Method to start quiz
  void startQuiz() {
    setState(() {
      Navigator.push(context, MaterialPageRoute(builder: (context) => Quiz1()));
    });
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
