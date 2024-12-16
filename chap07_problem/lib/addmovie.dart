import 'package:flutter/material.dart';

class AddMoviePage extends StatelessWidget {
  final Function(Map<String, String>) onMovieAdded;
    AddMoviePage({
    required this.onMovieAdded,
    super.key
    });

  var titleData = TextEditingController();
  var directorData = TextEditingController();
  var contentData = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child:
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextField(
            controller: titleData,
            decoration: InputDecoration(labelText: "영화 제목"),
          ),
          SizedBox(height: 10),
          TextField(
            controller: directorData,
            decoration: InputDecoration(labelText: "감독"),
          ),
          SizedBox(height: 10),
          TextField(
            controller: contentData,
            decoration: InputDecoration(labelText: "내용"),
          ),
          SizedBox(height: 20),
          Center(
            child: ElevatedButton(
              onPressed: () {
                if (titleData.text.isNotEmpty &&
                directorData.text.isNotEmpty &&
                contentData.text.isNotEmpty){
                  onMovieAdded({
                    'title' : titleData.text,
                    'director' : directorData.text,
                    'content' : contentData.text,
                  });
                  titleData.clear();
                  directorData.clear();
                  contentData.clear();
                }
              },
              child: Text("영화 등록", style: TextStyle(fontSize: 18)),
            ),
          ),
        ],
      ),
    );
  }
}
