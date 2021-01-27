import 'package:flutter/material.dart';
import 'main.dart';
import 'naruto.dart';
import 'narutoS.dart';
import 'ft.dart';

var Score = [0, 0, 0];

class list extends StatefulWidget {
  @override
  _listState createState() => _listState();
}

class _listState extends State<list> {

  @override
  void initState() {
    get_naruto_Score().then(update_naruto_Score);
    get_narutoS_Score().then(update_narutoS_Score);
    get_ft_Score().then(update_ft_Score);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        Navigator.push(context, MaterialPageRoute(builder: (context) => menu()),);
        return false;
      },
      child: Scaffold(
        body: Alist(context),
      ),
    );
  }

  //naruto update score
  void update_naruto_Score(int score) {
    setState(() {
      if(score != null)
        Score[0] = score;
    });
  }

  //naruto shippuden update score
  void update_narutoS_Score(int score) {
    setState(() {
      if(score != null)
        Score[1] = score;
    });
  }

  //fairy tail update score
  void update_ft_Score(int score) {
    setState(() {
      if(score != null)
        Score[2] = score;
    });
  }
}

Widget Alist(BuildContext context) {
  var listview = ListView(
    children: <Widget>[
      SizedBox(
        height: h * 0.03,
  ),
      ListTile(
        title: Center(
          child: Text('Select Anime',
            style: TextStyle(
              fontFamily: 'SourceSansPro',
              fontWeight: FontWeight.bold,
              fontSize: w * 0.09,
            ),
          ),
        ),
      ),

      SizedBox(
          height: h * 0.03,
          ),
      ListTile(
        title: RaisedButton(
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(10.0))),
            color: Colors.deepOrange,
            elevation: 10,
            onPressed: (){
              Score[0] = 0;
              Navigator.push(context, MaterialPageRoute(builder: (context) => Naruto()),);
            },
            child: Text('NARUTO',
              style: TextStyle(
                fontFamily: 'ArchitectsDaughter',
                fontSize: w * 0.08,
                fontWeight: FontWeight.bold
              ),
            ),
          ),
        subtitle: Container(
            child: Row(
              children: <Widget>[
                SizedBox(
                  width: w * 0.3,
  ),
                Text('Score: ${Score[0]}/10',
                  style: TextStyle(
                    fontSize: w * 0.06
                  ),
                ),
              ],
            ),
        ),
      ),

      Divider(
        color: Colors.black,
        thickness: 3,
      ),

      ListTile(
        title: RaisedButton(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(10.0))),
          color: Colors.deepOrange,
          elevation: 10,
          onPressed: (){
            Score[1] = 0;
            Navigator.push(context, MaterialPageRoute(builder: (context) => NarutoS()),);
          },
          child: Text('NARUTO SHIPPUDEN',
            style: TextStyle(
                fontFamily: 'ArchitectsDaughter',
                fontSize: w * 0.08,
                fontWeight: FontWeight.bold
            ),
          ),
        ),
        subtitle: Container(
          child: Row(
            children: <Widget>[
              SizedBox(
                width: w * 0.3,
              ),
              Text('Score: ${Score[1]}/10',
                style: TextStyle(
                    fontSize: w * 0.06
                ),
              ),
            ],
          ),
        ),
      ),

      Divider(
        color: Colors.black,
        thickness: 3,
      ),
      ListTile(
        title: RaisedButton(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(10.0))),
          color: Colors.deepOrange,
          elevation: 10,
          onPressed: (){
            Score[2] = 0;
            Navigator.push(context, MaterialPageRoute(builder: (context) => ft()),);
          },
          child: Text('FAIRY TAIL',
            style: TextStyle(
                fontFamily: 'ArchitectsDaughter',
                fontSize: w * 0.08,
                fontWeight: FontWeight.bold
            ),
          ),
        ),
        subtitle: Container(
          child: Row(
            children: <Widget>[
              SizedBox(
                width: w * 0.3,
              ),
              Text('Score: ${Score[2]}/10',
                style: TextStyle(
                    fontSize: w * 0.06
                ),
              ),
            ],
          ),
        ),
      ),

      Divider(
        color: Colors.black,
        thickness: 3,
      ),

      ListTile(
        title: Center(
          child: Text('New quizes coming soon!',
            style: TextStyle(
              fontFamily: 'SourceSansPro',
              color: Colors.red[900],
              fontSize: w * 0.08
            ),
          ),
        ),
      )
    ],
  );

  return listview;

}
