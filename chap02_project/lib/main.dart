import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context){
    return MaterialApp(
      title: '실습 앱',
      theme: ThemeData(
      ),
      home: MyHomePage(title: '실습 앱'),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title, style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),),
            actions: [
          IconButton(
          onPressed: (){},
          icon: Icon(Icons.search,
          color: Colors.black)),
          IconButton(
          onPressed: (){},
          icon: Icon(Icons.chat,
          color: Colors.black)),
          IconButton(
          onPressed: (){},
          icon: Icon(Icons.settings,
          color: Colors.black)),
          ]
      ),

      body: Column(
        children: [
          Container( // 여기에 margin 추가
            child: Row(
          children: [
            Flexible(child: Container(
                    child: Image.asset("assets/test.jpg", height: 200, width: 150,)),flex: 1,),
            SizedBox(width: 10),
            Flexible(
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start, //글자 첫글자에 맞추기
    children:[
    Text("설윤"),
    Text("아이돌"),
    Text("서울시 강남구"),
    Row(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [IconButton(onPressed: (){}, icon: Icon(Icons.favorite,
    color: Colors.black)),
        Text("4"),]
    )],
    ))

    ],
      ),
          ),
    Container(child: Row(
    children: [
    Flexible(child: Container(
    child:Image.asset("assets/test2.jpeg", width: 120,)),flex: 1,),
      SizedBox(width: 10),
    Flexible(
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
    children: [
    Text("설윤"),
    Text("아이돌"),
    Text("서울시 강남구"),
        Row(crossAxisAlignment: CrossAxisAlignment.start,
              children: [IconButton(onPressed: (){}, icon: Icon(Icons.favorite,
                  color: Colors.black)),
                SizedBox(width: 1),
                Text("4"),]
          )
    ],
    ))
        ],),
    ),
    ], ),

      bottomNavigationBar: BottomAppBar(
        color: Colors.grey,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(onPressed: (){}, icon: Icon(Icons.home), color: Colors.white,),
            IconButton(onPressed: (){}, icon: Icon(Icons.search), color: Colors.white,),
            IconButton(onPressed: (){}, icon: Icon(Icons.notifications), color: Colors.white,),
            IconButton(onPressed: (){}, icon: Icon(Icons.account_circle), color: Colors.white,),
          ],
          ),
      ),
      );
  }
}
