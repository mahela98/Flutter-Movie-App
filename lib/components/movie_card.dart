import 'package:flutter/material.dart';

class MovieCard extends StatelessWidget {
  final movie;

  Color mainColor = const Color(0xff3C3261);
  var image_url = 'https://image.tmdb.org/t/p/w500/';
  MovieCard(this.movie);

  @override
  Widget build(BuildContext context) {
    return Card(
      // clipBehavior: Clip.antiAlias,
      child: Container(
        height: 200,
        alignment: Alignment.centerLeft,
        child: Row(
          children: [
            Image.network(image_url + movie.posterPath),
            const SizedBox(
              width: 15,
            ),
            Container(
              child: Column(
                children: [
                  SizedBox(
                    width: 180,
                    child: Text(
                      movie.title,
                      style: const TextStyle(
                        fontSize: 25.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 180,
                    child: Text(movie.overview.substring(0, 100)),
                  ),
                  SizedBox(
                    width: 180,
                    child: Text(movie.releaseDate.toString()),
                  ),
                ],
              ),
              alignment: Alignment.topLeft,
            ),
          ],
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          // image: DecorationImage(
          //   image: NetworkImage(image_url + movie.posterPath),
          //   fit: BoxFit.fitHeight,
          // ),
        ),
      ),
    );
  }
}
