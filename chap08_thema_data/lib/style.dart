
import 'package:flutter/material.dart';

var theme = ThemeData(
  iconTheme: IconThemeData(color: Colors.red, size: 40),
  appBarTheme: AppBarTheme(backgroundColor: Colors.blue),
  bottomAppBarTheme: BottomAppBarTheme(color: Colors.green));
/*
* 통일성 있는 UI 디자인을 원한다면 ThemeData 를 활용하면 된다.
*
* 이렇게 전역적으로 기본 테마를 꾸며 놓고, 필요한 부분은
* 부분마다 커스텀 하는 식으로 개발하면 생산성에 좋다..
*
* */