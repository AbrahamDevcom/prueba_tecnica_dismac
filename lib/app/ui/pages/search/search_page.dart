import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shimmer/shimmer.dart';

import '../../../domain/models/movies_mdl.dart';
import '../../global_widgets/popular_movie_card.dart';
import '../../global_widgets/shimmer_card.dart';
import 'controller/search_page_controller.dart';

class SearchPage extends StatelessWidget {
  static const routerPage = "/search";
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<SearchPageController>(builder: (context, controller, child) {
      return Padding(
        padding: const EdgeInsets.fromLTRB(16.0, 16, 16, 0),
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.only(bottom: 8),
              padding: const EdgeInsets.symmetric(horizontal: 4),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black87, width: 1),
                borderRadius: BorderRadius.circular(20),
              ),
              child: TextField(
                controller: controller.queryController,
                decoration: const InputDecoration(
                  hintText: 'Buscar pelicula por nombre',
                  prefixIcon: Icon(Icons.search_rounded),
                  border: InputBorder.none,
                ),
                onChanged: (value) async {
                  await Future.delayed(const Duration(seconds: 1), () {
                    controller.search(value);
                  });
                },
              ),
            ),
            Expanded(
              child: FutureBuilder<List<Movie>>(
                future: controller.searchMovie(controller.queryController.text),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Shimmer.fromColors(
                      baseColor: Colors.grey[300]!,
                      highlightColor: Colors.grey[100]!,
                      child: ListView(
                        children: List.generate(
                          4,
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
                    return ListView(
                      children: snapshot.data!.map((movie) {
                        return PopularMovieCard(
                          imageUrl: movie.poster,
                          title: movie.title,
                          rating: movie.rating,
                          duration: movie.runtime,
                          genres: movie.genre,
                        );
                      }).toList(),
                    );
                  } else {
                    return const Center(child: Text('No data found'));
                  }
                },
              ),
            ),
          ],
        ),
      );
    });
  }
}
