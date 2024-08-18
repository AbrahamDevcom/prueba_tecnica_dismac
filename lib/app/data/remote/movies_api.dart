import 'dart:convert';

import 'package:prueba_tecnica_dismac/app/data/helpers/http_method.dart';

import '../../domain/models/movies_mdl.dart';
import '../helpers/http.dart';

class MoviesApi {
  final Http _http = Http();
  final headers = {'Content-Type': 'application/json'};

  Future<List<Movie>> getAllMovies() async {
    try {
      final request = await _http.request(
        "/v1/movies",
        method: HttpMethod.get,
        headers: headers,
      );
      final response = utf8.decode(request.bodyBytes);
      final rsp = movieFromJson(response);
      return rsp;
    } catch (e) {
      return <Movie>[];
    }
  }

  getMovieById() async {
    try {
      final request = await _http.request(
        "/v1/movies/1",
        method: HttpMethod.get,
        headers: headers,
      );
      final response = utf8.decode(request.bodyBytes);
      final rsp = Movie.fromRawJson(response);
    } catch (e) {
      return Movie.empty();
    }
  }

  Future<List<Movie>> searchMovie(String query) async {
    try {
      final request =
          await _http.request("/v1/movies", method: HttpMethod.get, headers: headers, queryParams: {"search": query});
      final response = utf8.decode(request.bodyBytes);
      final rsp = movieFromJson(response);
      return rsp;
    } catch (e) {
      return <Movie>[];
    }
  }
}
