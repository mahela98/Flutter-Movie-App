import 'package:flutter/material.dart';

class MovieDetailsPage extends StatefulWidget {
  final movie;

  Color mainColor = const Color(0xff3C3261);
  var image_url = 'https://image.tmdb.org/t/p/w500/';
  MovieDetailsPage(this.movie);

  @override
  _MovieDetailsPageState createState() => _MovieDetailsPageState();
}

//  child: Text(widget.movie.title),
class _MovieDetailsPageState extends State<MovieDetailsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            expandedHeight: 200.0,
            floating: false,
            pinned: false,
            flexibleSpace: FlexibleSpaceBar(
              //This exactly likeyour AppBar
              title: Text(
                widget.movie.title,
                textAlign: TextAlign.start,
                style: TextStyle(),
              ),
              // background: "Whatever you want",
              background: Container(
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: NetworkImage(
                          widget.image_url + widget.movie.backdropPath,
                        ),
                        fit: BoxFit.fill)),
                // color: Colors.red,
              ),
            ),
          ),
          SliverFillRemaining(
            child: Center(
              child: Text(widget.movie.title),
            ),
          ),
        ],
      ),
    );
  }
}
