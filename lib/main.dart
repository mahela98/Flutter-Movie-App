import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_movie_app/pages/about_page.dart';
import 'package:flutter_movie_app/pages/contact_page.dart';
import 'package:flutter_movie_app/pages/home_page.dart';
import 'package:flutter_movie_app/pages/profile_page.dart';
import 'package:flutter_movie_app/pages/search.dart';
import 'package:sizer/sizer.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
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
        debugShowCheckedModeBanner: false,
        title: 'Movie App',
        theme: ThemeData(
          brightness: Brightness.dark,
          scaffoldBackgroundColor: Colors.blueGrey[900],
        ),
        initialRoute: '/',
        routes: {
          '/': (context) => const HomePage(),
          '/profile': (context) => const ProfilePage(),
          '/about': (context) => const AboutPage(),
          '/contact': (context) => const ContactPage(),
          '/search': (context) => const Search(),
        },
      );
    });
  }
}
