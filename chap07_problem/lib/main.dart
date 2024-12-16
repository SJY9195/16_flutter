/*
* BottomNavigationBar
* - 하단 네비게이션 바를 구현하는데 사용된다.
* 유저가 탭을 클릭하면 onTap 이 실행되고
* 선택된 인덱스가 변경된다.
* 선택된 인덱스에 따라서 다른 위젯을 표시할 수 있다.
*
* */

import 'package:chap07_problem/addmovie.dart';
import 'package:chap07_problem/movieslist.dart';
import 'package:chap07_problem/searchpage.dart';
import 'package:flutter/material.dart';

List<Map<String, String>> movies = [];

void main(){
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyPage(),
    );
  }
}

class MyPage extends StatefulWidget {
  const MyPage({super.key});

  @override
  State<MyPage> createState() => _MyPageState();
}

class _MyPageState extends State<MyPage> {
  List<Map<String, String>> movies = [];
  // 현재 선택된 인덱스를 추적하는 변수
  int _selectedIndex = 0;

  void _addMovie(Map<String, String> movie){
    setState(() {
      movies.add(movie);
      _selectedIndex = 0;
    });
  }

  // 선택된 페이지를 반환하는 함수
  Widget _getPage(){
    switch (_selectedIndex){
      case 0:
        return MoviesListPage(movies: movies);
      case 1:
        return AddMoviePage(onMovieAdded: _addMovie);
      case 2:
        return SearchPage(movies: movies);
      default:
        return Center(child: Text("등록된 영화가 없습니다."),
        );
    }
  }

  // 선택된 인덱스를 변경하는 함수
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("영화 관리 앱"),
      ),
      body: _getPage(),
      bottomNavigationBar: BottomNavigationBar(
        showUnselectedLabels: true, // 선택되지 않은 라벨 숨김
        currentIndex: _selectedIndex,
        onTap: _onItemTapped, // 탭 시에 인덱스 변경
        items: [
          BottomNavigationBarItem(
            label: "영화 목록",
            icon: Icon(Icons.list_outlined),
            activeIcon: Icon(Icons.list),
          ),
          BottomNavigationBarItem(
            label: "영화 등록",
            icon: Icon(Icons.add_outlined),
            activeIcon: Icon(Icons.add),
          ),
          BottomNavigationBarItem(
            label: "영화 검색",
            icon: Icon(Icons.search_outlined),
            activeIcon: Icon(Icons.search),
          ),
        ],
      ),
    );
  }
}

