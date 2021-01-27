import 'dart:async';
import 'dart:io';
import 'package:flutter/material.dart';
import 'main.dart';
import 'animelist.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:audioplayers/audio_cache.dart';
import 'package:audioplayers/audioplayers.dart';

//naruto shippuden score setter & getter
Future<void> set_narutoS_Score() async {
  final prefs = await SharedPreferences.getInstance();
  prefs.setInt('nSscore', Score[1]);
}

Future<int> get_narutoS_Score() async { // Async func to handle Futures easier; or use Future.then
  final prefs = await SharedPreferences.getInstance();
  return (prefs.getInt('nSscore'));
}

AudioCache player;

void CorrectSound () {
  player.play('correct.mp3');
}

void WrongSound () {
  player.play('wrong.mp3');
}

CustomDialog(BuildContext context) {
  return showDialog(
      context: context, barrierDismissible: false, builder: (context) {
    return AlertDialog(
      title: Center(child: Text('Exit to Select Menu')),
      content: Text('Are you sure?',
        textAlign: TextAlign.center,
      ),
      actions: <Widget>[
        Row(
          children: <Widget>[
            MaterialButton(
              elevation: 5.0,
              child: Text('Yes'),
              onPressed: () {
                Navigator.push(
                  context, MaterialPageRoute(builder: (context) => list()),);
              },
            ),

            MaterialButton(onPressed: () {
              Navigator.pop(context);
            },
              elevation: 5.0,
              child: Text('No'),
            )
          ],
        )
      ],
    );
  });
}

class NarutoS extends StatefulWidget {
  @override
  _NarutoSState createState() => _NarutoSState();
}

class _NarutoSState extends State<NarutoS> {

  @override
  void initState() {
    super.initState();
    // create this only once
    player = AudioCache(prefix: "sounds/", fixedPlayer: AudioPlayer()..setReleaseMode(ReleaseMode.STOP));
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => CustomDialog(context),
      child: Scaffold(
        backgroundColor: Colors.grey,
        body: q1(),
      ),
    );
  }
}


var pressed = [false, false, false, false];

//Q1
class q1 extends StatefulWidget {
  @override
  _q1State createState() => _q1State();
}


class _q1State extends State<q1> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        SafeArea(
          child: Container(
            child: Text('Score: ${Score[1]}',
              style: TextStyle(
                  fontFamily: 'BalsamiqSans',
                  fontSize: w * 0.1),
            ),
          ),
        ),

        SizedBox(
          height: h * 0.03,
        ),

        Container(
          color: Colors.yellowAccent,
          child: Center(
            child: Text('QUESTION 1',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: w * 0.1
              ),
            ),
          ),
        ),

        SizedBox(
          height: h * 0.1,
        ),

        Row(
          children: <Widget>[
            SizedBox(
              width: w * 0.06,
            ),

            Card(
              color: Colors.black,
              child: Center(
                child: Text(" Who was Tsunade's \n fiancee? ",
                  style: TextStyle(
                      color: Colors.white,
                      fontFamily: 'SourceSansPro',
                      fontWeight: FontWeight.w700,
                      fontSize: w * 0.09
                  ),
                ),
              ),
            ),
          ],
        ),

        SizedBox(
          height: h * 0.05,
        ),

        ButtonTheme(
          minWidth: 300.0,
          child: FlatButton(
              color: pressed[0] ? Colors.red : Colors.white,
              onPressed: (){
                WrongSound();
                setState(() {
                  pressed[0] = true;
                });
                Timer(Duration(seconds: 1), () {
                  pressed[0] = false;
                  Navigator.push(context, MaterialPageRoute(builder: (context) => q2()),);
                });
              },
              child: Text('1. Orochimaru',
                style: TextStyle(
                    fontFamily: 'SourceSansPro',
                    fontWeight: FontWeight.w500,
                    fontSize: w * 0.08
                ),
              )
          ),
        ),

        SizedBox(
          height: h * 0.02,
        ),

        ButtonTheme(
          minWidth: 300,
          child: FlatButton(
              color: pressed[1] ? Colors.red : Colors.white,
              onPressed: (){
                WrongSound();
                setState(() {
                  pressed[1] = true;
                });
                Timer(Duration(seconds: 1), () {
                  pressed[1] = false;
                  Navigator.push(context, MaterialPageRoute(builder: (context) => q2()),);
                });
              },
              child: Text('2. Jiraiya',
                style: TextStyle(
                    fontFamily: 'SourceSansPro',
                    fontWeight: FontWeight.w500,
                    fontSize: w * 0.08
                ),
              )
          ),
        ),

        SizedBox(
          height: h * 0.02,
        ),

        ButtonTheme(
          minWidth: 300,
          child: FlatButton(
              color: pressed[2] ? Colors.green : Colors.white,
              onPressed: (){
                CorrectSound();
                setState(() {
                  Score[1]++;
                  pressed[2] = true;
                });
                Timer(Duration(seconds: 1), () {
                  pressed[2] = false;
                  Navigator.push(context, MaterialPageRoute(builder: (context) => q2()),);
                });
              },
              child: Text('3. Dan',
                style: TextStyle(
                    fontFamily: 'SourceSansPro',
                    fontWeight: FontWeight.w500,
                    fontSize: w * 0.08
                ),
              )
          ),
        ),

        SizedBox(
          height: h * 0.02,
        ),

        ButtonTheme(
          minWidth: 300,
          child: FlatButton(
              color: pressed[3] ? Colors.red : Colors.white,
              onPressed: (){
                WrongSound();
                setState(() {
                  pressed[3] = true;
                });
                Timer(Duration(seconds: 1), () {
                  pressed[3] = false;
                  Navigator.push(context, MaterialPageRoute(builder: (context) => q2()),);
                });
              },
              child: Text('4. Nawaki',
                style: TextStyle(
                    fontFamily: 'SourceSansPro',
                    fontWeight: FontWeight.w500,
                    fontSize: w * 0.08
                ),
              )
          ),
        ),
      ],
    );
  }
}

