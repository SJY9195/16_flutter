import 'package:flutter/material.dart';

class MoviesListPage extends StatefulWidget {
  List<Map<String, String>> movies = [];

  MoviesListPage({
    required this.movies,
    super.key,
  });

  @override
  State<MoviesListPage> createState() => _MoviesListPage();
}

  class _MoviesListPage extends State<MoviesListPage> {

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: widget.movies.length,
      itemBuilder: (context, i) {
        return ListTile(
          title: Text("제목: ${widget.movies[i]['title']}"),
          subtitle: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("감독: ${widget.movies[i]['director']}"),
              Text("내용: ${widget.movies[i]['content']}"),
            ],
          ),
          trailing: IconButton(
            icon: Icon(Icons.delete, color: Colors.red,),
            onPressed: (){
              setState(() {
                widget.movies.removeAt(i);
              });
            },
          ),
        );
      },
    );
  }
}