import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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
          length: 2,
          child: Scaffold(
            extendBodyBehindAppBar: true,
            appBar: AppBar(
              backgroundColor: Colors.transparent,
              shadowColor: Colors.black,
              elevation: 1,
              title: const Center(
                child: Text('Movie App'),
              ),
              automaticallyImplyLeading: false,
              bottom: TabBar(
                isScrollable: true,
                tabs: [
                  Text("Trending"),
                  Tab(icon: Icon(Icons.directions_transit)),
                ],
              ),
            ),
            body: TabBarView(children: [
              Trending(),
              Trending(),
            ]),
          ),
        ),
      );
    });
  }
}
