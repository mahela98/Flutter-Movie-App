import 'package:flutter/material.dart';
import 'package:flutter_movie_app/components/tvshow_card.dart';
import 'package:flutter_movie_app/models/tv_show.dart';
import 'package:flutter_movie_app/pages/tvshow_details_page.dart';
import 'package:flutter_movie_app/services/api_manager.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:http/http.dart' as http;

class TvShows extends StatefulWidget {
  final tvshowUrl;
  TvShows(this.tvshowUrl);
  @override
  _TvShowsState createState() => _TvShowsState();
}

class _TvShowsState extends State<TvShows> {
  int currentPage = 1;
  late int totalPages;
  List<Result> tvShowList = [];

  final RefreshController refreshController =
      RefreshController(initialRefresh: true);

  void initState() {
    super.initState();
  }

  Future<bool> getTvShowsData({bool isRefresh = false}) async {
    if (isRefresh) {
      currentPage = 1;
    } else {
      if (currentPage >= totalPages) {
        refreshController.loadNoData();
        return false;
      }
    }
    var client = http.Client();
    var url = Uri.parse(widget.tvshowUrl + "&page=$currentPage");
    print(url);
    final response = await client.get(url);
    if (response.statusCode == 200) {
      final result = tvShowsDataFromJson(response.body);
      if (isRefresh) {
        tvShowList = result.results;
      } else {
        tvShowList.addAll(result.results);
      }

      currentPage++;
      totalPages = result.totalPages;
      print(totalPages);
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
        final result = await getTvShowsData(isRefresh: true);
        if (result) {
          refreshController.refreshCompleted();
        } else {
          refreshController.refreshFailed();
        }
      },
      onLoading: () async {
        final result = await getTvShowsData();
        if (result) {
          refreshController.loadComplete();
        } else {
          refreshController.loadFailed();
        }
      },
      child: GridView.builder(
        shrinkWrap: true,
        itemCount: tvShowList.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          childAspectRatio: 5.5 / 9,
          crossAxisCount: 2,
        ),
        // scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          var tvShow = tvShowList[index];
          return Padding(
            padding: const EdgeInsets.all(0),
            child: TextButton(
              child: TvShowCard(tvShow),
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return TvShowDetailsPage(tvShow);
                }));
              },
            ),
          );
        },
      ),
    );
  }
}
