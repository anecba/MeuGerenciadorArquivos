import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:tccgerenciadorapp/Home/home.dart';
import 'package:tccgerenciadorapp/Login/login.dart';

class CadastroApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Tela de Cadastro',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
      ),
      home: CadastroPage(),
    );
  }
}

class CadastroPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _CadastroPageState();
  }
}

class _CadastroPageState extends State<CadastroPage> {

  @override
  void initState() {
    SystemChrome.setEnabledSystemUIOverlays([]);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              color: Colors.amber,
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: Column(
                children: <Widget>[
                  Align(
                    child: Padding(
                      padding: const EdgeInsets.only(
                        top: 40,
                        bottom: 40,
                      ),
                      child: Text('Tela de Cadastro', style: TextStyle(color: Colors.white, fontSize: 35),),
                    ),
                  ),
                  //container do campo Nome
                  Container(
                    width: MediaQuery.of(context).size.width/1.2,
                    height: MediaQuery.of(context).size.width/8,
                    margin: EdgeInsets.only(top: 20),
                    // este padding aqui arruma o text dado um bom posicionamento.
                    padding: EdgeInsets.only(
                        top: 1, left: 16, right: 16, bottom: 8
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          //colocando sombra só mais em baixo e nas laterais
                          offset: Offset(0,5),
                          color: Colors.black12,
                          blurRadius: 5,
                        ),
                      ],
                    ),
                    //campo para escrever
                    child: TextField(
                      //autofocus: false,
                      decoration: InputDecoration(
                        icon: Icon(Icons.format_color_text, color: Colors.grey),
                        border: InputBorder.none,
                        hintText: 'Nome',
                      ),
                    ),
                  ),
                  //container do campo
                  Container(
                    width: MediaQuery.of(context).size.width/1.2,
                    height: MediaQuery.of(context).size.width/8,
                    margin: EdgeInsets.only(top: 30),
                    // este padding aqui arruma o text dado um bom posicionamento.
                    padding: EdgeInsets.only(
                        top: 1, left: 16, right: 16, bottom: 8
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          //colocando sombra só mais em baixo e nas laterais
                          offset: Offset(0,5),
                          color: Colors.black12,
                          blurRadius: 5,
                        ),
                      ],
                    ),
                    //campo para escrever
                    child: TextField(
                      //autofocus: false,
                      decoration: InputDecoration(
                        icon: Icon(Icons.vpn_key, color: Colors.grey),
                        border: InputBorder.none,
                        hintText: 'Senha',
                      ),
                    ),
                  ),
                  //container do campo password
                  Container(
                    width: MediaQuery.of(context).size.width/1.2,
                    height: MediaQuery.of(context).size.width/8,
                    margin: EdgeInsets.only(top: 30),
                    // este padding aqui arruma o text dado um bom posicionamento.
                    padding: EdgeInsets.only(
                        top: 1, left: 16, right: 16, bottom: 4
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          //colocando sombra só mais em baixo e nas laterais
                          offset: Offset(0,5),
                          color: Colors.black12,
                          blurRadius: 5,
                        ),
                      ],
                    ),
                    //campo para escrever
                    child: TextField(
                      decoration: InputDecoration(
                        icon: Icon(Icons.mail, color: Colors.grey),
                        border: InputBorder.none,
                        hintText: 'Email',
                      ),
                    ),
                  ),
                  Container(height: 60),
                  //CRIAR UMA CONTA!
                  GestureDetector(
                    onTap: (){Navigator.push(context, MaterialPageRoute(builder: (context) => (HomeApp())));},
                    child: Container(
                      height: MediaQuery.of(context).size.width/6,
                      width: MediaQuery.of(context).size.width/1.2,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            Color(0xFF20c6b6),
                            Color(0xFF1a9e92),
                          ],
                        ),
                        borderRadius: BorderRadius.circular(60),
                        //border: Border.all(color: Colors.white),
                        boxShadow: [
                          BoxShadow(
                            //colocando sombra só mais em baixo e nas laterais
                            offset: Offset(0,5),
                            color: Colors.black12,
                            blurRadius: 5,
                          ),
                        ],
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children : <Widget> [
                          Center(
                            child: Text('criar conta'.toUpperCase(),
                              style: TextStyle(
                                fontSize: 20,
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: (){Navigator.push(context, MaterialPageRoute(builder: (context) => (LoginApp())));},
                    child: Align(
                      alignment: Alignment.centerRight,
                      child: Padding(
                        padding: const EdgeInsets.only(
                          top: 10,
                          right: 45,
                        ),
                        child: Text('Já possui conta? Entrar!',
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      )
    );
  }
}