import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_movie_app/components/movie_card.dart';
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
      // extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.orangeAccent[400],
        shadowColor: Colors.black,
        elevation: 1,
        title: const Center(
          child: Text('Movie App'),
        ),
      ),
      body: Row(
        children: <Widget>[
          Expanded(
            child: FutureBuilder<Movie?>(
                future: _movieModel,
                builder: (context, AsyncSnapshot snapshot) {
                  if (snapshot.data != null) {
                    return GridView.builder(
                      // padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
                      itemCount: snapshot.data!.results.length,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        childAspectRatio: 6.0 / 10.0,
                        crossAxisCount: 2,
                      ),
                      // scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        var movie = snapshot.data!.results[index];
                        return Padding(
                          padding: const EdgeInsets.all(0),
                          child: TextButton(
                            child: MovieCard(movie),
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
                    return const Center(child: CircularProgressIndicator());
                  }
                }),
          ),
        ],
      ),
    );
  }
}
