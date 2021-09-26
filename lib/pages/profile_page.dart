import 'package:flutter/material.dart';
import 'package:flutter_movie_app/components/navigation_drawer.dart';

import 'package:sizer/sizer.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawerEnableOpenDragGesture: false,
      endDrawer: NavigationDrawer(),
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: Center(child: Text('Profile')),
        backgroundColor: Colors.transparent,
        shadowColor: Colors.black,
        elevation: 1,
        leading: Builder(builder: (context) {
          return IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(Icons.arrow_back_ios_new_rounded));
        }),
      ),
    );
  }
}
