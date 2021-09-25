import 'package:flutter/material.dart';
import 'package:flutter_movie_app/urls/urls.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import 'package:intl/intl.dart';

class YoutubeVideo extends StatefulWidget {
  final movieName;
  YoutubeVideo(this.movieName);

  @override
  _YoutubeVideoState createState() => _YoutubeVideoState();
}

class _YoutubeVideoState extends State<YoutubeVideo> {
  @override
  Widget build(BuildContext context) {
    String key = MovieDB.youtube_API_key;

    return Container(
      child: Padding(
        padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
        child: Column(
          children: [
            YoutubePlayer(
              controller: YoutubePlayerController(
                initialVideoId: 'Fp9pNPdNwjI',
                flags: const YoutubePlayerFlags(
                  autoPlay: false,
                  mute: false,
                  isLive: false,
                  forceHD: false,
                  loop: false,
                  disableDragSeek: false,
                ),
              ),
              liveUIColor: Colors.amber,
            ),
            Text(widget.movieName,
                style: TextStyle(
                  color: Colors.red,
                ))
          ],
        ),
      ),
    );
  }
}
