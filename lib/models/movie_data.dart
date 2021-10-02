// To parse this JSON data, do
//
//     final movie = movieFromJson(jsonString);

import 'dart:convert';

Movie movieFromJson(String str) => Movie.fromJson(json.decode(str));

String movieToJson(Movie data) => json.encode(data.toJson());

class Movie {
  Movie({
    required this.page,
    required this.results,
    required this.totalPages,
    required this.totalResults,
  });

  int page;
  List<Result> results;
  int totalPages;
  int totalResults;

  factory Movie.fromJson(Map<String, dynamic> json) => Movie(
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
    required this.genreIds,
    //  required this.originalLanguage,
    required this.originalTitle,
    required this.posterPath,
    required this.video,
    required this.voteAverage,
    this.title = '',
    required this.overview,
    required this.releaseDate,
    required this.voteCount,
    required this.adult,
    required this.backdropPath,
    required this.id,
    required this.popularity,
    //  required this.mediaType,
  });

  List<int> genreIds;
  // OriginalLanguage originalLanguage;
  String originalTitle;
  String posterPath;
  bool video;
  double voteAverage;
  String title;
  String overview;
  DateTime releaseDate;
  int voteCount;
  bool adult;
  String backdropPath;
  int id;
  double popularity;
  // MediaType mediaType;

  factory Result.fromJson(Map<String, dynamic> json) => Result(
        genreIds: List<int>.from(json["genre_ids"].map((x) => x)),
        // originalLanguage: originalLanguageValues.map[json["original_language"]],
        originalTitle: json["original_title"] ?? "",
        posterPath: json["poster_path"] ?? "/phSfZMHoBVBUUyBw4uqBzKQNRFn.jpg",
        video: json["video"] ?? "",
        voteAverage: json["vote_average"].toDouble() ?? 0,
        title: json["title"] ?? "",
        overview: json["overview"] ?? "",
        releaseDate: (json["release_date"] == null)
            ? DateTime.parse("1985-04-10")
            : (json["release_date"] == "")
                ? DateTime.parse("1985-04-10")
                : DateTime.parse(json["release_date"]),
        voteCount: json["vote_count"],
        adult: json["adult"],
        backdropPath: (json["backdrop_path"] == null)
            ? "/phSfZMHoBVBUUyBw4uqBzKQNRFn.jpg"
            : (json["backdrop_path"] == "")
                ? "/phSfZMHoBVBUUyBw4uqBzKQNRFn.jpg"
                : json["backdrop_path"],
        id: json["id"],
        popularity: json["popularity"].toDouble(),
        // mediaType: mediaTypeValues.map[json["media_type"]],
      );

  Map<String, dynamic> toJson() => {
        "genre_ids": List<dynamic>.from(genreIds.map((x) => x)),
        // "original_language": originalLanguageValues.reverse[originalLanguage],
        "original_title": originalTitle,
        "poster_path": posterPath,
        "video": video,
        "vote_average": voteAverage,
        "title": title,
        "overview": overview,
        "release_date":
            "${releaseDate.year.toString().padLeft(4, '0')}-${releaseDate.month.toString().padLeft(2, '0')}-${releaseDate.day.toString().padLeft(2, '0')}",
        "vote_count": voteCount,
        "adult": adult,
        "backdrop_path": backdropPath,
        "id": id,
        "popularity": popularity,
        // "media_type": mediaTypeValues.reverse[mediaType],
      };
}

enum MediaType { MOVIE }

final mediaTypeValues = EnumValues({"movie": MediaType.MOVIE});

enum OriginalLanguage { EN, FR, DE }

final originalLanguageValues = EnumValues({
  "de": OriginalLanguage.DE,
  "en": OriginalLanguage.EN,
  "fr": OriginalLanguage.FR
});

class EnumValues<T> {
  late Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    if (reverseMap.isEmpty) {
      reverseMap = map.map((k, v) => MapEntry(v, k));
    }
    return reverseMap;
  }
}
