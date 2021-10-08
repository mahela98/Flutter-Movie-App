import 'package:flutter/material.dart';
import 'package:flutter_movie_app/components/tvshow_card.dart';
import 'package:flutter_movie_app/models/tv_show.dart';
import 'package:flutter_movie_app/pages/tvshow_details_page.dart';
import 'dart:ffi';
import 'package:sizer/sizer.dart';

import 'package:flutter/gestures.dart';
import 'package:flutter_movie_app/components/movie_card.dart';
import 'package:flutter_movie_app/models/movie_data.dart';
import 'package:flutter_movie_app/services/api_manager.dart';
import 'package:flutter_movie_app/urls/urls.dart';
import '../../pages/movie_details_page.dart';

class HomeTab extends StatefulWidget {
  const HomeTab({Key? key}) : super(key: key);

  @override
  _HomeTabState createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {
  late Future<Movie?> _trendingMovieModel;
  late Future<Movie?> _upCommingMovieModel;
  late Future<TvShowsData?> _tvShowModel;

  void initState() {
    _trendingMovieModel =
        ApiManager().getMovieData(MovieDB.moviedb_trending_movie_url);
    _upCommingMovieModel =
        ApiManager().getMovieData(MovieDB.moviedb_upcomming_movie_url);
    _tvShowModel =
        ApiManager().getTvShowData(MovieDB.moviedb_popular_tvshows_url);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Container(
            margin: EdgeInsets.fromLTRB(0, 0.h, 0, 1.h),
            padding: EdgeInsets.fromLTRB(0, 1.2.h, 0, 1.2.h),
            // color: Colors.black,
            decoration: const BoxDecoration(
                backgroundBlendMode: BlendMode.darken,
                gradient: LinearGradient(
                  tileMode: TileMode.clamp,
                  begin: Alignment.topRight,
                  end: Alignment.bottomLeft,
                  stops: [
                    0.01,
                    0.9,
                  ],
                  colors: [
                    Colors.teal,
                    Colors.black,
                  ],
                )),
            child: Padding(
              padding: EdgeInsets.fromLTRB(2.w, 0, 0, 0),
              child: Text(
                "Top Movies",
                textAlign: TextAlign.left,
                style: TextStyle(fontSize: 14.sp, letterSpacing: 1.5),
              ),
            )),
        Container(
          height: 42.h,
          child: FutureBuilder<Movie?>(
              future: _trendingMovieModel,
              builder: (context, AsyncSnapshot snapshot) {
                if (snapshot.data != null) {
                  return GridView.builder(
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemCount: 10,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      childAspectRatio: 9 / 5.5,
                      crossAxisCount: 1,
                    ),
                    // scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      var movie = snapshot.data!.results[index];
                      return Padding(
                        padding: const EdgeInsets.all(0),
                        child: TextButton(
                          child: MovieCard(movie),
                          onPressed: () {
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) {
                              return MovieDetailsPage(movie);
                            }));
                          },
                        ),
                      );
                    },
                  );
                } else {
                  return const Center(child: CircularProgressIndicator());
                }
              }),
        ),
        // const Divider(),
        Container(
            margin: EdgeInsets.fromLTRB(0, 2.h, 0, 1.h),
            padding: EdgeInsets.fromLTRB(0, 1.2.h, 0, 1.2.h),
            // color: Colors.black,
            decoration: const BoxDecoration(
                backgroundBlendMode: BlendMode.colorBurn,
                gradient: LinearGradient(
                  tileMode: TileMode.clamp,
                  begin: Alignment.topRight,
                  end: Alignment.bottomLeft,
                  stops: [
                    0.01,
                    0.9,
                  ],
                  colors: [
                    // Colors.transparent,
                    Colors.teal,
                    Colors.black,
                  ],
                )),
            child: Padding(
              padding: EdgeInsets.fromLTRB(2.w, 0, 0, 0),
              child: Text(
                "Top Tv Shows",
                textAlign: TextAlign.left,
                style: TextStyle(fontSize: 14.sp, letterSpacing: 1.5),
              ),
            )),
        Container(
          height: 42.h, // flex: 7,
          child: FutureBuilder<TvShowsData?>(
              future: _tvShowModel,
              builder: (context, AsyncSnapshot snapshot) {
                if (snapshot.data != null) {
                  return GridView.builder(
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemCount: 10,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      childAspectRatio: 9 / 5.5,
                      crossAxisCount: 1,
                    ),
                    // scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      var tvShow = snapshot.data!.results[index];
                      return Padding(
                        padding: const EdgeInsets.all(0),
                        child: TextButton(
                          child: TvShowCard(tvShow),
                          onPressed: () {
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) {
                              return TvShowDetailsPage(tvShow);
                            }));
                          },
                        ),
                      );
                    },
                  );
                } else {
                  return const Center(child: CircularProgressIndicator());
                }
              }),
        ),
        Container(
            margin: EdgeInsets.fromLTRB(0, 2.h, 0, 1.h),
            padding: EdgeInsets.fromLTRB(0, 1.2.h, 0, 1.2.h),
            // color: Colors.black,
            decoration: const BoxDecoration(
                backgroundBlendMode: BlendMode.colorBurn,
                gradient: LinearGradient(
                  tileMode: TileMode.clamp,
                  begin: Alignment.topRight,
                  end: Alignment.bottomLeft,
                  stops: [
                    0.01,
                    0.9,
                  ],
                  colors: [
                    // Colors.transparent,
                    Colors.teal,
                    Colors.black,
                  ],
                )),
            child: Padding(
              padding: EdgeInsets.fromLTRB(2.w, 0, 0, 0),
              child: Text(
                "Upcomming Movies",
                textAlign: TextAlign.left,
                style: TextStyle(fontSize: 14.sp, letterSpacing: 1.5),
              ),
            )),
        Container(
          height: 42.h,
          child: FutureBuilder<Movie?>(
              future: _upCommingMovieModel,
              builder: (context, AsyncSnapshot snapshot) {
                if (snapshot.data != null) {
                  return GridView.builder(
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemCount: 10,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      childAspectRatio: 9 / 5.5,
                      crossAxisCount: 1,
                    ),
                    // scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      var movie = snapshot.data!.results[index];
                      return Padding(
                        padding: const EdgeInsets.all(0),
                        child: TextButton(
                          child: MovieCard(movie),
                          onPressed: () {
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) {
                              return MovieDetailsPage(movie);
                            }));
                          },
                        ),
                      );
                    },
                  );
                } else {
                  return const Center(child: CircularProgressIndicator());
                }
              }),
        ),
      ],
    );
  }
}
