import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../main.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:tccgerenciadorapp/GerenciadorArquivos/telaGerenciarArquivos.dart';
import 'package:tccgerenciadorapp/Quiz/TelaQuiz.dart';

class HomeApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //retira a bandeira de debug
      debugShowCheckedModeBanner: false,
      title: 'Tela de Login',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
      ),

      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _HomePageState();
  }
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    SystemChrome.setEnabledSystemUIOverlays([]);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tutorial'),
        backgroundColor: Colors.deepOrange,
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
      body: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Container(
                height: 450,
                color: Colors.red,
                width: MediaQuery.of(context).size.width,
                child: new StaggeredGridView.countBuilder(
                  crossAxisCount: 4,
                  itemCount: 8,
                  itemBuilder: (BuildContext context, int index) => new Container(
                      color: Colors.green,
                      child: new Center(
                        child: new CircleAvatar(
                          backgroundColor: Colors.white,
                          child: new Text('$index'),
                        ),
                      )),
                  staggeredTileBuilder: (int index) =>
                  new StaggeredTile.count(2, index.isEven ? 2 : 1),
                  mainAxisSpacing: 4.0,
                  crossAxisSpacing: 4.0,
                ),
              ),
              Align(
                alignment: Alignment.bottomRight,
                child: Container(
                  child: Padding(
                    padding: EdgeInsets.only(top: 35.0, right: 35.0, bottom: 35.0),
                    child: FloatingActionButton(
                      onPressed: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => (Profile())));
                      },
                      child: Icon(Icons.add),
                    ),
                  ),
                ),
              ),
            ],
          ),
      ),
    );
  }
}
//TODO Não esquecer de arrumar a tela home.
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
