import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../../../../domain/models/favorites_mdl.dart';

class DetailsController extends ChangeNotifier {
  void toggleFavorite(Favorites movie) async {
    var favoritesBox = Hive.box<Favorites>('favorites');
    final favoritesMap = favoritesBox.toMap();
    var existingFavorite = favoritesBox.values.firstWhere(
      (favorite) => favorite.movieId == movie.movieId,
      orElse: () => Favorites.empty(),
    );
    if (existingFavorite.movieId != -1) {
      for (var e in favoritesMap.entries) {
        if (e.value.movieId == movie.movieId) {
          await favoritesBox.delete(e.key);
          notifyListeners();
          break;
        }
      }
    } else {
      await favoritesBox.add(movie);
      notifyListeners();
    }
  }

  deleteAll() {
    var favoritesBox = Hive.box<Favorites>('favorites');
    favoritesBox.clear();
  }

  bool isFavorite(int movieId) {
    var favoritesBox = Hive.box<Favorites>('favorites');
    var existingFavorite = favoritesBox.values.firstWhere(
      (favorite) => favorite.movieId == movieId,
      orElse: () => Favorites.empty(),
    );
    return existingFavorite.movieId != -1;
  }
}
