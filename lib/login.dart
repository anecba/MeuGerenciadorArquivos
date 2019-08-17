import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'cadastro.dart';
import 'main.dart';


class LoginApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //retira a bandeira de debug
      debugShowCheckedModeBanner: false,
      title: 'Tela de Login',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
      ),
      home: LoginPage(),
    );
  }
}

class LoginPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _LoginPageState();
  }
}

class _LoginPageState extends State<LoginPage> {

  @override
  void initState(){
    SystemChrome.setEnabledSystemUIOverlays([]);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Color(0xFF20c6b6),
                  Color(0xFF008080),
                ],
              ),
            ),
            child: Column(
              children: <Widget>[

                //Primeira repartição da tela conde ta o logO

                Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height/2.5,
                  //VER SE ALGUM DIA ARRUMO ESSA GAMBIARRA!
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      GestureDetector(
                        onTap: (){Navigator.push(context, MaterialPageRoute(builder: (context) => (Profile())));},
                        child: Container(
                          height: 60,
                          child: Padding(
                            //CRIANDO UMA OPÇÃO PARA ACESSAR SEM FAZER LOGIN
                            padding: const EdgeInsets.all(8.0),
                            child: Row(children: <Widget>[
                              Icon(Icons.arrow_forward, size: 15, color: Colors.white),
                              Text('Continuar sem cadastro',
                                style: TextStyle(
                                  fontSize: 15,
                                  color: Colors.white,
                                ),
                              ),
                            ]),
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.center,
                        child: Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: Icon(Icons.account_balance,
                            size: 90,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      Container(height: 10),
                      Align(
                        alignment: Alignment.bottomLeft,
                        child: Padding(
                          padding: const EdgeInsets.only(
                            top: 40,
                            left: 42,
                          ),
                          child: Text('Login',
                            style: TextStyle(
                                color:  Colors.white,
                                fontSize: 20
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                // Segunda repartição com Os campos para serem preenchidos
                Container(
                  height: MediaQuery.of(context).size.height/4,
                  width: MediaQuery.of(context).size.width,
                  padding: EdgeInsets.only(top: 50),
                  child: Column(
                    children: <Widget>[
                      //container do campo Email
                      Container(
                        width: MediaQuery.of(context).size.width/1.2,
                        height: MediaQuery.of(context).size.width/8,
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
                            icon: Icon(Icons.mail, color: Colors.grey),
                            border: InputBorder.none,
                            hintText: 'Email',
                          ),
                        ),
                      ),
                      //container do campo password ALTEARANDO ALEATORIO
                      Container(
                        width: MediaQuery.of(context).size.width/1.2,
                        height: MediaQuery.of(context).size.width/8,
                        margin: EdgeInsets.only(top: 16),
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
                            icon: Icon(Icons.vpn_key, color: Colors.grey),
                            border: InputBorder.none,
                            hintText: 'Password',
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                //eventualmente tirar esse align eu acho... aqui é o forgot password
                Container(
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: Padding(
                      padding: const EdgeInsets.only(
                        top: 10,
                        right: 45,
                      ),
                      child: Text('Forgot Password ?',
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
                //minha maneira de dar um espaçamento ja q o negocio deu ruim.
                Container(height: 60),
                //meu botão pra logar
                //AQUI FICA MEU BOTAO
                GestureDetector(
                  onTap: (){Navigator.push(context, MaterialPageRoute(builder: (context) => (Profile())));},
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
                          child: Text('Entrar'.toUpperCase(),
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
                //criar conta
                GestureDetector(
                  onTap: (){Navigator.push(context, MaterialPageRoute(builder: (context) => (CadastroApp())));},
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: Padding(
                      padding: const EdgeInsets.only(
                        top: 10,
                        right: 45,
                      ),
                      child: Text('Não possui uma conta? Cadastre-se Aquí!',
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
        ),
      ),
    );
  }
}

//Nota dia 13-05-19 - Parei na parte de criar uma opção para o usuario acessar a
//tela principal sem realizar o login. RETORMAR DAQUI!

//Nota dia 14-05-19 - Eu terminei o acesso. Agora criar o design para a página principal! Incrementar o menu agora.

//Nota dia 15-05-19 - Criando menu na tela principal. Na próxima tem q utilizar das dicas recebidas para alterar o menu.