//Q2
class q2 extends StatefulWidget {
  @override
  _q2State createState() => _q2State();
}

class _q2State extends State<q2> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => CustomDialog(context),
      child: Scaffold(
        backgroundColor: Colors.grey,
        body: Column(
          children: <Widget>[
            SafeArea(
              child: Container(
                child: Text('Score: ${Score[1]}',
                  style: TextStyle(
                      fontFamily: 'BalsamiqSans',
                      fontSize: w * 0.1),
                ),
              ),
            ),

            SizedBox(
              height: h * 0.03,
            ),

            Container(
              color: Colors.yellowAccent,
              child: Center(
                child: Text('QUESTION 2',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: w * 0.1
                  ),
                ),
              ),
            ),

            SizedBox(
              height: h * 0.1,
            ),

            Row(
              children: <Widget>[
                SizedBox(
                  width: w * 0.06,
                ),

                Card(
                  color: Colors.black,
                  child: Center(
                    child: Text(' Which among these \n Akatsuki members died \n first? ',
                      style: TextStyle(
                          color: Colors.white,
                          fontFamily: 'SourceSansPro',
                          fontWeight: FontWeight.w700,
                          fontSize: w * 0.08
                      ),
                    ),
                  ),
                ),
              ],
            ),

            SizedBox(
              height: h * 0.05,
            ),

            ButtonTheme(
              minWidth: 320.0,
              child: FlatButton(
                  color: pressed[0] ? Colors.red : Colors.white,
                  onPressed: (){
                    WrongSound();
                    setState(() {
                      pressed[0] = true;
                    });
                    Timer(Duration(seconds: 1), () {
                      pressed[0] = false;
                      Navigator.push(context, MaterialPageRoute(builder: (context) => q3()),);
                    });
                  },
                  child: Text('1. Deidara',
                    style: TextStyle(
                        fontFamily: 'SourceSansPro',
                        fontWeight: FontWeight.w500,
                        fontSize: w * 0.08
                    ),
                  )
              ),
            ),

            SizedBox(
              height: h * 0.02,
            ),

            ButtonTheme(
              minWidth: 320,
              child: FlatButton(
                  color: pressed[1] ? Colors.red : Colors.white,
                  onPressed: (){
                    WrongSound();
                    setState(() {
                      pressed[1] = true;
                    });
                    Timer(Duration(seconds: 1), () {
                      pressed[1] = false;
                      Navigator.push(context, MaterialPageRoute(builder: (context) => q3()),);
                    });
                  },
                  child: Text('2. Itachi',
                    style: TextStyle(
                        fontFamily: 'SourceSansPro',
                        fontWeight: FontWeight.w500,
                        fontSize: w * 0.08
                    ),
                  )
              ),
            ),

            SizedBox(
              height: h * 0.02,
            ),

            ButtonTheme(
              minWidth: 320,
              child: FlatButton(
                  color: pressed[2] ? Colors.green : Colors.white,
                  onPressed: (){
                    CorrectSound();
                    setState(() {
                      Score[1]++;
                      pressed[2] = true;
                    });
                    Timer(Duration(seconds: 1), () {
                      pressed[2] = false;
                      Navigator.push(context, MaterialPageRoute(builder: (context) => q3()),);
                    });
                  },
                  child: Text('3. Sasori',
                    style: TextStyle(
                        fontFamily: 'SourceSansPro',
                        fontWeight: FontWeight.w500,
                        fontSize: w * 0.08
                    ),
                  )
              ),
            ),

            SizedBox(
              height: h * 0.02,
            ),

            ButtonTheme(
              minWidth: 320,
              child: FlatButton(
                  color: pressed[3] ? Colors.red : Colors.white,
                  onPressed: (){
                    WrongSound();
                    setState(() {
                      pressed[3] = true;
                    });
                    Timer(Duration(seconds: 1), () {
                      pressed[3] = false;
                      Navigator.push(context, MaterialPageRoute(builder: (context) => q3()),);
                    });
                  },
                  child: Text('4. Kakuzu',
                    style: TextStyle(
                        fontFamily: 'SourceSansPro',
                        fontWeight: FontWeight.w500,
                        fontSize: w * 0.08
                    ),
                  )
              ),
            ),
          ],
        ),
      ),
    );
  }
}

//Q3
class q3 extends StatefulWidget {
  @override
  _q3State createState() => _q3State();
}

