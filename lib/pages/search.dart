import 'package:flutter/material.dart';
import 'package:flutter_movie_app/components/tab_movies.dart';
import 'package:flutter_movie_app/urls/urls.dart';
import 'package:material_floating_search_bar/material_floating_search_bar.dart';

class Search extends StatefulWidget {
  const Search({Key? key}) : super(key: key);

  @override
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<Search> {
  @override
  Widget build(BuildContext context) {
    String queryText = '-';
    bool isSearchViewClicked = true;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepOrange,
        title: isSearchViewClicked
            ? TextField(
                style: TextStyle(color: Colors.white),
                onSubmitted: (value) {
                  isSearchViewClicked = false;

                  setState(() {
                    queryText = value;
                  });
                },
                textInputAction: TextInputAction.search,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: 'Search',
                  hintStyle: TextStyle(color: Colors.white70),
                  icon: IconButton(
                    icon: Icon(
                      Icons.arrow_back,
                      color: Colors.white,
                    ),
                    onPressed: () {
                      setState(() {
                        isSearchViewClicked = false;
                      });
                    },
                  ),
                ),
                autofocus: true,
                cursorColor: Colors.black,
              )
            : Text(
                'Material Search',
                style: TextStyle(color: Colors.white),
              ),
        actions: <Widget>[
          IconButton(
            icon: isSearchViewClicked
                ? Icon(
                    Icons.close,
                    color: Colors.white,
                  )
                : Icon(
                    Icons.search,
                    color: Colors.white,
                  ),
            onPressed: () {
              //show search bar
              setState(() {
                if (isSearchViewClicked) {
                  isSearchViewClicked = false;
                } else {
                  isSearchViewClicked = true;
                }
              });
            },
          )
        ],
      ),
    );
  }
}
