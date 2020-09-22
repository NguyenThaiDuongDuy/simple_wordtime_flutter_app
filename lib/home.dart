import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Map data = {};

  @override
  Widget build(BuildContext context) {
    data = data.isNotEmpty ? data : ModalRoute.of(context).settings.arguments;
    print("${data}");
    String imageBackGround = data['isday'] ? "day.jpg" : "night.jpg";
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/images/${imageBackGround}"),
                fit: BoxFit.cover)),
        child: Padding(
          padding: EdgeInsets.fromLTRB(0, 200, 0, 0),
          child: Center(
            child: Column(
              children: <Widget>[
                FlatButton.icon(
                    onPressed: () async {
                      dynamic result =
                          await Navigator.pushNamed(context, "/location");
                      setState(() {
                        data = {
                          "time": result['time'],
                          "isday": result['isday'],
                          "location": result['location'],
                          "flag": result['flag'],
                        };
                      });
                    },
                    icon: Icon(
                      Icons.add_location,
                      color: Colors.white,
                    ),
                    label: Text("Edit Location",
                        style: TextStyle(color: Colors.white))),
                Text(
                  "${data['location']}",
                  style: TextStyle(color: Colors.white, fontSize: 32.0),
                ),
                Text(
                  "${data['time']}",
                  style: TextStyle(color: Colors.white, fontSize: 44.0),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