class _q3State extends State<q3> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => CustomDialog(context),
      child: Scaffold(
        backgroundColor: Colors.grey,
        body: Column(
          children: <Widget>[
            SafeArea(
              child: Container(
                child: Text('Score: ${Score[1]}',
                  style: TextStyle(
                      fontFamily: 'BalsamiqSans',
                      fontSize: w * 0.1),
                ),
              ),
            ),

            SizedBox(
              height: h * 0.03,
            ),

            Container(
              color: Colors.yellowAccent,
              child: Center(
                child: Text('QUESTION 3',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: w * 0.1
                  ),
                ),
              ),
            ),

            SizedBox(
              height: h * 0.1,
            ),

            Row(
              children: <Widget>[
                SizedBox(
                  width: w * 0.06,
                ),

                Card(
                  color: Colors.black,
                  child: Center(
                    child: Text(" Which element does the \n Uchiha clan seems to \n specialize in?",
                      style: TextStyle(
                          color: Colors.white,
                          fontFamily: 'SourceSansPro',
                          fontWeight: FontWeight.w700,
                          fontSize: w * 0.08
                      ),
                    ),
                  ),
                ),
              ],
            ),

            SizedBox(
              height: h * 0.05,
            ),

            ButtonTheme(
              minWidth: 320.0,
              child: FlatButton(
                  color: pressed[0] ? Colors.green : Colors.white,
                  onPressed: (){
                    CorrectSound();
                    setState(() {
                      Score[1]++;
                      pressed[0] = true;
                    });
                    Timer(Duration(seconds: 1), () {
                      pressed[0] = false;
                      Navigator.push(context, MaterialPageRoute(builder: (context) => q4()),);
                    });
                  },
                  child: Text('1. Katon',
                    style: TextStyle(
                        fontFamily: 'SourceSansPro',
                        fontWeight: FontWeight.w500,
                        fontSize: w * 0.08
                    ),
                  )
              ),
            ),

            SizedBox(
              height: h * 0.02,
            ),

            ButtonTheme(
              minWidth: 320,
              child: FlatButton(
                  color: pressed[1] ? Colors.red : Colors.white,
                  onPressed: (){
                    WrongSound();
                    setState(() {
                      pressed[1] = true;
                    });
                    Timer(Duration(seconds: 1), () {
                      pressed[1] = false;
                      Navigator.push(context, MaterialPageRoute(builder: (context) => q4()),);
                    });
                  },
                  child: Text('2. Fuuton',
                    style: TextStyle(
                        fontFamily: 'SourceSansPro',
                        fontWeight: FontWeight.w500,
                        fontSize: w * 0.08
                    ),
                  )
              ),
            ),

            SizedBox(
              height: h * 0.02,
            ),

            ButtonTheme(
              minWidth: 320,
              child: FlatButton(
                  color: pressed[2] ? Colors.red : Colors.white,
                  onPressed: (){
                    WrongSound();
                    setState(() {
                      pressed[2] = true;
                    });
                    Timer(Duration(seconds: 1), () {
                      pressed[2] = false;
                      Navigator.push(context, MaterialPageRoute(builder: (context) => q4()),);
                    });
                  },
                  child: Text('3. Suiton',
                    style: TextStyle(
                        fontFamily: 'SourceSansPro',
                        fontWeight: FontWeight.w500,
                        fontSize: w * 0.08
                    ),
                  )
              ),
            ),

            SizedBox(
              height: h * 0.02,
            ),

            ButtonTheme(
              minWidth: 320,
              child: FlatButton(
                  color: pressed[3] ? Colors.red : Colors.white,
                  onPressed: (){
                    WrongSound();
                    setState(() {
                      pressed[3] = true;
                    });
                    Timer(Duration(seconds: 1), () {
                      pressed[3] = false;
                      Navigator.push(context, MaterialPageRoute(builder: (context) => q4()),);
                    });
                  },
                  child: Text('4. Koton',
                    style: TextStyle(
                        fontFamily: 'SourceSansPro',
                        fontWeight: FontWeight.w500,
                        fontSize: w * 0.08
                    ),
                  )
              ),
            ),
          ],
        ),
      ),
    );
  }
}

//Q4
class q4 extends StatefulWidget {
  @override
  _q4State createState() => _q4State();
}

class _q4State extends State<q4> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => CustomDialog(context),
      child: Scaffold(
        backgroundColor: Colors.grey,
        body: Column(
          children: <Widget>[
            SafeArea(
              child: Container(
                child: Text('Score: ${Score[1]}',
                  style: TextStyle(
                      fontFamily: 'BalsamiqSans',
                      fontSize: w * 0.1),
                ),
              ),
            ),

            SizedBox(
              height: h * 0.01,
            ),

            Container(
              color: Colors.yellowAccent,
              child: Center(
                child: Text('QUESTION 4',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: w * 0.1
                  ),
                ),
              ),
            ),

            SizedBox(
              height: h * 0.01,
            ),

            Row(
              children: <Widget>[
                SizedBox(
                  width: w * 0.06,
                ),

                Card(
                  color: Colors.black,
                  child: Center(
                    child: Text(" Sasori was first seen as one \n of his puppet. What is the \n puppet's name? ",
                      style: TextStyle(
                          color: Colors.white,
                          fontFamily: 'SourceSansPro',
                          fontWeight: FontWeight.w700,
                          fontSize: w * 0.07
                      ),
                    ),
                  ),
                ),
              ],
            ),

            SizedBox(
              height: h * 0.005,
            ),

            Container(
              height: h * 0.3,
              width: w * 0.9,
              child: Image.asset('assets/narutoS/q4.jpg'),
            ),

            SizedBox(
              height: h * 0.01,
            ),

            ButtonTheme(
              minWidth: 320.0,
              child: FlatButton(
                  color: pressed[0] ? Colors.red : Colors.white,
                  onPressed: (){
                    WrongSound();
                    setState(() {
                      pressed[0] = true;
                    });
                    Timer(Duration(seconds: 1), () {
                      pressed[0] = false;
                      Navigator.push(context, MaterialPageRoute(builder: (context) => q5()),);
                    });
                  },
                  child: Text('1. Karuki',
                    style: TextStyle(
                        fontFamily: 'SourceSansPro',
                        fontWeight: FontWeight.w500,
                        fontSize: w * 0.08
                    ),
                  )
              ),
            ),

            SizedBox(
              height: h * 0.02,
            ),

            ButtonTheme(
              minWidth: 320,
              child: FlatButton(
                  color: pressed[1] ? Colors.red : Colors.white,
                  onPressed: (){
                    WrongSound();
                    setState(() {
                      pressed[1] = true;
                    });
                    Timer(Duration(seconds: 1), () {
                      pressed[1] = false;
                      Navigator.push(context, MaterialPageRoute(builder: (context) => q5()),);
                    });
                  },
                  child: Text('2. Karasu',
                    style: TextStyle(
                        fontFamily: 'SourceSansPro',
                        fontWeight: FontWeight.w500,
                        fontSize: w * 0.08
                    ),
                  )
              ),
            ),

            SizedBox(
              height: h * 0.02,
            ),

            ButtonTheme(
              minWidth: 320,
              child: FlatButton(
                  color: pressed[2] ? Colors.red : Colors.white,
                  onPressed: (){
                    WrongSound();
                    setState(() {
                      pressed[2] = true;
                    });
                    Timer(Duration(seconds: 1), () {
                      pressed[2] = false;
                      Navigator.push(context, MaterialPageRoute(builder: (context) => q5()),);
                    });
                  },
                  child: Text('3. Kuro',
                    style: TextStyle(
                        fontFamily: 'SourceSansPro',
                        fontWeight: FontWeight.w500,
                        fontSize: w * 0.08
                    ),
                  )
              ),
            ),

            SizedBox(
              height: h * 0.02,
            ),

            ButtonTheme(
              minWidth: 320,
              child: FlatButton(
                  color: pressed[3] ? Colors.green : Colors.white,
                  onPressed: (){
                    CorrectSound();
                    setState(() {
                      Score[1]++;
                      pressed[3] = true;
                    });
                    Timer(Duration(seconds: 1), () {
                      pressed[3] = false;
                      Navigator.push(context, MaterialPageRoute(builder: (context) => q5()),);
                    });
                  },
                  child: Text('4. Hiruko',
                    style: TextStyle(
                        fontFamily: 'SourceSansPro',
                        fontWeight: FontWeight.w500,
                        fontSize: w * 0.08
                    ),
                  )
              ),
            ),
          ],
        ),
      ),
    );
  }
}

