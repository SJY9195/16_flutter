import 'package:flutter/material.dart';

class Question extends StatefulWidget {
  const Question({super.key});

  @override
  State<Question> createState() => _QuestionState();
}

class _QuestionState extends State<Question> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text("stateful Widget"),
        ),
      ),
      body: ListViewWidget(),
    );
  }
}


class ListViewWidget extends StatefulWidget {
  ListViewWidget({super.key});

  @override
  State<ListViewWidget> createState() => _ListViewWidgetState();
}

    class _ListViewWidgetState extends State<ListViewWidget>{

  final List<Map<String, dynamic>> items = [   // 그냥 List<int> counts [0,0,0,] 혹인 var count = [0,0,0] 로 초기화하고, 꺼내와도 된다.
  {"name" : "피자", "count" : 0},
  {"name" : "돈까스", "count" : 0},
  {"name" : "치킨", "count" : 0},
  ];

  @override
  Widget build(BuildContext context){
    return ListView.builder(
      itemCount: 3,
      itemBuilder: (context, i){
        return ListTile(
              leading: Text(items[i]["count"].toString()),
              title: Text(items[i]["name"]),
              trailing: ElevatedButton(
                onPressed: (){
                  setState(() {
                  });
                  items[i]["count"]++;
                },
                child: Text("좋아용"),
              ),);
      }
    );
  }
     }