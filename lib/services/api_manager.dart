import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/movie_data.dart';
import '../urls/urls.dart';

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
}
