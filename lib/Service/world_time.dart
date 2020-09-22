import 'package:http/http.dart';
import 'dart:convert' as convert;
import 'package:intl/intl.dart';

class WorldTime {
  String url;
  String location;
  String time;
  String flag;
  String imagename;
  bool isday;

  WorldTime({this.url, this.location, this.flag});

  Future<void> getTime() async {
    print("getdata");
    // This example uses the Google Books API to search for books about http.
    // https://developers.google.com/books/docs/overview
    var murl = 'http://worldtimeapi.org/api/timezone/${url}';

    // Await the http get response, then decode the json-formatted response.
    var response = await get(murl);
    if (response.statusCode == 200) {
      Map jsonResponse = convert.jsonDecode(response.body);
      String dateTime = jsonResponse['datetime'];
      String offset = jsonResponse['utc_offset'].substring(0, 3);
      DateTime now = DateTime.parse(dateTime);
      now = now.add(Duration(hours: int.parse(offset)));
      time = DateFormat.jm().format(now);
      isday = (now.hour > 6 && now.hour < 20) ? true : false;
    } else {
      print('Request failed with status: ${response.statusCode}.');
    }
  }
}
