import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
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
  var resentMovies = MovieDB.moviedb_trending_movie_url;

  void initState() {
    _trendingMovieModel = ApiManager().getMovieData(resentMovies);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Container(
            margin: EdgeInsets.fromLTRB(0, 2.h, 0, 1.h),
            padding: EdgeInsets.fromLTRB(0, 1.2.h, 0, 1.2.h),
            // color: Colors.black,
            decoration: const BoxDecoration(
                backgroundBlendMode: BlendMode.darken,
                gradient: LinearGradient(
                  tileMode: TileMode.clamp,
                  begin: Alignment.topRight,
                  end: Alignment.bottomLeft,
                  colors: [
                    Colors.indigo,
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
                    itemCount: 5,
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
                  stops: [0.01, 0.2, 0.6],
                  colors: [
                    Colors.transparent,
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
          child: FutureBuilder<Movie?>(
              future: _trendingMovieModel,
              builder: (context, AsyncSnapshot snapshot) {
                if (snapshot.data != null) {
                  return GridView.builder(
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemCount: 5,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      childAspectRatio: 10 / 6,
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
        )
      ],
    );
  }
}
