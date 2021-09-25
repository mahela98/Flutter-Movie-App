import 'package:flutter/material.dart';
import 'package:flutter_movie_app/components/youtube_video.dart';
import 'package:sizer/sizer.dart';

class YoutubeVideoToDetailsPage extends StatefulWidget {
  final movieName;
  YoutubeVideoToDetailsPage(this.movieName);
  @override
  _YoutubeVideoToDetailsPageState createState() =>
      _YoutubeVideoToDetailsPageState();
}

class _YoutubeVideoToDetailsPageState extends State<YoutubeVideoToDetailsPage> {
  @override
  Widget build(BuildContext context) {
    var isPortrait = MediaQuery.of(context).orientation;
    print(isPortrait);

    return Container(
      child: OrientationBuilder(builder: (context, orientation) {
        if (isPortrait == Orientation.portrait) {
          return Container(
            height: 35.h,
            child: YoutubeVideo(widget.movieName),
          );
        } else {
          return Container(
            height: 100.w,
            width: 80.h,
            child: YoutubeVideo(widget.movieName),
          );
        }
      }),
    );
  }
}
