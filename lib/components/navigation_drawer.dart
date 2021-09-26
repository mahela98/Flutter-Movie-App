import 'dart:ffi';
import 'package:sizer/sizer.dart';
import 'package:flutter/material.dart';

class NavigationDrawer extends StatelessWidget {
  const NavigationDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 75.w,
      child: Drawer(
        elevation: 1,
        child: Container(
          decoration: BoxDecoration(color: Colors.blueGrey[900]),
          child: Column(
            children: [
              Expanded(
                flex: 12,
                child: ListView(
                  padding: EdgeInsets.zero,
                  children: [
                    DrawerHeader(
                      padding: EdgeInsets.all(10),
                      decoration: const BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topRight,
                          end: Alignment.bottomLeft,
                          colors: [
                            Colors.amberAccent,
                            Colors.red,
                          ],
                        ),
                        //color: Colors.amberAccent[700],
                      ),
                      child: Container(
                        child: Column(
                          children: [
                            Flexible(
                              child: CircleAvatar(
                                radius: 7.h,
                                backgroundColor: Colors.black,
                                backgroundImage: NetworkImage(
                                    'https://images.unsplash.com/photo-1453728013993-6d66e9c9123a?ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8dmlld3xlbnwwfHwwfHw%3D&ixlib=rb-1.2.1&w=1000&q=80'),
                              ),
                            ),
                            SizedBox(
                              height: 2.h,
                            ),
                            Text(
                              'User Name',
                              style: TextStyle(
                                  fontSize: 12.sp, fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
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
                          Navigator.pop(context);
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
                  color: Colors.amberAccent,
                  child: Center(
                    child: Text(
                      "EACMS Products",
                      style: TextStyle(
                          fontSize: 8.sp, fontWeight: FontWeight.w200),
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
