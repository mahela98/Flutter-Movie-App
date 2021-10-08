import 'dart:ffi';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_movie_app/components/movie_card.dart';
import 'package:flutter_movie_app/models/movie_data.dart';
import 'package:flutter_movie_app/services/api_manager.dart';
import 'package:flutter_movie_app/urls/urls.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import '../pages/movie_details_page.dart';
import 'dart:convert';
import 'package:sizer/sizer.dart';

import 'package:http/http.dart' as http;

class Trending extends StatefulWidget {
  final movieUrl;
  Trending(this.movieUrl);
  @override
  _TrendingState createState() => _TrendingState();
}

class _TrendingState extends State<Trending> {
  int currentPage = 1;
  late int totalPages;
  List<Result> moviesList = [];

  final RefreshController refreshController =
      RefreshController(initialRefresh: true);

  @override
  void initState() {
    super.initState();
  }

  Future<bool> getMovieData({bool isRefresh = false}) async {
    if (isRefresh) {
      currentPage = 1;
    } else {
      if (currentPage >= totalPages) {
        refreshController.loadNoData();
        return false;
      }
    }
    var client = http.Client();
    var url = Uri.parse(widget.movieUrl + "&page=$currentPage");
    print(url);
    final response = await client.get(url);
    if (response.statusCode == 200) {
      final result = movieFromJson(response.body);
      if (isRefresh) {
        moviesList = result.results;
      } else {
        moviesList.addAll(result.results);
      }

      currentPage++;
      totalPages = result.totalPages;
      setState(() {});
      return true;
    } else {
      return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return SmartRefresher(
      enablePullUp: true,
      controller: refreshController,
      onRefresh: () async {
        final result = await getMovieData(isRefresh: true);
        if (result) {
          refreshController.refreshCompleted();
        } else {
          refreshController.refreshFailed();
        }
      },
      onLoading: () async {
        final result = await getMovieData();
        if (result) {
          refreshController.loadComplete();
        } else {
          refreshController.loadFailed();
        }
      },
      child: GridView.builder(
        // padding: EdgeInsets.fromLTRB(0, 20.h, 0, 0),
        physics: const AlwaysScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: moviesList.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          childAspectRatio: 5.5 / 9,
          crossAxisCount: 2,
        ),
        // scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          var movie = moviesList[index];
          return Padding(
            padding: const EdgeInsets.all(0),
            child: TextButton(
              child: MovieCard(movie),
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return MovieDetailsPage(movie);
                }));
              },
            ),
          );
        },
      ),
    );
  }
}
