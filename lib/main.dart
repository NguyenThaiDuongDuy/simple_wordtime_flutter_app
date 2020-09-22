import 'package:flutter/material.dart';
import 'package:flutter_app_word_time/home.dart';
import 'package:flutter_app_word_time/chosse_location.dart';
import 'package:flutter_app_word_time/loading.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    initialRoute: '/',
    routes: {
      '/': (context) => Loading(),
      '/home':(context) => Home(),
      '/location':(context) => Location()
    },
  ));
}
