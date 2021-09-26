import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_movie_app/components/navigation_drawer.dart';
import 'package:sizer/sizer.dart';
import 'trending_movies.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 5,
      child: Scaffold(
        drawerEnableOpenDragGesture: false,
        endDrawer: NavigationDrawer(),
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
                child: Text("Popular Movies"),
              ),
              Padding(
                padding: EdgeInsets.all(8.0),
                child: Text("Upcoming Movies"),
              ),
              Padding(
                padding: EdgeInsets.all(8.0),
                child: Text("Tv"),
              ),
            ],
          ),
        ),
        body: const TabBarView(children: [
          Trending(),
          Trending(),
          Trending(),
          Trending(),
          Trending(),
        ]),
      ),
    );
  }
}
