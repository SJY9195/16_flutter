import 'package:chap03_listview/01_list_view.dart';
import 'package:chap03_listview/02_list_tile.dart';
import 'package:chap03_listview/03_list_builder.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home:
          // ListApp(),
      // ListApp2(),
       ListApp3(),
    );
  }
}