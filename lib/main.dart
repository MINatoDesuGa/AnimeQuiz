import 'package:flutter/material.dart';
import 'animelist.dart';
import 'dart:io';

void main() {
  runApp(MaterialApp(
    home: menu(),
  ));
}

double h, w;

class menu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    h = MediaQuery.of(context).size.height - kToolbarHeight;
    w = MediaQuery.of(context).size.width;

    return WillPopScope(
      onWillPop: () async {
        exit(0);
        return false;
      },
      child: Scaffold(
        backgroundColor: Colors.blue,
        body: Column(
          children: <Widget>[
            SizedBox(
              height: h * 0.1,
          ),

            Container(
              padding: EdgeInsets.only(left:10.0, right: 10.0),
              color: Colors.orange,
              child: Text('Short Anime\n       Quiz',
                style: TextStyle(
                    color: Colors.red[900],
                    fontFamily: 'LondrinaSolid',
                    fontWeight: FontWeight.bold,
                    fontSize: h * 0.1
                ),
              ),
            ),

            SizedBox(
              height: h * 0.05,
            ),

            Row(
              children: <Widget>[
                SizedBox(
                  width: w * 0.2,
                ),

                CircleAvatar(
                  backgroundColor: Colors.black,
                  backgroundImage: AssetImage('assets/home.png'),
                  radius: w * 0.3,
                )
              ],
            ),

            SizedBox(
              height: h * 0.07,
            ),

            Container(
              child: RaisedButton(
                  elevation: 10,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(10.0))),
                  color: Colors.deepOrange,
                  onPressed: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context) => list()),);
                  },

                  child: Text('IKIMASHOU!',
                    style: TextStyle(
                      fontFamily: 'BalsamiqSans',
                      fontSize: h * 0.07,
                      fontWeight: FontWeight.bold
                    ),
                  ),

                  ),
            )
          ],
        ),
      ),
    );
  }
}
