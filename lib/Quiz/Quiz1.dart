import 'package:flutter/material.dart';


var finalScore = 0;
var questionNumber = 0;
var quiz = new AnimalQuiz();

class AnimalQuiz{
  var images = [
    "alligator", "cat", "dog", "owl"
  ];


  var questions = [
    "This animal is a carnivorous reptile.",
    "_________ like to chase mice and birds.",
    "Give a _________ a bone and he will find his way home",
    "A nocturnal animal with some really big eyes",
  ];


  var choices = [
    ["Cat", "Sheep", "Alligator", "Cow"],
    ["Cat", "Snail", "Slug", "Horse"],
    ["Mouse", "Dog", "Elephant", "Donkey"],
    ["Spider", "Snake", "Hawk", "Owl"]
  ];


  var correctAnswers = [
    "Alligator", "Cat", "Dog", "Owl"
  ];
}

class Quiz1 extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return new Quiz1State();
  }
}

class Quiz1State extends State<Quiz1> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: () async => false,
        child: Scaffold(
          body: Container(
            margin: EdgeInsets.all(10.0),
            alignment: Alignment.topCenter,
            child: Column(
              children: <Widget>[
                Padding(padding: EdgeInsets.all(20.0)),

                Container(
                  alignment: Alignment.centerRight,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text("Question ${questionNumber + 1} of ${quiz.questions.length}",
                        style: TextStyle(
                            fontSize: 22.0
                        ),),
                      Text("Score: $finalScore",
                        style: TextStyle(
                            fontSize: 22.0
                        ))
                    ],
                  ),
                ),
                //image
                Padding(padding: EdgeInsets.all(10.0)),
                Image.asset(
                  "images/${quiz.images[questionNumber]}.jpg",
                  height: 250,
                  width: 300,
                ),

                Padding(padding: EdgeInsets.all(10.0)),

                Text(quiz.questions[questionNumber],
                  style: TextStyle(
                    fontSize: 20.0,
                  ),),

                Padding(padding: EdgeInsets.all(10.0)),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[

                    //button 1
                    MaterialButton(
                      minWidth: 120.0,
                      color: Colors.blueGrey,
                      onPressed: (){
                        if(quiz.choices[questionNumber][0] == quiz.correctAnswers[questionNumber]){
                          debugPrint("Correct");
                          finalScore++;
                        }else{
                          debugPrint("Wrong");
                        }
                        updateQuestion();
                      },
                      child: Text(quiz.choices[questionNumber][0],
                        style: TextStyle(
                            fontSize: 20.0,
                            color: Colors.white
                        ))
                    ),

                    //button 2
                    MaterialButton(
                      minWidth: 120.0,
                      color: Colors.blueGrey,
                      onPressed: (){
                        if(quiz.choices[questionNumber][1] == quiz.correctAnswers[questionNumber]){
                          debugPrint("Correct");
                          finalScore++;
                        }else{
                          debugPrint("Wrong");
                        }
                        updateQuestion();
                      },
                      child: Text(quiz.choices[questionNumber][1],
                        style: TextStyle(
                            fontSize: 20.0,
                            color: Colors.white
                        ))
                    ),
                  ],
                ),

                Padding(padding: EdgeInsets.all(10.0)),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    //button 3
                    MaterialButton(
                      minWidth: 120.0,
                      color: Colors.blueGrey,
                      onPressed: (){
                        if(quiz.choices[questionNumber][2] == quiz.correctAnswers[questionNumber]){
                          debugPrint("Correct");
                          finalScore++;
                        }else{
                          debugPrint("Wrong");
                        }
                        updateQuestion();
                      },
                      child: Text(quiz.choices[questionNumber][2],
                        style: TextStyle(
                            fontSize: 20.0,
                            color: Colors.white
                        ))
                    ),

                    //button 4
                    MaterialButton(
                      minWidth: 120.0,
                      color: Colors.blueGrey,
                      onPressed: (){
                        if(quiz.choices[questionNumber][3] == quiz.correctAnswers[questionNumber]){
                          debugPrint("Correct");
                          finalScore++;
                        }else{
                          debugPrint("Wrong");
                        }
                        updateQuestion();
                      },
                      child: Text(quiz.choices[questionNumber][3],
                        style: TextStyle(
                            fontSize: 20.0,
                            color: Colors.white
                        ))
                    )
                  ],
                ),

                Padding(padding: EdgeInsets.all(15.0)),
                Container(
                    alignment: Alignment.bottomCenter,
                    child: MaterialButton(
                        minWidth: 240.0,
                        height: 30.0,
                        color: Colors.red,
                        onPressed: resetQuiz,
                        child: Text("Quit",
                          style: TextStyle(
                              fontSize: 18.0,
                              color: Colors.white
                          ),)
                    )
                ),
              ],
            ),
          ),
        )
    );
  }

  void resetQuiz(){
    setState(() {
      Navigator.pop(context);
      finalScore = 0;
      questionNumber = 0;
    });
  }

  void updateQuestion(){
    setState(() {
      if(questionNumber == quiz.questions.length - 1){
        Navigator.push(context, MaterialPageRoute(builder: (context)=> Summary(score: finalScore,)));
      }else{
        questionNumber++;
      }
    });
  }
}

class Summary extends StatelessWidget{
  final int score;
  Summary({Key key, @required this.score}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        body: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text("Final Score: $score",
                style: TextStyle(
                    fontSize: 35.0
                ),),
              Padding(padding: EdgeInsets.all(30.0)),

              MaterialButton(
                color: Colors.red,
                onPressed: (){
                  questionNumber = 0;
                  finalScore = 0;
                  Navigator.pop(context);
                },
                child: Text("Reset Quiz",
                  style: TextStyle(
                      fontSize: 20.0,
                      color: Colors.white
                  )))
            ],
          ),
        ),
      ),
    );
  }
}