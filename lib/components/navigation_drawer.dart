import 'dart:ffi';
import 'package:flutter_movie_app/pages/profile_page.dart';
import 'package:sizer/sizer.dart';
import 'package:flutter/material.dart';

class NavigationDrawer extends StatelessWidget {
  const NavigationDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 75.w,
      child: Drawer(
        elevation: 16.0,
        child: Container(
          decoration: BoxDecoration(
            // color: Colors.black.withOpacity(0.7),
            // backgroundBlendMode: BlendMode.hardLight,

            gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              colors: [
                Colors.indigo.withOpacity(0.9),
                Colors.black54.withOpacity(0.9),
              ],
            ),
          ),
          child: Column(
            children: [
              Expanded(
                flex: 12,
                child: ListView(
                  padding: EdgeInsets.zero,
                  children: [
                    DrawerHeader(
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: Colors.black.withOpacity(0.8),
                        //color: Colors.amberAccent[700],
                      ),
                      child: Container(
                        child: Column(
                          children: [
                            Flexible(
                              child: CircleAvatar(
                                radius: 7.h,
                                backgroundColor: Colors.black,
                                child: TextButton(
                                    onPressed: () {
                                      Navigator.pop(context);

                                      Navigator.pushNamed(context, '/profile');
                                    },
                                    child: const Text('')),
                                backgroundImage: const NetworkImage(
                                    'https://www.pngall.com/wp-content/uploads/5/User-Profile-PNG-Image.png'),
                              ),
                            ),
                            SizedBox(
                              height: 2.h,
                            ),
                            Text(
                              'User Name',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 12.sp,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      child: ListTile(
                        title: const Center(
                            child: Text(
                          'Home',
                          style: TextStyle(color: Colors.white),
                        )),
                        subtitle: Divider(
                          color: Colors.grey[200],
                          height: 1,
                        ),
                        onTap: () {
                          // Update the state of the app.
                          Navigator.pop(context);
                        },
                      ),
                    ),
                    Container(
                      child: ListTile(
                        title: const Center(
                            child: Text(
                          'About',
                          style: TextStyle(color: Colors.white),
                        )),
                        subtitle: Divider(
                          color: Colors.grey[200],
                          height: 1,
                        ),
                        onTap: () {
                          // Update the state of the app.
                          Navigator.pop(context);
                          Navigator.pushNamed(context, '/about');
                        },
                      ),
                    ),
                    Container(
                      child: ListTile(
                        title: const Center(
                          child: Text(
                            'Contact',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                        subtitle: Divider(
                          color: Colors.grey[200],
                          height: 1,
                        ),
                        onTap: () {
                          // Update the state of the app.
                          Navigator.pop(context);
                          Navigator.pushNamed(context, '/contact');
                        },
                      ),
                    ),
                    Container(
                      child: ListTile(
                        title: const Center(
                            child: Text(
                          'Help',
                          style: TextStyle(color: Colors.white),
                        )),
                        subtitle: Divider(
                          color: Colors.grey[200],
                          height: 1,
                        ),
                        onTap: () {
                          // Update the state of the app.
                          // Navigator.pop(context);
                          // Navigator.pushNamed(context, '/search');
                        },
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                flex: 1,
                child: Container(
                  width: 100.h,
                  color: Colors.transparent,
                  child: Center(
                    child: Text(
                      "EACMS Products",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 8.sp,
                          fontWeight: FontWeight.w200),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
