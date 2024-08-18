// To parse this JSON data, do
//
//     final Movie =mMovieFromJson(jsonString);

import 'dart:convert';

List<Movie> movieFromJson(String str) => List<Movie>.from(json.decode(str).map((x) => Movie.fromJson(x)));

String movieToJson(List<Movie> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Movie {
  int id;
  String title;
  int year;
  List<String> genre;
  double rating;
  String director;
  List<String> actors;
  String plot;
  String poster;
  String trailer;
  int runtime;
  String awards;
  String country;
  String language;
  String boxOffice;
  String production;
  String website;

  Movie({
    required this.id,
    required this.title,
    required this.year,
    required this.genre,
    required this.rating,
    required this.director,
    required this.actors,
    required this.plot,
    required this.poster,
    required this.trailer,
    required this.runtime,
    required this.awards,
    required this.country,
    required this.language,
    required this.boxOffice,
    required this.production,
    required this.website,
  });

  factory Movie.empty() {
    return Movie(
      id: -1,
      title: "",
      year: 2000,
      genre: [],
      rating: 0.0,
      director: "",
      actors: [],
      plot: "",
      poster: "",
      trailer: "",
      runtime: -1,
      awards: "",
      country: "",
      language: "",
      boxOffice: "",
      production: "",
      website: "",
    );
  }

  factory Movie.fromRawJson(String str) => Movie.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Movie.fromJson(Map<String, dynamic> json) => Movie(
        id: json["id"],
        title: json["title"],
        year: json["year"],
        genre: List<String>.from(json["genre"].map((x) => x)),
        rating: json["rating"]?.toDouble(),
        director: json["director"],
        actors: List<String>.from(json["actors"].map((x) => x)),
        plot: json["plot"],
        poster: json["poster"],
        trailer: json["trailer"],
        runtime: json["runtime"],
        awards: json["awards"],
        country: json["country"],
        language: json["language"],
        boxOffice: json["boxOffice"],
        production: json["production"],
        website: json["website"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "year": year,
        "genre": List<dynamic>.from(genre.map((x) => x)),
        "rating": rating,
        "director": director,
        "actors": List<dynamic>.from(actors.map((x) => x)),
        "plot": plot,
        "poster": poster,
        "trailer": trailer,
        "runtime": runtime,
        "awards": awards,
        "country": country,
        "language": language,
        "boxOffice": boxOffice,
        "production": production,
        "website": website,
      };
}
