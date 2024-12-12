import 'package:flutter/material.dart';

class ListApp3 extends StatelessWidget {
  const ListApp3({super.key});

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text("리스트 테스트"),
        ),
        ),

      body: ListViewWidget(),

      floatingActionButton: FloatingActionButton(
          onPressed: (){},
        child: Icon(
          Icons.question_answer,
          color: Colors.white,
        ),
        backgroundColor: Colors.black,
      ),
      bottomNavigationBar: BottomAppBar(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Icon(Icons.home),
            Icon(Icons.search),
            Icon(Icons.details),
            Icon(Icons.settings)
          ],
        )
      )
    );
  }
}

/*
* ListView.builder() 위젯 안에 2가지 속성을 지정해주면 된다.
* itemCount : 리스트 갯수
* itemBuilder : (){return 반복할 위젯}
* i 라는 변수는 자동 생성
* */

class ListViewWidget extends StatelessWidget{
  const ListViewWidget({super.key});

  @override
  Widget build(BuildContext context){
    return ListView.builder(
      itemCount: 5,
      itemBuilder: (context, i){
        print(i);
        return ListTile(
          leading: Image.asset("assets/test2.jpeg"),
          title: Text("설윤"),
          subtitle: Text("엔믹스"),
          trailing: Text("예쁘다"),
          onTap: () {},
        );
      }
    );
  }
}