//Q5
class q5 extends StatefulWidget {
  @override
  _q5State createState() => _q5State();
}

class _q5State extends State<q5> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => CustomDialog(context),
      child: Scaffold(
        backgroundColor: Colors.grey,
        body: Column(
          children: <Widget>[
            SafeArea(
              child: Container(
                child: Text('Score: ${Score[1]}',
                  style: TextStyle(
                      fontFamily: 'BalsamiqSans',
                      fontSize: w * 0.1),
                ),
              ),
            ),

            SizedBox(
              height: h * 0.03,
            ),

            Container(
              color: Colors.yellowAccent,
              child: Center(
                child: Text('QUESTION 5',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: w * 0.1
                  ),
                ),
              ),
            ),

            SizedBox(
              height: h * 0.1,
            ),

            Row(
              children: <Widget>[
                SizedBox(
                  width: w * 0.06,
                ),

                Card(
                  color: Colors.black,
                  child: Center(
                    child: Text(' Which of the following \n jutsu did Naruto create? ',
                      style: TextStyle(
                          color: Colors.white,
                          fontFamily: 'SourceSansPro',
                          fontWeight: FontWeight.w700,
                          fontSize: w * 0.08
                      ),
                    ),
                  ),
                ),
              ],
            ),

            SizedBox(
              height: h * 0.05,
            ),

            ButtonTheme(
              minWidth: 320.0,
              child: FlatButton(
                  color: pressed[0] ? Colors.red : Colors.white,
                  onPressed: (){
                    WrongSound();
                    setState(() {
                      pressed[0] = true;
                    });
                    Timer(Duration(seconds: 1), () {
                      pressed[0] = false;
                      Navigator.push(context, MaterialPageRoute(builder: (context) => q6()),);
                    });
                  },
                  child: Text('1. Rasengan',
                    style: TextStyle(
                        fontFamily: 'SourceSansPro',
                        fontWeight: FontWeight.w500,
                        fontSize: w * 0.08
                    ),
                  )
              ),
            ),

            SizedBox(
              height: h * 0.02,
            ),

            ButtonTheme(
              minWidth: 320,
              child: FlatButton(
                  color: pressed[1] ? Colors.green : Colors.white,
                  onPressed: (){
                    CorrectSound();
                    setState(() {
                      Score[1]++;
                      pressed[1] = true;
                    });
                    Timer(Duration(seconds: 1), () {
                      pressed[1] = false;
                      Navigator.push(context, MaterialPageRoute(builder: (context) => q6()),);
                    });
                  },
                  child: Text('2. Rasen Shuriken',
                    style: TextStyle(
                        fontFamily: 'SourceSansPro',
                        fontWeight: FontWeight.w500,
                        fontSize: w * 0.08
                    ),
                  )
              ),
            ),

            SizedBox(
              height: h * 0.02,
            ),

            ButtonTheme(
              minWidth: 320,
              child: FlatButton(
                  color: pressed[2] ? Colors.red : Colors.white,
                  onPressed: (){
                    WrongSound();
                    setState(() {
                      pressed[2] = true;
                    });
                    Timer(Duration(seconds: 1), () {
                      pressed[2] = false;
                      Navigator.push(context, MaterialPageRoute(builder: (context) => q6()),);
                    });
                  },
                  child: Text('3. Kage Bunshin',
                    style: TextStyle(
                        fontFamily: 'SourceSansPro',
                        fontWeight: FontWeight.w500,
                        fontSize: w * 0.08
                    ),
                  )
              ),
            ),

            SizedBox(
              height: h * 0.02,
            ),

            ButtonTheme(
              minWidth: 320,
              child: FlatButton(
                  color: pressed[3] ? Colors.red : Colors.white,
                  onPressed: (){
                    WrongSound();
                    setState(() {
                      pressed[3] = true;
                    });
                    Timer(Duration(seconds: 1), () {
                      pressed[3] = false;
                      Navigator.push(context, MaterialPageRoute(builder: (context) => q6()),);
                    });
                  },
                  child: Text('4. Kuchiyose',
                    style: TextStyle(
                        fontFamily: 'SourceSansPro',
                        fontWeight: FontWeight.w500,
                        fontSize: w * 0.08
                    ),
                  )
              ),
            ),
          ],
        ),
      ),
    );
  }
}

