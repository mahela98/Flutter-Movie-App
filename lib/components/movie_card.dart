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
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
            image: NetworkImage(image_url + movie.posterPath),
            fit: BoxFit.cover),
      ),
      height: 100.h,
      width: 100.w,
      // color: Colors.amber,
      child: Column(
        children: [
          Flexible(
            child: Text("asd"),
            flex: 5,
            fit: FlexFit.tight,
          ),
          Flexible(
            child: Text("asd"),
            flex: 1,
          ),
        ],
      ),
    );
  }
}
