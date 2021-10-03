import 'package:flutter/material.dart';
import 'package:flutter_movie_app/components/tab_movies.dart';
import 'package:flutter_movie_app/urls/urls.dart';

class Search extends StatefulWidget {
  const Search({Key? key}) : super(key: key);

  @override
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<Search> {
  final myController = TextEditingController();
  TextEditingController _textFieldController = TextEditingController();
  String codeDialog = '';
  String valueText = '';

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    myController.dispose();
    super.dispose();
  }

  Future<void> _displayTextInputDialog(BuildContext context) async {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('Search'),
            content: TextField(
              textInputAction: TextInputAction.search,
              autofocus: true,
              onChanged: (value) {
                setState(() {
                  valueText = value;
                });
              },
              controller: _textFieldController,
              decoration: InputDecoration(hintText: "Text Field in Dialog"),
            ),
            actions: <Widget>[
              FlatButton(
                color: Colors.red,
                textColor: Colors.white,
                child: Text('CANCEL'),
                onPressed: () {
                  setState(() {
                    Navigator.pop(context);
                    Navigator.pop(context);
                  });
                },
              ),
              TextButton(
                // color: Colors.green,
                // textColor: Colors.white,
                child: Text('OK'),
                onPressed: () {
                  print(valueText);
                  setState(() {
                    codeDialog = valueText;
                    Navigator.pop(context);
                    Navigator.pushNamed(context, '/contact');
                  });
                },
              ),
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    String queryText = '';

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.black.withOpacity(0.7),
        title: TextField(
          style: TextStyle(color: Colors.white),
          controller: myController,
          // onSubmitted: (value) {
          //   print(queryText);
          //   setState(() {
          //     queryText = value;
          //   });
          //   print(queryText);
          // },
          textInputAction: TextInputAction.search,
          decoration: const InputDecoration(
            border: InputBorder.none,
            hintText: 'Search',
            hintStyle: TextStyle(color: Colors.white70),
          ),
          // autofocus: true,
          cursorColor: Colors.white,
        ),
        actions: [
          IconButton(
              onPressed: () {
                showDialog(
                    context: context,
                    builder: (context) {
                      print(myController.text);
                      return Trending(MovieDB.moviedb_search_movie_url);
                    });
              },
              icon: Icon(Icons.search_outlined))
        ],
      ),
      body: Center(
        child: TextButton(
          // color: Colors.teal,
          // textColor: Colors.white,
          onPressed: () {
            _displayTextInputDialog(context);
          },
          child: Text('Press For Alert'),
        ),
      ),
    );
  }
}
