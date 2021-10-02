import 'dart:ffi';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_movie_app/components/movie_card.dart';
import 'package:flutter_movie_app/models/movie_data.dart';
import 'package:flutter_movie_app/services/api_manager.dart';
import 'package:flutter_movie_app/urls/urls.dart';
import '../pages/movie_details_page.dart';

class Trending extends StatefulWidget {
  final movieUrl;
  Trending(this.movieUrl);
  @override
  _TrendingState createState() => _TrendingState();
}

class _TrendingState extends State<Trending> {
  late Future<Movie?> _trendingMovieModel;

  void initState() {
    _trendingMovieModel = ApiManager().getMovieData(widget.movieUrl);
    super.initState();
  }

  Future<Movie?> reloadData() {
    return Future.delayed(const Duration(seconds: 2), () {
      _trendingMovieModel = ApiManager().getMovieData(widget.movieUrl);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Expanded(
          child: FutureBuilder<Movie?>(
              future: _trendingMovieModel,
              builder: (context, AsyncSnapshot snapshot) {
                if (snapshot.data != null) {
                  return RefreshIndicator(
                    onRefresh: reloadData,
                    child: GridView.builder(
                      physics: const AlwaysScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: snapshot.data!.results.length,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        childAspectRatio: 5.5 / 10.0,
                        crossAxisCount: 2,
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
                    ),
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
