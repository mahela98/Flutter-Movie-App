import 'package:flutter/material.dart';
import 'package:flutter_movie_app/components/tab_movies.dart';
import 'package:flutter_movie_app/urls/urls.dart';

class Search extends StatefulWidget {
  final query;
  Search(this.query);

  @override
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<Search> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        // leading: IconButton(onPressed: () {}, icon: Icon(Icons.arrow_back)),
        backgroundColor: Colors.black.withOpacity(0.6),
        shadowColor: Colors.black,
        elevation: 1,
        title: Text(widget.query),
      ),
      body: Trending(MovieDB.searchMovieDB(widget.query ?? 'iron')),
    );
  }
}
