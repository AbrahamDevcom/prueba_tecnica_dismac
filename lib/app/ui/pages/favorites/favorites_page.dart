import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:shimmer/shimmer.dart';

import '../../global_widgets/popular_movie_card.dart';
import '../../global_widgets/shimmer_card.dart';
import 'controller/favorites_controller.dart';

class FavoritesPage extends StatelessWidget {
  static const routerPage = "/favorites";
  const FavoritesPage({super.key});

  @override
  Widget build(BuildContext context) {
    final ctr = Provider.of<FavoritesController>(context);
    return Padding(
      padding: const EdgeInsets.fromLTRB(32, 24, 32, 8),
      child: Column(
        children: [
          const Row(
            children: [
              Text(
                "Mis Peliculas Favoritas",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 16,
          ),
          Expanded(
            child: FutureBuilder(
                future: ctr.getFavorites(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Shimmer.fromColors(
                      baseColor: Colors.grey[300]!,
                      highlightColor: Colors.grey[100]!,
                      child: Column(
                        children: List.generate(
                          2,
                          (index) => const Padding(
                            padding: EdgeInsets.only(bottom: 16.0),
                            child: ShimmerCard(vertical: true),
                          ),
                        ),
                      ),
                    );
                  } else if (snapshot.hasError) {
                    return Center(child: Text('Error: ${snapshot.error}'));
                  } else if (snapshot.hasData) {
                    if (snapshot.data != null && snapshot.data!.isNotEmpty) {
                      return ListView(
                        children: snapshot.data!.map((movie) {
                          return PopularMovieCard(
                            imageUrl: movie.imageUrl,
                            title: movie.title,
                            rating: movie.rating,
                            duration: movie.duration,
                            genres: movie.genres,
                          );
                        }).toList(),
                      );
                    } else {
                      return Center(
                        child: Text("No tienes peliculas favoritas"),
                      );
                    }
                  } else {
                    return Center(child: Text('Error: ${snapshot.error}'));
                  }
                }),
          ),
        ],
      ),
    );
  }
}
