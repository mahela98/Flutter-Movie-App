import 'package:sizer/sizer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_movie_app/components/relesed_date.dart';

@immutable
class MovieCard extends StatelessWidget {
  final movie;

  Color mainColor = const Color(0xff3C3261);
  var image_url = 'https://image.tmdb.org/t/p/w500/';
  MovieCard(this.movie);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.zero,
      color: Colors.amberAccent[700],

      // clipBehavior: Clip.antiAlias,
      child: Image.network(image_url + movie.posterPath),
    );
  }
}