//Q6
class q6 extends StatefulWidget {
  @override
  _q6State createState() => _q6State();
}

class _q6State extends State<q6> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => CustomDialog(context),
      child: Scaffold(
        backgroundColor: Colors.grey,
        body: Column(
          children: <Widget>[
            SafeArea(
              child: Container(
                child: Text('Score: ${Score[1]}',
                  style: TextStyle(
                      fontFamily: 'BalsamiqSans',
                      fontSize: w * 0.1),
                ),
              ),
            ),

            SizedBox(
              height: h * 0.01,
            ),

            Container(
              color: Colors.yellowAccent,
              child: Center(
                child: Text('QUESTION 6',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: w * 0.1
                  ),
                ),
              ),
            ),

            SizedBox(
              height: h * 0.01,
            ),

            Row(
              children: <Widget>[
                SizedBox(
                  width: w * 0.07,
                ),

                Card(
                  color: Colors.black,
                  child: Center(
                    child: Text(" Who were in the sealing \n group to seal Sanbi? ",
                      style: TextStyle(
                          color: Colors.white,
                          fontFamily: 'SourceSansPro',
                          fontWeight: FontWeight.w700,
                          fontSize: w * 0.08
                      ),
                    ),
                  ),
                ),
              ],
            ),

            SizedBox(
              height: h * 0.03,
            ),

            Container(
              height: h * 0.3,
              width: w * 0.8,
              child: Image.asset('assets/narutoS/q6.png'),
            ),

            SizedBox(
              height: h * 0.03,
            ),

            ButtonTheme(
              //minWidth: 600,
              child: FlatButton(
                  color: pressed[0] ? Colors.green : Colors.white,
                  onPressed: (){
                    CorrectSound();
                    setState(() {
                      Score[1]++;
                      pressed[0] = true;
                    });
                    Timer(Duration(seconds: 1), () {
                      pressed[0] = false;
                      Navigator.push(context, MaterialPageRoute(builder: (context) => q7()),);
                    });
                  },
                  child: Text('1. Shijune,Hinata,Sakura,Ino',
                    style: TextStyle(
                        fontFamily: 'SourceSansPro',
                        fontWeight: FontWeight.w500,
                        fontSize: w * 0.07
                    ),
                  )
              ),
            ),

            SizedBox(
              height: h * 0.02,
            ),

            ButtonTheme(
              minWidth: 385,
              child: FlatButton(
                  color: pressed[1] ? Colors.red : Colors.white,
                  onPressed: (){
                    WrongSound();
                    setState(() {
                      pressed[1] = true;
                    });
                    Timer(Duration(seconds: 1), () {
                      pressed[1] = false;
                      Navigator.push(context, MaterialPageRoute(builder: (context) => q7()),);
                    });
                  },
                  child: Text('2. Yamato,Tenten,Kiba,Lee',
                    style: TextStyle(
                        fontFamily: 'SourceSansPro',
                        fontWeight: FontWeight.w500,
                        fontSize: w * 0.07
                    ),
                  )
              ),
            ),

            SizedBox(
              height: h * 0.02,
            ),

            ButtonTheme(
              minWidth: 385,
              child: FlatButton(
                  color: pressed[2] ? Colors.red : Colors.white,
                  onPressed: (){
                    WrongSound();
                    setState(() {
                      pressed[2] = true;
                    });
                    Timer(Duration(seconds: 1), () {
                      pressed[2] = false;
                      Navigator.push(context, MaterialPageRoute(builder: (context) => q7()),);
                    });
                  },
                  child: Text('3. Anko,Sakura,Ino,Hinata',
                    style: TextStyle(
                        fontFamily: 'SourceSansPro',
                        fontWeight: FontWeight.w500,
                        fontSize: w * 0.07
                    ),
                  )
              ),
            ),

            SizedBox(
              height: h * 0.02,
            ),

            ButtonTheme(
              minWidth: 385,
              child: FlatButton(
                  color: pressed[3] ? Colors.red : Colors.white,
                  onPressed: (){
                    WrongSound();
                    setState(() {
                      pressed[3] = true;
                    });
                    Timer(Duration(seconds: 1), () {
                      pressed[3] = false;
                      Navigator.push(context, MaterialPageRoute(builder: (context) => q7()),);
                    });
                  },
                  child: Text('4. Naruto,Kakashi,Sai,Ino',
                    style: TextStyle(
                        fontFamily: 'SourceSansPro',
                        fontWeight: FontWeight.w500,
                        fontSize: w * 0.07
                    ),
                  )
              ),
            ),
          ],
        ),
      ),
    );
  }
}

//Q7
class q7 extends StatefulWidget {
  @override
  _q7State createState() => _q7State();
}

