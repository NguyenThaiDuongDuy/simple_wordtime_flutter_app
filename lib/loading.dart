import 'package:flutter/material.dart';
import 'package:flutter_app_word_time/Service/world_time.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatefulWidget {
  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  void setupTime() async {
    WorldTime instance = WorldTime(
        location: "VietNam", flag: "VietNamFlag.png", url: "Asia/Ho_Chi_Minh");
    await instance.getTime();
    Navigator.pushReplacementNamed(context, "/home", arguments: {
      "location": instance.location,
      "flag": instance.flag,
      "time": instance.time,
      "isday": instance.isday
    });
  }

  @override
  void initState() {
    setupTime();
    // TODO: implement initState
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blue,
      child: Center(
        child: SpinKitChasingDots(
          size: 80,
          color: Colors.white,
        ),
      ),
    );
  }
}
