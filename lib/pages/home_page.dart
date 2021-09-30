import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_movie_app/components/navigation_drawer.dart';
import 'package:flutter_movie_app/components/tab_tv_shows.dart';
import 'package:flutter_movie_app/models/movie_data.dart';
import 'package:flutter_movie_app/urls/urls.dart';
import 'package:sizer/sizer.dart';
import '../components/tab_movies.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 6,
      child: Scaffold(
        drawerEnableOpenDragGesture: false,
        endDrawer: Theme(
          child: NavigationDrawer(),
          data: Theme.of(context).copyWith(
            canvasColor: Colors.transparent,
          ),
        ),
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          // leading: Builder(builder: (context) {
          //   return IconButton(
          //       onPressed: () {
          //         Scaffold.of(context).openDrawer();
          //       },
          //       icon: Icon(Icons.menu));
          // }),
          leading: Icon(Icons.search_outlined),
          backgroundColor: Colors.transparent,
          shadowColor: Colors.black,
          elevation: 1,
          title: const Center(
            child: Text('Movie App'),
          ),
          automaticallyImplyLeading: false,
          bottom: const TabBar(
            isScrollable: true,
            tabs: [
              Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  "Home",
                ),
              ),
              Padding(
                padding: EdgeInsets.all(8.0),
                child: Text("Trending Movies"),
              ),
              Padding(
                padding: EdgeInsets.all(8.0),
                child: Text("Top Rated Movies"),
              ),
              Padding(
                padding: EdgeInsets.all(8.0),
                child: Text("Upcoming Movies"),
              ),
              Padding(
                padding: EdgeInsets.all(8.0),
                child: Text("Popular Tv Shows"),
              ),
              Padding(
                padding: EdgeInsets.all(8.0),
                child: Text("Top Tv Shows"),
              ),
            ],
          ),
        ),
        body: TabBarView(children: [
          Trending(MovieDB.moviedb_trending_movie_url),
          Trending(MovieDB.moviedb_trending_movie_url),
          Trending(MovieDB.moviedb_top_rated_movie_url),
          Trending(MovieDB.moviedb_upcomming_movie_url),
          TvShows(MovieDB.moviedb_popular_tvshows_url),
          TvShows(MovieDB.moviedb_top_rated_tvshows_url),
        ]),
      ),
    );
  }
}
