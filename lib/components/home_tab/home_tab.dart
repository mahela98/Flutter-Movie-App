import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'dart:ffi';

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
    return SafeArea(
      child: Column(
        children: [
          Expanded(
            flex: 1,
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
          ),
          Expanded(flex: 1, child: Text("asd")),
        ],
      ),
    );
  }
}
