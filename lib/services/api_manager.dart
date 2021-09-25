import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/movie_data.dart';
import '../urls/urls.dart';
import '../models/youtube_video_details.dart';

class ApiManager {
  Future<Movie?> getData() async {
    var client = http.Client();
    var movieDataModel;

    try {
      var url = Uri.parse(MovieDB.moviedb_url);
      var response = await client.get(url);
      print('Response status: ${response.statusCode}');
      // print('Response body: ${response.body}');

      if (response.statusCode == 200) {
        var jsonString = response.body;
        // print(jsonString);
        var jsonMap = await json.decode(jsonString);
        movieDataModel = Movie.fromJson(jsonMap);
      }
    } catch (e) {
      print('Error _ : $e');
      return movieDataModel;
    }
    return movieDataModel;
  }

  Future<YoutubeVideoDetails?> getVideoData(String moviename) async {
    var client = http.Client();
    var youtubeDataModel;

    try {
      var url = Uri.parse(YouTube.setUrl(moviename));
      var response = await client.get(url);
      print('Youtube Response status: ${response.statusCode}');
      // print('Response body: ${response.body}');

      if (response.statusCode == 200) {
        var jsonString = response.body;
        // print(jsonString);
        var jsonMap = await json.decode(jsonString);
        youtubeDataModel = YoutubeVideoDetails.fromJson(jsonMap);
      }
    } catch (e) {
      print('Error _ : $e');
      return youtubeDataModel;
    }
    return youtubeDataModel;
  }
}
