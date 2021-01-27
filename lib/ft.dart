import 'dart:async';
import 'dart:io';
import 'package:flutter/material.dart';
import 'main.dart';
import 'animelist.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:audioplayers/audio_cache.dart';
import 'package:audioplayers/audioplayers.dart';


//fairy tail score setter & getter
Future<void> set_ft_Score() async {
  final prefs = await SharedPreferences.getInstance();
  prefs.setInt('ftscore', Score[2]);
}

Future<int> get_ft_Score() async { // Async func to handle Futures easier; or use Future.then
  final prefs = await SharedPreferences.getInstance();
  return (prefs.getInt('ftscore'));
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

class ft extends StatefulWidget {
  @override
  _ftState createState() => _ftState();
}

class _ftState extends State<ft> {

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
            child: Text('Score: ${Score[2]}',
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
              width: w * 0.03,
            ),

            Card(
              color: Colors.black,
              child: Center(
                child: Text(" At the beginning, Natsu's \n goal was to find? ",
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
          minWidth: 365.0,
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
              child: Text('1. Zeref',
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
          minWidth: 365,
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
              child: Text('2. Mavis',
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
          minWidth: 365,
          child: FlatButton(
              color: pressed[2] ? Colors.green : Colors.white,
              onPressed: (){
                CorrectSound();
                setState(() {
                  Score[2]++;
                  pressed[2] = true;
                });
                Timer(Duration(seconds: 1), () {
                  pressed[2] = false;
                  Navigator.push(context, MaterialPageRoute(builder: (context) => q2()),);
                });
              },
              child: Text('3. Igneel',
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
          minWidth: 350,
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
              child: Text('4. Other Dragon Slayers',
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
                child: Text('Score: ${Score[2]}',
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
                  width: w * 0.07,
                ),

                Card(
                  color: Colors.black,
                  child: Center(
                    child: Text(' Which among these is \n not an armor of Erza? ',
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
              minWidth: 330.0,
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
                  child: Text('1. Heart Kreuz Armor',
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
              minWidth: 330,
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
                  child: Text('2. Giant Armor',
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
              minWidth: 330,
              child: FlatButton(
                  color: pressed[2] ? Colors.green : Colors.white,
                  onPressed: (){
                    CorrectSound();
                    setState(() {
                      Score[2]++;
                      pressed[2] = true;
                    });
                    Timer(Duration(seconds: 1), () {
                      pressed[2] = false;
                      Navigator.push(context, MaterialPageRoute(builder: (context) => q3()),);
                    });
                  },
                  child: Text('3. Black Purge Armor',
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
              minWidth: 330,
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
                  child: Text('4. Robe of Yuen',
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
                child: Text('Score: ${Score[2]}',
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
                    child: Text(' What is the full form \n of END? ',
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
              minWidth: 370.0,
              child: FlatButton(
                  color: pressed[0] ? Colors.green : Colors.white,
                  onPressed: (){
                    CorrectSound();
                    setState(() {
                      Score[2]++;
                      pressed[0] = true;
                    });
                    Timer(Duration(seconds: 1), () {
                      pressed[0] = false;
                      Navigator.push(context, MaterialPageRoute(builder: (context) => q4()),);
                    });
                  },
                  child: Text('1. Etherious Natsu Dragneel',
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
              minWidth: 375,
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
                  child: Text('2. Eternal Natsu Dragneel',
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
              minWidth: 370,
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
                  child: Text('3. Ether Natsu Dragneel',
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
              minWidth: 370,
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
                  child: Text('4. Erza Natsu Dragneel',
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
                child: Text('Score: ${Score[2]}',
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
                child: Text('QUESTION 4',
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
                  width: w * 0.03,
                ),

                Card(
                  color: Colors.black,
                  child: Center(
                    child: Text(" Which among them was Fairy \n Tail's 2nd Guild Master? ",
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
              height: h * 0.03,
            ),

            Container(
              width: w * 0.8,
              child: Image.asset('assets/ft/q4.png'),
            ),

            SizedBox(
              height: h * 0.03,
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
                  child: Text('1. Makarov',
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
                  child: Text('2. Mavis',
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
                  child: Text('3. Ivan',
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
                      Score[2]++;
                      pressed[3] = true;
                    });
                    Timer(Duration(seconds: 1), () {
                      pressed[3] = false;
                      Navigator.push(context, MaterialPageRoute(builder: (context) => q5()),);
                    });
                  },
                  child: Text('4. Hades',
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
                child: Text('Score: ${Score[2]}',
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
                    child: Text(' Jellal was possessed by \n whose dark magic? ',
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
                  child: Text('1. Zeref',
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
                      Score[2]++;
                      pressed[1] = true;
                    });
                    Timer(Duration(seconds: 1), () {
                      pressed[1] = false;
                      Navigator.push(context, MaterialPageRoute(builder: (context) => q6()),);
                    });
                  },
                  child: Text('2. Ultear',
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
                  child: Text('3. END',
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
                  child: Text('4. Mavis',
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
                child: Text('Score: ${Score[2]}',
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
              height: h * 0.02,
            ),

            Row(
              children: <Widget>[
                SizedBox(
                  width: w * 0.1,
                ),

                Card(
                  color: Colors.black,
                  child: Center(
                    child: Text(" What is the name of \n Cobra's pet snake?",
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

           // SizedBox(
            //  height: h * 0.03,
            //),

            Container(
              width: w * 0.6,
              child: Image.asset('assets/ft/q6.jpg'),
            ),

            SizedBox(
              height: h * 0.02,
            ),

            ButtonTheme(
              minWidth: 300.0,
              child: FlatButton(
                  color: pressed[0] ? Colors.green : Colors.white,
                  onPressed: (){
                    CorrectSound();
                    setState(() {
                      Score[2]++;
                      pressed[0] = true;
                    });
                    Timer(Duration(seconds: 1), () {
                      pressed[0] = false;
                      Navigator.push(context, MaterialPageRoute(builder: (context) => q7()),);
                    });
                  },
                  child: Text('1. Cubellios',
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
                      Navigator.push(context, MaterialPageRoute(builder: (context) => q7()),);
                    });
                  },
                  child: Text('2. Carla',
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
                  child: Text('3. Nagini',
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
                      Navigator.push(context, MaterialPageRoute(builder: (context) => q7()),);
                    });
                  },
                  child: Text('4. Erik',
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
                child: Text('Score: ${Score[2]}',
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
                    child: Text(' Which among these is \n not a guild? ',
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
                  child: Text('1. Lamia Scale',
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
                      Score[2]++;
                      pressed[1] = true;
                    });
                    Timer(Duration(seconds: 1), () {
                      pressed[1] = false;
                      Navigator.push(context, MaterialPageRoute(builder: (context) => q8()),);
                    });
                  },
                  child: Text('2. Cait Shelter',
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
                  child: Text('3. Love & Lucky',
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
                  child: Text('4. Southern Wolves',
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
                child: Text('Score: ${Score[2]}',
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
                  width: w * 0.03,
                ),

                Card(
                  color: Colors.black,
                  child: Center(
                    child: Text(' Who is the son of Zeref \n and Mavis?',
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
                  child: Text('1. Natsu',
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
                  child: Text('2. Larcade',
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
                      Score[2]++;
                      pressed[2] = true;
                    });
                    Timer(Duration(seconds: 1), () {
                      pressed[2] = false;
                      Navigator.push(context, MaterialPageRoute(builder: (context) => q9()),);
                    });
                  },
                  child: Text('3. August',
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
                  child: Text('4. Jellal',
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
                child: Text('Score: ${Score[2]}',
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
                    child: Text(" Who knew about Zeref and \n Mavis's son first? ",
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
                      Navigator.push(context, MaterialPageRoute(builder: (context) => q10()),);
                    });
                  },
                  child: Text('1. Ivan',
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
                  child: Text('2. Celestial King',
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
                      Score[2]++;
                      pressed[2] = true;
                    });
                    Timer(Duration(seconds: 1), () {
                      pressed[2] = false;
                      Navigator.push(context, MaterialPageRoute(builder: (context) => q10()),);
                    });
                  },
                  child: Text('3. Hades',
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
                  child: Text('4. Zera',
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
        content: Text('${Score[2]}',
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
                child: Text('Score: ${Score[2]}',
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
                  width: w * 0.06,
                ),

                Card(
                  color: Colors.black,
                  child: Center(
                    child: Text(' Who knitted the scarf \n which Natsu wears? ',
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
                      set_ft_Score();
                      CustomDialog1(context);
                    });
                  },
                  child: Text('1. Zeref',
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
                      set_ft_Score();
                      CustomDialog1(context);
                    });
                  },
                  child: Text('2. Igneel',
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
                      Score[2]++;
                      pressed[2] = true;
                    });
                    Timer(Duration(seconds: 2), () {
                      pressed[2] = false;
                      set_ft_Score();
                      CustomDialog1(context);
                    });
                  },
                  child: Text('3. Anna Heartfilia',
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
                      set_ft_Score();
                      CustomDialog1(context);
                    });
                  },
                  child: Text('4. Mavis',
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
