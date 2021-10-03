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
  TextEditingController _textFieldController = TextEditingController();
  String codeDialog = '';
  String valueText = '';

  Future<void> _displayTextInputDialog(BuildContext context) async {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('Search'),
            content: TextField(
              textInputAction: TextInputAction.search,
              autofocus: true,
              onChanged: (value) {
                setState(() {
                  valueText = value;
                });
              },
              onSubmitted: (value) {
                setState(() {
                  valueText = value;
                });
                Navigator.pop(context);
              },
              controller: _textFieldController,
              decoration: InputDecoration(hintText: "Movie Name"),
            ),
            actions: <Widget>[
              FlatButton(
                color: Colors.red,
                textColor: Colors.white,
                child: Text('CANCEL'),
                onPressed: () {
                  setState(() {
                    Navigator.pop(context);
                  });
                },
              ),
              TextButton(
                // color: Colors.green,
                // textColor: Colors.white,
                child: Text('OK'),
                onPressed: () {
                  print(valueText);
                  setState(() {
                    codeDialog = valueText;
                    Navigator.pop(context);
                    Navigator.pushNamed(context, '/contact');
                  });
                },
              ),
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 6,
      child: Scaffold(
        drawerEnableOpenDragGesture: false,
        drawer: Theme(
          child: NavigationDrawer(),
          data: Theme.of(context).copyWith(
            canvasColor: Colors.transparent,
          ),
        ),
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          actions: [
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.search),
            )
          ],
          leading: Builder(builder: (context) {
            return IconButton(
                onPressed: () {
                  Scaffold.of(context).openDrawer();
                },
                icon: Icon(Icons.menu));
          }),
          // leading: Icon(Icons.search_outlined),
          backgroundColor: Colors.black.withOpacity(0.6),
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
          Trending(MovieDB.moviedb_search_movie_url),
          Trending(MovieDB.moviedb_trending_movie_url),
          Trending(MovieDB.moviedb_top_rated_movie_url),
          Trending(MovieDB.moviedb_upcomming_movie_url),
          TvShows(MovieDB.moviedb_popular_tvshows_url),
          TvShows(MovieDB.moviedb_top_rated_tvshows_url),
        ]),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            _displayTextInputDialog(context);
          },
          child: const Icon(Icons.search),
          backgroundColor: Colors.green,
        ),
      ),
    );
  }
}
