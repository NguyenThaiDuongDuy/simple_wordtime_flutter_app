import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_word_time/Service/world_time.dart';

class Location extends StatefulWidget {
  @override
  _LocationState createState() => _LocationState();
}

class _LocationState extends State<Location> {

  void updateTime(index) async {
    WorldTime instance = listcountry[index];
    await instance.getTime();
    Navigator.pop(context, {
      "location":instance.location,
      "flag":instance.flag,
      "time":instance.time,
      "isday":instance.isday
    });
  }
  List <WorldTime> listcountry = [
    WorldTime(location: "NewYork",flag: "AmericaFlag.png",url: "America/New_York"),
    WorldTime(location: "VietNam",flag: "VietNamFlag.png",url: "Asia/Ho_Chi_Minh"),
    WorldTime(location: "HongKong",flag:"HongKongFlag.png", url:"/Asia/Hong_Kong")];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Location"
        ),
      ),
      body: ListView.builder(
        itemCount: listcountry.length,
        itemBuilder: (context, index){
          return Card(
            child: ListTile(
              onTap: (){
                updateTime(index);
              },
              leading: CircleAvatar(
                backgroundImage: AssetImage("assets/images/${listcountry[index].flag}"),
              ),
              title: Text("${listcountry[index].location}"),
            ),
          );
        },
      ),
    );
  }
}