class _q7State extends State<q7> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => CustomDialog(context),
      child: Scaffold(
        backgroundColor: Colors.grey,
        body: Column(
          children: <Widget>[
            SafeArea(
              child: Container(
                child: Text('Score: ${Score[1]}',
                  style: TextStyle(
                      fontFamily: 'BalsamiqSans',
                      fontSize: w * 0.1),
                ),
              ),
            ),

            SizedBox(
              height: h * 0.03,
            ),

            Container(
              color: Colors.yellowAccent,
              child: Center(
                child: Text('QUESTION 7',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: w * 0.1
                  ),
                ),
              ),
            ),

            SizedBox(
              height: h * 0.1,
            ),

            Row(
              children: <Widget>[
                SizedBox(
                  width: w * 0.06,
                ),

                Card(
                  color: Colors.black,
                  child: Center(
                    child: Text(' How long did the 4th \n Great Ninja War lasted? ',
                      style: TextStyle(
                          color: Colors.white,
                          fontFamily: 'SourceSansPro',
                          fontWeight: FontWeight.w700,
                          fontSize: w * 0.08
                      ),
                    ),
                  ),
                ),
              ],
            ),

            SizedBox(
              height: h * 0.05,
            ),

            ButtonTheme(
              minWidth: 320.0,
              child: FlatButton(
                  color: pressed[0] ? Colors.red : Colors.white,
                  onPressed: (){
                    WrongSound();
                    setState(() {
                      pressed[0] = true;
                    });
                    Timer(Duration(seconds: 1), () {
                      pressed[0] = false;
                      Navigator.push(context, MaterialPageRoute(builder: (context) => q8()),);
                    });
                  },
                  child: Text('1. 7 days',
                    style: TextStyle(
                        fontFamily: 'SourceSansPro',
                        fontWeight: FontWeight.w500,
                        fontSize: w * 0.08
                    ),
                  )
              ),
            ),

            SizedBox(
              height: h * 0.02,
            ),

            ButtonTheme(
              minWidth: 320,
              child: FlatButton(
                  color: pressed[1] ? Colors.green : Colors.white,
                  onPressed: (){
                    CorrectSound();
                    setState(() {
                      Score[1]++;
                      pressed[1] = true;
                    });
                    Timer(Duration(seconds: 1), () {
                      pressed[1] = false;
                      Navigator.push(context, MaterialPageRoute(builder: (context) => q8()),);
                    });
                  },
                  child: Text('2. 2 days',
                    style: TextStyle(
                        fontFamily: 'SourceSansPro',
                        fontWeight: FontWeight.w500,
                        fontSize: w * 0.08
                    ),
                  )
              ),
            ),

            SizedBox(
              height: h * 0.02,
            ),

            ButtonTheme(
              minWidth: 320,
              child: FlatButton(
                  color: pressed[2] ? Colors.red : Colors.white,
                  onPressed: (){
                    WrongSound();
                    setState(() {
                      pressed[2] = true;
                    });
                    Timer(Duration(seconds: 1), () {
                      pressed[2] = false;
                      Navigator.push(context, MaterialPageRoute(builder: (context) => q8()),);
                    });
                  },
                  child: Text('3. 4 days',
                    style: TextStyle(
                        fontFamily: 'SourceSansPro',
                        fontWeight: FontWeight.w500,
                        fontSize: w * 0.08
                    ),
                  )
              ),
            ),

            SizedBox(
              height: h * 0.02,
            ),

            ButtonTheme(
              minWidth: 320,
              child: FlatButton(
                  color: pressed[3] ? Colors.red : Colors.white,
                  onPressed: (){
                    WrongSound();
                    setState(() {
                      pressed[3] = true;
                    });
                    Timer(Duration(seconds: 1), () {
                      pressed[3] = false;
                      Navigator.push(context, MaterialPageRoute(builder: (context) => q8()),);
                    });
                  },
                  child: Text('4. 13 days',
                    style: TextStyle(
                        fontFamily: 'SourceSansPro',
                        fontWeight: FontWeight.w500,
                        fontSize: w * 0.08
                    ),
                  )
              ),
            ),
          ],
        ),
      ),
    );
  }
}

//Q8
class q8 extends StatefulWidget {
  @override
  _q8State createState() => _q8State();
}

