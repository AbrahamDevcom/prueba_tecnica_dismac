import 'package:flutter/material.dart';
import 'package:prueba_tecnica_dismac/app/data/remote/movies_api.dart';

import '../../../../domain/models/movies_mdl.dart';

class SearchPageController extends ChangeNotifier {
  TextEditingController queryController = TextEditingController(text: "");

  Future<List<Movie>> searchMovie(String query) async {
    final response = await MoviesApi().searchMovie(query);
    return response;
  }

  void search(String value) {
    searchMovie(value);
    notifyListeners();
  }
}
