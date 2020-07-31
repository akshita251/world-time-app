import 'package:flutter/material.dart';
import 'package:world_app/pages/choose_location.dart';
import 'package:world_app/pages/home.dart';
import 'package:world_app/pages/loading_page.dart';

void main() {
  runApp(MaterialApp(
    routes: {
      '/': (context) => Loading(),
      '/home': (context) => Home(),
      '/location': (context) => ChooseLocation()
    },
  ));
}
