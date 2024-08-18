import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:prueba_tecnica_dismac/app/ui/pages/details/details_page.dart';
import 'package:prueba_tecnica_dismac/app/ui/pages/home/controller/home_controller.dart';
import 'package:shimmer/shimmer.dart';
import '../../../domain/models/movies_mdl.dart';
import '../../global_widgets/movie_card.dart';
import '../../global_widgets/popular_movie_card.dart';
import '../../global_widgets/shimmer_card.dart';

class HomePage extends StatelessWidget {
  static const routerPage = "/home";

  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<HomeController>(builder: (context, controller, child) {
      return SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Más recientes',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.indigo,
                    ),
                  ),
                  TextButton(onPressed: () {}, child: const Text('Ver todas'))
                ],
              ),
              const SizedBox(height: 8),
              FutureBuilder<List<Movie>>(
                future: controller.fetchNowShowingMovies(),
                builder: (_, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Shimmer.fromColors(
                      baseColor: Colors.grey[300]!,
                      highlightColor: Colors.grey[100]!,
                      child: SizedBox(
                        height: 200,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: 3,
                          itemBuilder: (context, index) => const ShimmerCard(),
                        ),
                      ),
                    );
                  } else if (snapshot.hasError) {
                    return Center(child: Text('Error: ${snapshot.error}'));
                  } else if (snapshot.hasData) {
                    return SizedBox(
                      height: 240,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: snapshot.data!.length,
                        itemBuilder: (_, index) {
                          final movie = snapshot.data![index];
                          return InkWell(
                            onTap: () => Navigator.pushNamed(context, DetailsPage.routerPage, arguments: movie),
                            child: MovieCard(
                              imageUrl: movie.poster,
                              title: movie.title,
                              rating: movie.rating,
                              year: movie.year,
                              movieId: movie.id,
                            ),
                          );
                        },
                      ),
                    );
                  } else {
                    return const Center(child: Text('No data found'));
                  }
                },
              ),
              const SizedBox(height: 16),
              // Popular Section
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text('Mejor raiting',
                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.indigo)),
                  TextButton(
                    onPressed: () {},
                    child: const Text('Ver todas'),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              FutureBuilder<List<Movie>>(
                future: controller.fetchPopularMovies(),
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
                    return Column(
                      children: snapshot.data!.map((movie) {
                        return InkWell(
                          onTap: () => Navigator.pushNamed(context, DetailsPage.routerPage, arguments: movie),
                          child: PopularMovieCard(
                            imageUrl: movie.poster,
                            title: movie.title,
                            rating: movie.rating,
                            duration: movie.runtime,
                            genres: movie.genre,
                          ),
                        );
                      }).toList(),
                    );
                  } else {
                    return const Center(child: Text('No data found'));
                  }
                },
              ),
            ],
          ),
        ),
      );
    });
  }
}