class _q8State extends State<q8> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => CustomDialog(context),
      child: Scaffold(
        backgroundColor: Colors.grey,
        body: Column(
          children: <Widget>[
            SafeArea(
              child: Container(
                child: Text('Score: ${Score[1]}',
                  style: TextStyle(
                      fontFamily: 'BalsamiqSans',
                      fontSize: w * 0.1),
                ),
              ),
            ),

            SizedBox(
              height: h * 0.03,
            ),

            Container(
              color: Colors.yellowAccent,
              child: Center(
                child: Text('QUESTION 8',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: w * 0.1
                  ),
                ),
              ),
            ),

            SizedBox(
              height: h * 0.1,
            ),

            Row(
              children: <Widget>[
                SizedBox(
                  width: w * 0.06,
                ),

                Card(
                  color: Colors.black,
                  child: Center(
                    child: Text(' Which elite shinobi died \n in the 4th Great Ninja \n War? ',
                      style: TextStyle(
                          color: Colors.white,
                          fontFamily: 'SourceSansPro',
                          fontWeight: FontWeight.w700,
                          fontSize: w * 0.08
                      ),
                    ),
                  ),
                ),
              ],
            ),

            SizedBox(
              height: h * 0.05,
            ),

            ButtonTheme(
              minWidth: 320.0,
              child: FlatButton(
                  color: pressed[0] ? Colors.red : Colors.white,
                  onPressed: (){
                    WrongSound();
                    setState(() {
                      pressed[0] = true;
                    });
                    Timer(Duration(seconds: 1), () {
                      pressed[0] = false;
                      Navigator.push(context, MaterialPageRoute(builder: (context) => q9()),);
                    });
                  },
                  child: Text('1. Shikaku Nara',
                    style: TextStyle(
                        fontFamily: 'SourceSansPro',
                        fontWeight: FontWeight.w500,
                        fontSize: w * 0.08
                    ),
                  )
              ),
            ),

            SizedBox(
              height: h * 0.02,
            ),

            ButtonTheme(
              minWidth: 320,
              child: FlatButton(
                  color: pressed[1] ? Colors.red : Colors.white,
                  onPressed: (){
                    WrongSound();
                    setState(() {
                      pressed[1] = true;
                    });
                    Timer(Duration(seconds: 1), () {
                      pressed[1] = false;
                      Navigator.push(context, MaterialPageRoute(builder: (context) => q9()),);
                    });
                  },
                  child: Text('2. Neji',
                    style: TextStyle(
                        fontFamily: 'SourceSansPro',
                        fontWeight: FontWeight.w500,
                        fontSize: w * 0.08
                    ),
                  )
              ),
            ),

            SizedBox(
              height: h * 0.02,
            ),

            ButtonTheme(
              minWidth: 320,
              child: FlatButton(
                  color: pressed[2] ? Colors.green : Colors.white,
                  onPressed: (){
                    CorrectSound();
                    setState(() {
                      Score[1]++;
                      pressed[2] = true;
                    });
                    Timer(Duration(seconds: 1), () {
                      pressed[2] = false;
                      Navigator.push(context, MaterialPageRoute(builder: (context) => q9()),);
                    });
                  },
                  child: Text('3. All of them',
                    style: TextStyle(
                        fontFamily: 'SourceSansPro',
                        fontWeight: FontWeight.w500,
                        fontSize: w * 0.08
                    ),
                  )
              ),
            ),

            SizedBox(
              height: h * 0.02,
            ),

            ButtonTheme(
              minWidth: 320,
              child: FlatButton(
                  color: pressed[3] ? Colors.red : Colors.white,
                  onPressed: (){
                    WrongSound();
                    setState(() {
                      pressed[3] = true;
                    });
                    Timer(Duration(seconds: 1), () {
                      pressed[3] = false;
                      Navigator.push(context, MaterialPageRoute(builder: (context) => q9()),);
                    });
                  },
                  child: Text('4. Inoichi Yamanaka',
                    style: TextStyle(
                        fontFamily: 'SourceSansPro',
                        fontWeight: FontWeight.w500,
                        fontSize: w * 0.08
                    ),
                  )
              ),
            ),
          ],
        ),
      ),
    );
  }
}

//Q9
class q9 extends StatefulWidget {
  @override
  _q9State createState() => _q9State();
}

class _q9State extends State<q9> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => CustomDialog(context),
      child: Scaffold(
        backgroundColor: Colors.grey,
        body: Column(
          children: <Widget>[
            SafeArea(
              child: Container(
                child: Text('Score: ${Score[1]}',
                  style: TextStyle(
                      fontFamily: 'BalsamiqSans',
                      fontSize: w * 0.1),
                ),
              ),
            ),

            SizedBox(
              height: h * 0.03,
            ),

            Container(
              color: Colors.yellowAccent,
              child: Center(
                child: Text('QUESTION 9',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: w * 0.1
                  ),
                ),
              ),
            ),

            SizedBox(
              height: h * 0.03,
            ),

            Row(
              children: <Widget>[
                SizedBox(
                  width: w * 0.08,
                ),

                Card(
                  color: Colors.black,
                  child: Center(
                    child: Text(" What is the name of \n Lady Tsunade's Slug? ",
                      style: TextStyle(
                          color: Colors.white,
                          fontFamily: 'SourceSansPro',
                          fontWeight: FontWeight.w700,
                          fontSize: w * 0.08
                      ),
                    ),
                  ),
                ),
              ],
            ),

            SizedBox(
              height: h * 0.03,
            ),

            Container(
              height: h * 0.3,
              width: w * 0.9,
              child: Image.asset('assets/narutoS/q9.jpg'),
            ),

            SizedBox(
              height: h * 0.02,
            ),

            ButtonTheme(
              minWidth: 320.0,
              child: FlatButton(
                  color: pressed[0] ? Colors.red : Colors.white,
                  onPressed: (){
                    WrongSound();
                    setState(() {
                      pressed[0] = true;
                    });
                    Timer(Duration(seconds: 1), () {
                      pressed[0] = false;
                      Navigator.push(context, MaterialPageRoute(builder: (context) => q10()),);
                    });
                  },
                  child: Text('1. Gamatatsu',
                    style: TextStyle(
                        fontFamily: 'SourceSansPro',
                        fontWeight: FontWeight.w500,
                        fontSize: w * 0.08
                    ),
                  )
              ),
            ),

            SizedBox(
              height: h * 0.02,
            ),

            ButtonTheme(
              minWidth: 320,
              child: FlatButton(
                  color: pressed[1] ? Colors.red : Colors.white,
                  onPressed: (){
                    WrongSound();
                    setState(() {
                      pressed[1] = true;
                    });
                    Timer(Duration(seconds: 1), () {
                      pressed[1] = false;
                      Navigator.push(context, MaterialPageRoute(builder: (context) => q10()),);
                    });
                  },
                  child: Text('2. Sora',
                    style: TextStyle(
                        fontFamily: 'SourceSansPro',
                        fontWeight: FontWeight.w500,
                        fontSize: w * 0.08
                    ),
                  )
              ),
            ),

            SizedBox(
              height: h * 0.02,
            ),

            ButtonTheme(
              minWidth: 320,
              child: FlatButton(
                  color: pressed[2] ? Colors.green : Colors.white,
                  onPressed: (){
                    CorrectSound();
                    setState(() {
                      Score[1]++;
                      pressed[2] = true;
                    });
                    Timer(Duration(seconds: 1), () {
                      pressed[2] = false;
                      Navigator.push(context, MaterialPageRoute(builder: (context) => q10()),);
                    });
                  },
                  child: Text('3. Katsuyu',
                    style: TextStyle(
                        fontFamily: 'SourceSansPro',
                        fontWeight: FontWeight.w500,
                        fontSize: w * 0.08
                    ),
                  )
              ),
            ),

            SizedBox(
              height: h * 0.02,
            ),

            ButtonTheme(
              minWidth: 320,
              child: FlatButton(
                  color: pressed[3] ? Colors.red : Colors.white,
                  onPressed: (){
                    WrongSound();
                    setState(() {
                      pressed[3] = true;
                    });
                    Timer(Duration(seconds: 1), () {
                      pressed[3] = false;
                      Navigator.push(context, MaterialPageRoute(builder: (context) => q10()),);
                    });
                  },
                  child: Text('4. Ryuuka',
                    style: TextStyle(
                        fontFamily: 'SourceSansPro',
                        fontWeight: FontWeight.w500,
                        fontSize: w * 0.08
                    ),
                  )
              ),
            ),
          ],
        ),
      ),
    );
  }
}

