// To parse this JSON data, do
//
//     final tvShowsData = tvShowsDataFromJson(jsonString);

import 'dart:convert';

TvShowsData tvShowsDataFromJson(String str) =>
    TvShowsData.fromJson(json.decode(str));

String tvShowsDataToJson(TvShowsData data) => json.encode(data.toJson());

class TvShowsData {
  TvShowsData({
    required this.page,
    required this.results,
    required this.totalPages,
    required this.totalResults,
  });

  int page;
  List<Result> results;
  int totalPages;
  int totalResults;

  factory TvShowsData.fromJson(Map<String, dynamic> json) => TvShowsData(
        page: json["page"],
        results:
            List<Result>.from(json["results"].map((x) => Result.fromJson(x))),
        totalPages: json["total_pages"],
        totalResults: json["total_results"],
      );

  Map<String, dynamic> toJson() => {
        "page": page,
        "results": List<dynamic>.from(results.map((x) => x.toJson())),
        "total_pages": totalPages,
        "total_results": totalResults,
      };
}

class Result {
  Result({
    required this.backdropPath,
    required this.firstAirDate,
    required this.genreIds,
    required this.id,
    required this.name,
    required this.originCountry,
    required this.originalLanguage,
    required this.originalName,
    required this.overview,
    required this.popularity,
    required this.posterPath,
    required this.voteAverage,
    required this.voteCount,
  });

  String backdropPath;
  String firstAirDate;
  List<int> genreIds;
  int id;
  String name;
  List<String> originCountry;
  String originalLanguage;
  String originalName;
  String overview;
  double popularity;
  String posterPath;
  double voteAverage;
  int voteCount;

  factory Result.fromJson(Map<String, dynamic> json) => Result(
        backdropPath: json["backdrop_path"] == null
            ? "/o95eGnHVI4iIPrU5zJliL1KPQkU.jpg"
            : json["backdrop_path"],
        firstAirDate:
            json["first_air_date"] == null ? "" : json["first_air_date"],
        genreIds: List<int>.from(json["genre_ids"].map((x) => x)),
        id: json["id"],
        name: json["name"],
        originCountry: List<String>.from(json["origin_country"].map((x) => x)),
        originalLanguage: json["original_language"],
        originalName: json["original_name"],
        overview: json["overview"],
        popularity:
            json["popularity"] == null ? 0 : json["popularity"].toDouble(),
        posterPath: json["poster_path"],
        voteAverage:
            json["vote_average"] == null ? 0 : json["vote_average"].toDouble(),
        voteCount: json["vote_count"] == null ? 0 : json["vote_count"],
      );

  Map<String, dynamic> toJson() => {
        "backdrop_path": backdropPath == null ? null : backdropPath,
        "first_air_date": firstAirDate == null ? null : firstAirDate,
        "genre_ids": List<dynamic>.from(genreIds.map((x) => x)),
        "id": id,
        "name": name,
        "origin_country": List<dynamic>.from(originCountry.map((x) => x)),
        "original_language": originalLanguage,
        "original_name": originalName,
        "overview": overview,
        "popularity": popularity == null ? 1 : popularity,
        "poster_path":
            posterPath == "/z0iCS5Znx7TeRwlYSd4c01Z0lFx.jpg" ? 1 : posterPath,
        "vote_average": voteAverage == null ? 1 : voteAverage,
        "vote_count": voteCount == null ? 1 : voteCount,
      };
}
