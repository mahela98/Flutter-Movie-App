import 'package:flutter/cupertino.dart';

class MovieDB {
  static String moviedb_url =
      'https://api.themoviedb.org/3/trending/movie/week?api_key=ed59011d6c46d7a33abf946104590345';
}

class YouTube {
  //  String MovieName ;
  // YouTube(this.MovieName);

  static String youtube_API_key = "AIzaSyA6x1Uwo8dYjqex2tdKqicg0r9p9dQz_Io";

  static setUrl(String movieName) {
    String youtube_video_data_url =
        'https://www.googleapis.com/youtube/v3/search?key=${youtube_API_key}&q=${movieName} movie official trailer &maxResults=1&order=relevance';

    return youtube_video_data_url;
  }
}
