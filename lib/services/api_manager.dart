import 'dart:convert';
import 'package:flutter_movie_app/models/tv_show.dart';
import 'package:http/http.dart' as http;
import '../models/movie_data.dart';
import '../urls/urls.dart';
import '../models/youtube_video_details.dart';

class ApiManager {
  //get data from movie urls
  Future<Movie?> getMovieData(String movieUrl) async {
    var client = http.Client();
    var movieDataModel;
    print(movieUrl);
    try {
      var url = Uri.parse(movieUrl);
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

  Future<TvShowsData?> getTvShowData(String tvShowUrl) async {
    var client = http.Client();
    var tvShowDataModel;
    print(tvShowUrl);
    try {
      var url = Uri.parse(tvShowUrl);
      var response = await client.get(url);
      print('Response status: ${response.statusCode}');
      // print('Response body: ${response.body}');

      if (response.statusCode == 200) {
        var jsonString = response.body;
        // print(jsonString);
        var jsonMap = await json.decode(jsonString);
        tvShowDataModel = TvShowsData.fromJson(jsonMap);
      }
    } catch (e) {
      print('Error _ : $e');
      return tvShowDataModel;
    }
    return tvShowDataModel;
  }

//gets data from youtube
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
