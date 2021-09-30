import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_movie_app/components/movie_card.dart';
import 'package:flutter_movie_app/components/tvshow_card.dart';
import 'package:flutter_movie_app/models/movie_data.dart';
import 'package:flutter_movie_app/models/tv_show.dart';
import 'package:flutter_movie_app/pages/tvshow_details_page.dart';
import 'package:flutter_movie_app/services/api_manager.dart';
import 'package:flutter_movie_app/urls/urls.dart';
import '../pages/movie_details_page.dart';

class TvShows extends StatefulWidget {
  final tvshowUrl;
  TvShows(this.tvshowUrl);
  @override
  _TvShowsState createState() => _TvShowsState();
}

class _TvShowsState extends State<TvShows> {
  late Future<TvShowsData?> _tvShowModel;

  void initState() {
    _tvShowModel = ApiManager().getTvShowData(widget.tvshowUrl);
    super.initState();
  }

  Future<TvShowsData?> reloadData() {
    return Future.delayed(const Duration(seconds: 1), () {
      _tvShowModel = ApiManager().getTvShowData(widget.tvshowUrl);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Expanded(
          child: FutureBuilder<TvShowsData?>(
              future: _tvShowModel,
              builder: (context, AsyncSnapshot snapshot) {
                if (snapshot.data != null) {
                  return RefreshIndicator(
                    onRefresh: reloadData,
                    child: GridView.builder(
                      shrinkWrap: true,
                      itemCount: snapshot.data!.results.length,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        childAspectRatio: 5.5 / 10.0,
                        crossAxisCount: 2,
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
