import 'package:flutter/material.dart';
import 'package:flutter_movie_app/models/youtube_video_details.dart';
import 'package:flutter_movie_app/services/api_manager.dart';
import 'package:flutter_movie_app/urls/urls.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import 'package:intl/intl.dart';
import 'package:sizer/sizer.dart';

class YoutubeVideo extends StatefulWidget {
  final movieName;
  YoutubeVideo(this.movieName);

  @override
  _YoutubeVideoState createState() => _YoutubeVideoState();
}

class _YoutubeVideoState extends State<YoutubeVideo> {
  late Future<YoutubeVideoDetails?> _youtubeVideoDateModel;

  @override
  void initState() {
    _youtubeVideoDateModel = ApiManager().getVideoData(widget.movieName);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 30.h,
      child: FutureBuilder<YoutubeVideoDetails?>(
        future: _youtubeVideoDateModel,
        builder: (context, snapshot) {
          if (snapshot.data != null) {
            return ListView.builder(
              itemCount: snapshot.data!.items.length,
              itemBuilder: (context, index) {
                var item = snapshot.data!.items[index];
                return Container(
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                    child: YoutubePlayer(
                      controller: YoutubePlayerController(
                        initialVideoId: item.id.videoId,
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
                  ),
                );
              },
            );
          } else {
            return Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}
