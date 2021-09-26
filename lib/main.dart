import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_movie_app/components/navigation_drawer.dart';
import 'package:sizer/sizer.dart';
import 'pages/trending_movies.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
    systemNavigationBarColor: Colors.transparent,
  ));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Sizer(builder: (context, orientation, deviceType) {
      return MaterialApp(
        title: 'Movie App',
        theme: ThemeData(
            primarySwatch: Colors.blueGrey,
            scaffoldBackgroundColor: Colors.blueGrey[900]),
        home: DefaultTabController(
          length: 5,
          child: Scaffold(
            drawerEnableOpenDragGesture: false,
            drawer: NavigationDrawer(),
            extendBodyBehindAppBar: true,
            appBar: AppBar(
              leading: Builder(builder: (context) {
                return IconButton(
                    onPressed: () {
                      Scaffold.of(context).openDrawer();
                    },
                    icon: Icon(Icons.menu));
              }),
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
        ),
      );
    });
  }
}
