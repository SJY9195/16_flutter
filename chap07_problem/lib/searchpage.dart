import 'package:flutter/material.dart';

class SearchPage extends StatefulWidget {
  final List<Map<String, String>> movies;

  const SearchPage({
    required this.movies,
    super.key
  });

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final TextEditingController searchController = TextEditingController();
  List<Map<String, String>> searchResults = [];

  void _searchMovies() {
    final query = searchController.text.toLowerCase();
    setState(() {
      searchResults = widget.movies.where((movie) {
        return movie['title']!.toLowerCase().contains(query) ||
               movie['director']!.toLowerCase().contains(query) ||
               movie['content']!.toLowerCase().contains(query);
      }).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: TextField(
            controller: searchController,
            decoration: InputDecoration(
              labelText: "영화 검색",
              suffixIcon: IconButton(
                icon: Icon(Icons.search),
                onPressed: _searchMovies,
    ),
    // border: OutlineInputBorder(),
    ),
    onSubmitted: (value) => _searchMovies(),
    ),
              ),
    ElevatedButton(
    onPressed: _searchMovies,
    child: Text("검색"),
            ),
    Expanded(
    child: searchResults.isEmpty
    ? Center(child: Text("검색 결과가 없습니다."))
    : ListView.builder(
    itemCount: searchResults.length,
    itemBuilder: (context, i){
      return ListTile(
      title: Text(searchResults[i]['title']!),
    subtitle: Text("감독: ${searchResults[i]['director']}"),
    onTap: (){
        Navigator.push(
        context,
        MaterialPageRoute(
        builder: (context) =>
    MovieDetailPage(movie: searchResults[i]),
        ),
        );
    },
      );
    },
    ),
          ),
      ],
    );
  }
}

class MovieDetailPage extends StatelessWidget {
  final Map<String, String> movie;

  const MovieDetailPage({
    required this.movie,
    super.key
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(movie['title']!),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("감독: ${movie['director']}", style: TextStyle(fontSize: 18)),
            SizedBox(height: 10),
            Text("줄거리 요약: ${movie['content']}", style: TextStyle(fontSize: 16)),
          ],
        ),
      ),
    );
  }
}

