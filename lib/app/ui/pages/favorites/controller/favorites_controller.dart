import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:prueba_tecnica_dismac/app/domain/models/favorites_mdl.dart';

import '../../../global_controller/global_controller.dart';

class FavoritesController extends ChangeNotifier {
  Future<List<Favorites>> getFavorites() async {
    final favoritesBox = Hive.box<Favorites>('favorites');
    print(favoritesBox.values.length);
    final listFavorites = favoritesBox.values.toList();
    return listFavorites;
  }
}
