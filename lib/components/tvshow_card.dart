import 'package:sizer/sizer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_movie_app/components/card_top.dart';

@immutable
class TvShowCard extends StatelessWidget {
  final tvShow;

  Color mainColor = const Color(0xff3C3261);
  var image_url = 'https://image.tmdb.org/t/p/w500/';
  TvShowCard(this.tvShow);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(10)),
        image: DecorationImage(
            image: NetworkImage(image_url + tvShow.posterPath),
            fit: BoxFit.cover,
            repeat: ImageRepeat.noRepeat),
        boxShadow: [
          BoxShadow(
              color: Colors.black.withOpacity(0.7),
              blurRadius: 2.0,
              spreadRadius: 0.0,
              offset: const Offset(2.0, 2.0)),
        ],
      ),
      height: 100.h,
      width: 100.w,
      // color: Colors.black,
      child: Column(
        children: [
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
                tvShow.name,
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
