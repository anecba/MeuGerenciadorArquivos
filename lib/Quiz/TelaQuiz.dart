import'package:flutter/material.dart';
import './Quiz1.dart';

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
/*void main(){
  runApp(
    new MaterialApp(
      home: AnimalQuiz(),
    )
  );
}*/

class AnimalQuiz extends StatefulWidget{
  @override
  State<StatefulWidget> createState(){
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
              child: Text("Quiz 1",
                style: TextStyle(fontSize: 18.0,
                color: Colors.white),
              ),
            )
          ],
        )
      ),
    );
  }
  //Method to start quiz
  void startQuiz(){
    setState(() {
      Navigator.push(context, MaterialPageRoute(builder: (context) => Quiz1()));
    });
  }
}


