import 'package:flutter/material.dart';
import 'package:flutter_movie_app/models/movie_data.dart';
import 'package:flutter_movie_app/services/api_manager.dart';
import './movie_details_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late Future<Movie?> _movieModel;

  void initState() {
    _movieModel = ApiManager().getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text('Movie App'),
        ),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: FutureBuilder<Movie?>(
                future: _movieModel,
                builder: (context, AsyncSnapshot snapshot) {
                  if (snapshot.data != null) {
                    return ListView.builder(
                      itemCount: snapshot.data!.results.length,
                      itemBuilder: (context, index) {
                        var movie = snapshot.data!.results[index];
                        return Card(
                          // child: Text(movie.title),
                          child: TextButton(
                            child: Text(movie.title),
                            onPressed: () {
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (context) {
                                return MovieDetailsPage();
                              }));
                            },
                          ),
                        );
                      },
                    );
                  } else {
                    return Center(child: CircularProgressIndicator());
                  }
                }),
          ),
        ],
      ),
    );
  }
}
