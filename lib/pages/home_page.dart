import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_movie_app/components/home_tab/home_tab.dart';
import 'package:flutter_movie_app/components/navigation_drawer.dart';
import 'package:flutter_movie_app/components/tab_tv_shows.dart';
import 'package:flutter_movie_app/models/movie_data.dart';
import 'package:flutter_movie_app/pages/search_page.dart';
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
            title: const Text('Search'),
            content: SingleChildScrollView(
              child: Column(
                children: [
                  TextField(
                    textInputAction: TextInputAction.search,
                    autofocus: true,
                    onChanged: (value) {
                      valueText = value;
                    },
                    onSubmitted: (value) {
                      valueText = value;
                      value = '';
                      _textFieldController.clear();
                      if (valueText == '') {
                        print('empty');
                      } else if (valueText.replaceAll(' ', '') == '') {
                        print('empty');
                      } else {
                        Navigator.pop(context);
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return Search(valueText);
                        }));
                      }
                    },
                    controller: _textFieldController,
                    decoration: InputDecoration(hintText: "Movie Name"),
                  ),
                ],
              ),
            ),
            actions: <Widget>[
              // FlatButton(
              //   color: Colors.red,
              //   textColor: Colors.white,
              //   child: Text('CANCEL'),
              //   onPressed: () {
              //     setState(() {
              //       Navigator.pop(context);
              //     });
              //   },
              // ),
              TextButton(
                child: Text('Search'),
                onPressed: () {
                  print(valueText);
                  _textFieldController.clear();
                  if (valueText == '') {
                    print('empty');
                  } else if (valueText.replaceAll(' ', '') == '') {
                    print('empty');
                  } else {
                    Navigator.pop(context);
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return Search(valueText);
                    }));
                  }
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
              onPressed: () {
                _displayTextInputDialog(context);
              },
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
          Trending(MovieDB.moviedb_trending_movie_url),
          // HomeTab(),
          Trending(MovieDB.moviedb_trending_movie_url),
          Trending(MovieDB.moviedb_top_rated_movie_url),
          Trending(MovieDB.moviedb_upcomming_movie_url),
          TvShows(MovieDB.moviedb_popular_tvshows_url),
          TvShows(MovieDB.moviedb_top_rated_tvshows_url),
        ]),
        floatingActionButton: FloatingActionButton(
          elevation: 5,
          onPressed: () {
            _displayTextInputDialog(context);
          },
          child: const Icon(
            Icons.search,
            color: Colors.white,
          ),
          backgroundColor: const Color(0xff03dac6),
          foregroundColor: Colors.black,
        ),
      ),
    );
  }
}
