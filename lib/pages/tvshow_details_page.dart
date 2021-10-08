import 'package:flutter/material.dart';
import 'package:flutter_movie_app/components/youtube_video/youtube_video.dart';
import 'package:flutter_movie_app/components/youtube_video/youtube_video_to_details_page.dart';
import 'package:sizer/sizer.dart';
import 'package:intl/intl.dart';

class TvShowDetailsPage extends StatefulWidget {
  final tvshow;

  Color mainColor = Colors.black;
  var imageUrl = 'https://image.tmdb.org/t/p/w500/';
  var backgroundImageUrl = 'https://image.tmdb.org/t/p/original/';
  TvShowDetailsPage(this.tvshow);
  final DateFormat rFormat = DateFormat('yyyy-MM-dd');

  @override
  _TvShowDetailsPageState createState() => _TvShowDetailsPageState();
}

//  child: Text(widget.tvshow.title),
class _TvShowDetailsPageState extends State<TvShowDetailsPage> {
  @override
  Widget build(BuildContext context) {
    var titleForYoutube =
        widget.tvshow.name + widget.tvshow.firstAirDate + "tv series";

    return Scaffold(
      backgroundColor: Colors.black,
      body: CustomScrollView(
        scrollDirection: Axis.vertical,
        slivers: <Widget>[
          SliverAppBar(
            expandedHeight: 40.h,
            floating: true,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              title: Text(
                widget.tvshow.name,
                textAlign: TextAlign.start,
                style: TextStyle(),
              ),
              background: Container(
                decoration: BoxDecoration(
                  color: Colors.teal,
                  image: DecorationImage(
                      image: NetworkImage(
                        widget.backgroundImageUrl + widget.tvshow.backdropPath,
                      ),
                      fit: BoxFit.cover),
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Scrollbar(
              child: Padding(
                padding: EdgeInsets.all(1),
                child: Container(
                  child: Column(
                    children: [
                      SizedBox(
                        height: 1.h,
                      ),
                      Container(
                        padding: const EdgeInsets.all(18),
                        decoration: BoxDecoration(
                          border: Border.all(
                            width: 4.sp,
                            color: Colors.lightGreenAccent,
                          ),
                          borderRadius: BorderRadius.circular(100),
                        ),
                        child: Column(
                          children: [
                            Text(
                              widget.tvshow.voteAverage.toString(),
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                  fontSize: 30.sp,
                                  color: Colors.limeAccent[700],
                                  fontWeight: FontWeight.w500),
                            ),
                            Text(
                              "Rate",
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                fontSize: 14.sp,
                                color: Colors.limeAccent[700],
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 0.h,
                      ),
                      Container(
                        // color: Colors.white,
                        padding: const EdgeInsets.all(20.0),
                        child: Table(
                          border: TableBorder.all(color: Colors.black),
                          children: [
                            TableRow(children: [
                              Padding(
                                padding: EdgeInsets.fromLTRB(5.w, 0, 0, 0),
                                child: Text(
                                  'Title',
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                    fontSize: 14.sp,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                              Text(
                                widget.tvshow.name,
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.lightBlue[300],
                                ),
                              ),
                            ]),
                            TableRow(
                              children: [
                                Padding(
                                  padding: EdgeInsets.fromLTRB(5.w, 3.h, 0, 0),
                                  child: Text(
                                    'First Air Date',
                                    textAlign: TextAlign.left,
                                    style: TextStyle(
                                      fontSize: 13.sp,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.fromLTRB(0, 3.h, 0, 0),
                                  child: Text(
                                    widget.tvshow.firstAirDate,
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontSize: 13.sp,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.lightBlue[300],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            TableRow(
                              children: [
                                Padding(
                                  padding: EdgeInsets.fromLTRB(5.w, 3.h, 0, 0),
                                  child: Text(
                                    'Popularity',
                                    textAlign: TextAlign.left,
                                    style: TextStyle(
                                      fontSize: 13.sp,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.fromLTRB(0, 3.h, 0, 0),
                                  child: Text(
                                    widget.tvshow.popularity.toString(),
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontSize: 13.sp,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.lightBlue[300],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            TableRow(
                              children: [
                                Padding(
                                  padding: EdgeInsets.fromLTRB(5.w, 3.h, 0, 0),
                                  child: Text(
                                    'Vote Count',
                                    textAlign: TextAlign.left,
                                    style: TextStyle(
                                      fontSize: 13.sp,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.fromLTRB(0, 3.h, 0, 0),
                                  child: Text(
                                    widget.tvshow.voteCount.toString(),
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontSize: 13.sp,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.lightBlue[300],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 2.h,
                      ),
                      Padding(
                        padding: EdgeInsets.fromLTRB(10.sp, 0, 10.sp, 0),
                        child: Text(
                          widget.tvshow.overview,
                          textAlign: TextAlign.justify,
                          style: TextStyle(
                            fontSize: 13.sp,
                            fontWeight: FontWeight.normal,
                            color: Colors.blue[100],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 5.h,
                      ),
                      Container(
                        child: YoutubeVideoToDetailsPage(titleForYoutube),
                      ),
                      SizedBox(
                        height: 8.h,
                      ),
                      Container(
                        decoration: const BoxDecoration(boxShadow: [
                          BoxShadow(
                              blurRadius: 4,
                              color: Colors.grey,
                              offset: Offset(1, 1))
                        ]),
                        height: 50.h,
                        child: Image(
                          image: NetworkImage(
                            widget.imageUrl + widget.tvshow.posterPath,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 5.h,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
