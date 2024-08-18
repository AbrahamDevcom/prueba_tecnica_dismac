import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import '../../../../data/remote/movies_api.dart';
import '../../../../domain/models/movies_mdl.dart';

class HomeController extends ChangeNotifier {
  Future<List<Movie>> fetchNowShowingMovies() async {
    final response = await MoviesApi().getAllMovies();
    final listSorted = response
      ..sort((a, b) {
        return b.year.compareTo(a.year);
      });
    final lastMovies = listSorted.take(5).toList();
    return lastMovies;
  }

  Future<List<Movie>> fetchPopularMovies() async {
    final response = await MoviesApi().getAllMovies();
    final listSorted = response
      ..sort((a, b) {
        return b.rating.compareTo(a.rating);
      });
    final mostPopularMovies = listSorted.take(10).toList();
    return mostPopularMovies;
  }
}
