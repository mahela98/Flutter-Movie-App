import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:intl/intl.dart';

class MovieDetailsPage extends StatefulWidget {
  final movie;

  Color mainColor = Colors.black;
  var imageUrl = 'https://image.tmdb.org/t/p/w500/';
  var backgroundImageUrl = 'https://image.tmdb.org/t/p/original/';
  MovieDetailsPage(this.movie);
  final DateFormat rFormat = DateFormat('yyyy');

  @override
  _MovieDetailsPageState createState() => _MovieDetailsPageState();
}

//  child: Text(widget.movie.title),
class _MovieDetailsPageState extends State<MovieDetailsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: CustomScrollView(
        scrollDirection: Axis.vertical,
        slivers: <Widget>[
          SliverAppBar(
            expandedHeight: 40.h,
            floating: false,
            pinned: false,
            flexibleSpace: FlexibleSpaceBar(
              title: Text(
                widget.movie.title,
                textAlign: TextAlign.start,
                style: TextStyle(),
              ),
              background: Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: NetworkImage(
                        widget.backgroundImageUrl + widget.movie.backdropPath,
                      ),
                      fit: BoxFit.cover),
                ),
                // color: Colors.red,
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Scrollbar(
              child: Padding(
                padding: EdgeInsets.all(1),
                child: Container(
                  child: Column(
                    children: [
                      SizedBox(
                        height: 5.h,
                      ),
                      Container(
                        decoration: const BoxDecoration(boxShadow: [
                          BoxShadow(
                              blurRadius: 4,
                              color: Colors.grey,
                              offset: Offset(1, 1))
                        ]),
                        height: 50.h,
                        child: Image(
                          image: NetworkImage(
                            widget.imageUrl + widget.movie.posterPath,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 5.h,
                      ),

                      Container(
                        // color: Colors.white,
                        padding: EdgeInsets.all(20.0),
                        child: Table(
                          border: TableBorder.all(color: Colors.black),
                          children: [
                            TableRow(children: [
                              const Text(
                                'Title',
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.white,
                                ),
                              ),
                              Text(
                                widget.movie.title,
                                style: const TextStyle(
                                  fontSize: 14,
                                  color: Colors.white,
                                ),
                              ),
                            ]),
                            TableRow(children: [
                              const Text(
                                'Release Date',
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.white,
                                ),
                              ),
                              Text(
                                widget.rFormat.format(widget.movie.releaseDate),
                                style: const TextStyle(
                                  fontSize: 14,
                                  color: Colors.white,
                                ),
                              ),
                            ])
                          ],
                        ),
                      )
                      // Image(
                      //   image: NetworkImage(
                      //     widget.imageUrl + widget.movie.backdropPath,
                      //   ),
                      // ),
                      // Image(
                      //   image: NetworkImage(
                      //     widget.imageUrl + widget.movie.backdropPath,
                      //   ),
                      // ),
                      // Image(
                      //   image: NetworkImage(
                      //     widget.imageUrl + widget.movie.backdropPath,
                      //   ),
                      // ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
