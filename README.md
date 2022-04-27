## Movie App using Flutter and MovieDB API

### Functions
- Trending Movies
- Top Rated movies
- Upcomming Movies
- Popular TV shows
- Top TV shows
- Search Movies by name

### Technologies Used
- Flutter
- MovieDB API
- Youtube API
- VS-Code
- Postman

## How to run
- Create urls.dart file inside urls folder.
- Create a class as follows

```dart
import 'package:flutter/cupertino.dart';

class MovieDB {
  static String moviedb_trending_movie_url =
      'https://api.themoviedb.org/3/trending/movie/week?api_key={Your API key}';

  static String moviedb_top_rated_movie_url =
      'https://api.themoviedb.org/3/movie/top_rated?api_key={Your API key}';
  static String moviedb_popular_movie_url =
      'https://api.themoviedb.org/3/movie/popular?api_key={Your API key}';

  static String moviedb_upcomming_movie_url =
      'https://api.themoviedb.org/3/movie/upcoming?api_key={Your API key}';

  static String moviedb_popular_tvshows_url =
      'https://api.themoviedb.org/3/tv/popular?api_key={Your API key}';

  static String moviedb_top_rated_tvshows_url =
      'https://api.themoviedb.org/3/tv/top_rated?api_key={Your API key}';
  static String moviedb_latest_tvshows_url =
      'https://api.themoviedb.org/3/tv/latest?api_key={Your API key}';

  static searchMovieDB(String query) {
    String moviedb_search_movie_url =
        'https://api.themoviedb.org/3/search/movie?api_key={Your API key}&query=${query}';
    return moviedb_search_movie_url;
  }
}

class YouTube {


  static String youtube_API_key = "{Youtube API key}";

  static setUrl(String movieName) {
    String youtube_video_data_url =
        'https://www.googleapis.com/youtube/v3/search?key=${youtube_API_key}&q=${movieName} movie official trailer &maxResults=1&order=relevance';

    return youtube_video_data_url;
  }
}

```

## Screen-shots

|   |  |
| --------  | ------------------- |
|  ![WhatsApp Image 2022-04-27 at 7 00 06 AM (1)](https://user-images.githubusercontent.com/59562575/165454445-1f8e68da-7b93-4b29-9720-2a488817d435.jpeg) | ![WhatsApp Image 2022-04-27 at 7 00 04 AM (2)](https://user-images.githubusercontent.com/59562575/165454462-6b36a75c-b186-45c3-8ae0-472b6b8e236d.jpeg)    | 
| ![WhatsApp Image 2022-04-27 at 7 00 02 AM](https://user-images.githubusercontent.com/59562575/165454466-e765da22-8952-44ed-a701-29680a1b7555.jpeg) | ![WhatsApp Image 2022-04-27 at 7 00 05 AM](https://user-images.githubusercontent.com/59562575/165454479-4d66fa15-1693-4213-bf08-ea60255ff31c.jpeg) |
| ![WhatsApp Image 2022-04-27 at 7 00 04 AM](https://user-images.githubusercontent.com/59562575/165454481-643871fc-50f9-46a7-97af-ae69d2972ca4.jpeg)      | ![WhatsApp Image 2022-04-27 at 7 00 06 AM](https://user-images.githubusercontent.com/59562575/165454489-aba80258-2d8b-4a5a-9e39-b42d16df2656.jpeg) |








