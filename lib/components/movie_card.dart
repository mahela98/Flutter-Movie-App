import 'package:sizer/sizer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_movie_app/components/card_top.dart';

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
        borderRadius: const BorderRadius.all(Radius.circular(10)),
        image: DecorationImage(
            image: NetworkImage(image_url + movie.posterPath),
            fit: BoxFit.cover,
            repeat: ImageRepeat.noRepeat),
      ),
      height: 100.h,
      width: 100.w,
      // color: Colors.black,
      child: Column(
        children: [
          Flexible(
            child: CardTop(movie.releaseDate, movie.voteAverage),
            flex: 1,
            fit: FlexFit.tight,
          ),
          const Flexible(
            child: Text(''),
            flex: 10,
            fit: FlexFit.tight,
          ),
          Flexible(
            flex: 3,
            child: Container(
              padding: EdgeInsets.all(1.h),
              // color: Colors.black.withOpacity(0.7),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.black.withOpacity(0.7)),
              width: 100.w,
              height: 100.h,
              child: Text(
                movie.title,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 15.sp,
                  color: Colors.white,
                  height: 1,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