//Q10
class q10 extends StatefulWidget {
  @override
  _q10State createState() => _q10State();
}

class _q10State extends State<q10> {

  CustomDialog1(BuildContext context) {
    return showDialog(context: context, barrierDismissible: false ,builder: (context) {
      return AlertDialog(
        title: Center(child: Text('Your Score')),
        content: Text('${Score[1]}',
          textAlign: TextAlign.center,
        ),
        actions: <Widget>[
          Row(
            children: <Widget>[
              MaterialButton(
                elevation: 5.0,
                child: Text('Exit to Select Menu'),
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => list()),);
                },
              ),

              MaterialButton(onPressed: () {
                exit(0);
              },
                elevation: 5.0,
                child: Text('Quit'),
              )
            ],
          )
        ],
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        backgroundColor: Colors.grey,
        body: Column(
          children: <Widget>[
            SafeArea(
              child: Container(
                child: Text('Score: ${Score[1]}',
                  style: TextStyle(
                      fontFamily: 'BalsamiqSans',
                      fontSize: w * 0.1),
                ),
              ),
            ),

            SizedBox(
              height: h * 0.03,
            ),

            Container(
              color: Colors.yellowAccent,
              child: Center(
                child: Text('QUESTION 10',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: w * 0.1
                  ),
                ),
              ),
            ),

            SizedBox(
              height: h * 0.1,
            ),

            Row(
              children: <Widget>[
                SizedBox(
                  width: w * 0.02,
                ),

                Card(
                  color: Colors.black,
                  child: Center(
                    child: Text(' Who became Hokage after \n the 4th Great Ninja War? ',
                      style: TextStyle(
                          color: Colors.white,
                          fontFamily: 'SourceSansPro',
                          fontWeight: FontWeight.w700,
                          fontSize: w * 0.08
                      ),
                    ),
                  ),
                ),
              ],
            ),

            SizedBox(
              height: h * 0.05,
            ),

            ButtonTheme(
              minWidth: 320.0,
              child: FlatButton(
                  color: pressed[0] ? Colors.red : Colors.white,
                  onPressed: (){
                    WrongSound();
                    setState(() {
                      pressed[0] = true;
                    });
                    Timer(Duration(seconds: 2), () {
                      pressed[0] = false;
                      set_narutoS_Score();
                      CustomDialog1(context);
                    });
                  },
                  child: Text('1. Naruto',
                    style: TextStyle(
                        fontFamily: 'SourceSansPro',
                        fontWeight: FontWeight.w500,
                        fontSize: w * 0.08
                    ),
                  )
              ),
            ),

            SizedBox(
              height: h * 0.02,
            ),

            ButtonTheme(
              minWidth: 320,
              child: FlatButton(
                  color: pressed[1] ? Colors.red : Colors.white,
                  onPressed: (){
                    WrongSound();
                    setState(() {
                      pressed[1] = true;
                    });
                    Timer(Duration(seconds: 2), () {
                      pressed[1] = false;
                      set_narutoS_Score();
                      CustomDialog1(context);
                    });
                  },
                  child: Text('2. Shikamaru',
                    style: TextStyle(
                        fontFamily: 'SourceSansPro',
                        fontWeight: FontWeight.w500,
                        fontSize: w * 0.08
                    ),
                  )
              ),
            ),

            SizedBox(
              height: h * 0.02,
            ),

            ButtonTheme(
              minWidth: 320,
              child: FlatButton(
                  color: pressed[2] ? Colors.green : Colors.white,
                  onPressed: (){
                    CorrectSound();
                    setState(() {
                      Score[1]++;
                      pressed[2] = true;
                    });
                    Timer(Duration(seconds: 2), () {
                      pressed[2] = false;
                      set_narutoS_Score();
                      CustomDialog1(context);
                    });
                  },
                  child: Text('3. Kakashi',
                    style: TextStyle(
                        fontFamily: 'SourceSansPro',
                        fontWeight: FontWeight.w500,
                        fontSize: w * 0.08
                    ),
                  )
              ),
            ),

            SizedBox(
              height: h * 0.02,
            ),

            ButtonTheme(
              minWidth: 320,
              child: FlatButton(
                  color: pressed[3] ? Colors.red : Colors.white,
                  onPressed: (){
                    WrongSound();
                    setState(() {
                      pressed[3] = true;
                    });
                    Timer(Duration(seconds: 2), () {
                      pressed[3] = false;
                      set_narutoS_Score();
                      CustomDialog1(context);
                    });
                  },
                  child: Text('4. Sasuke',
                    style: TextStyle(
                        fontFamily: 'SourceSansPro',
                        fontWeight: FontWeight.w500,
                        fontSize: w * 0.08
                    ),
                  )
              ),
            ),
          ],
        ),
      ),
    );
  }
}


