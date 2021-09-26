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
    SizedBox sizedBoxSpace = SizedBox(height: 5.h);
    return Scaffold(
      resizeToAvoidBottomInset: false,
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
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.fromLTRB(5.h, 0, 5.h, 0),
          child: ListView(
            shrinkWrap: true,
            // gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            //   childAspectRatio: 10 / 10.0,
            //   crossAxisCount: 1,
            // ),

            children: [
              SizedBox(
                height: 4.h,
              ),
              Center(
                child: CircleAvatar(
                  radius: 10.h,
                  backgroundImage: const NetworkImage(
                      'https://images.unsplash.com/photo-1453728013993-6d66e9c9123a?ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8dmlld3xlbnwwfHwwfHw%3D&ixlib=rb-1.2.1&w=1000&q=80'),
                ),
              ),
              sizedBoxSpace,
              //form starts
              Form(
                child: Wrap(
                  children: [
                    TextFormField(
                      restorationId: 'name_field',
                      textInputAction: TextInputAction.next,
                      textCapitalization: TextCapitalization.words,
                      decoration: const InputDecoration(
                          filled: true,
                          icon: Icon(Icons.person),
                          border: UnderlineInputBorder(),
                          labelText: 'Name'),
                    ),
                    SizedBox(
                      height: 14.h,
                    ),
                    TextFormField(
                      restorationId: 'name_field',
                      textInputAction: TextInputAction.next,
                      textCapitalization: TextCapitalization.words,
                      decoration: const InputDecoration(
                          filled: true,
                          icon: Icon(Icons.person_pin),
                          border: UnderlineInputBorder(),
                          labelText: 'Username'),
                    ),
                    SizedBox(
                      height: 14.h,
                    ),
                    TextFormField(
                      restorationId: 'name_field',
                      textInputAction: TextInputAction.next,
                      textCapitalization: TextCapitalization.words,
                      decoration: const InputDecoration(
                          filled: true,
                          icon: Icon(Icons.email_rounded),
                          border: UnderlineInputBorder(),
                          labelText: 'Email'),
                    ),
                    SizedBox(
                      height: 14.h,
                    ),
                    Center(
                      child: ElevatedButton(
                        onPressed: () {},
                        child: Text('Submit'),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
