import 'package:flutter/material.dart';

class DialogTest6 extends StatefulWidget {
  const DialogTest6({super.key});

  @override
  State<DialogTest6> createState() => _DialogTest6State();
}

class _DialogTest6State extends State<DialogTest6> {

  var titleData = TextEditingController();
  var contentData = TextEditingController();

  List<String> titles = [];
  List<String> contents = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // title: Center(
        //   child: Text("ToDo 리스트"),
        // ),
      ),
      body: ListView.builder(
          itemCount: titles.length,
          itemBuilder: (context, i){
            return ListTile(
              leading: Text((i+1).toString()),
              title: Text(titles[i]),
              onTap: () {
                _showDetails(context, i);
                // showDialog(context: context, builder: builder) 로 만들어서 해도 된다.
              },
              trailing: ElevatedButton(
                  onPressed: (){
                    setState(() {
                      titles.removeAt(i);
                      contents.removeAt(i);
                    });
            },
                  child: Text("삭제"),
            ),
            );
          },
      ),
      bottomNavigationBar: BottomAppBar(
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // if(title != null && content != null)
                    //   Text(title, style: TextStyle(fontSize: 25),
                    //   ),
                    // Text(content, style: TextStyle(fontSize: 25),
                    // ),
                    SizedBox(
                      height: 20,
                    ),
                    ElevatedButton(child: Text("등록", style: TextStyle(fontSize: 20),),
                        onPressed: (){
                          showDialog(
                              context: context, builder: (context){
                            return AlertDialog(
                              title: Text("일정 등록"),
                              content: Column(
                                mainAxisSize: MainAxisSize.min, //max는 기본값, min은 부모 크기에 맞춰준다!
                                children: [
                                  TextField(
                                    controller: titleData,
                                    decoration: InputDecoration(hintText: "제목을 입력하세요"),
                                  ),
                                  TextField(
                                    controller: contentData,
                                    decoration: InputDecoration(hintText: "상세 내용을 입력하세요"),
                                  ),
                                ],
                              ),
                              actions: [
                                TextButton(
                                    onPressed: (){
                                      Navigator.pop(context);
                                    },
                                    child: Text("취소")),
                                TextButton(
                                    onPressed: (){
                                      setState(() {
                                        titles.add(titleData.text);
                                        contents.add(contentData.text);
                                      });
                                      Navigator.pop(context);
                                    },
                                    child: Text("완료")),
                              ],
                            );
                          });
                        }),
                  ]
              ),
          ),
        );
  }

  void _showDetails(BuildContext context, int index){
    showDialog(
        context: context,
        builder: (context){
          return AlertDialog(
            title: Text(titles[index]),
            content: Text(contents[index]),
            actions: [
              TextButton(
                onPressed: (){
                  Navigator.pop(context);
                },
                child: Text("닫기"),
              ),
            ],
          );
        }
    );
  }

}



