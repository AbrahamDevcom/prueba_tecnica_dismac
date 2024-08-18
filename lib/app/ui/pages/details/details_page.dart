import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:prueba_tecnica_dismac/app/domain/models/favorites_mdl.dart';
import 'package:prueba_tecnica_dismac/app/ui/pages/details/controller.dart/details_controller.dart';
import 'package:prueba_tecnica_dismac/app/utils/utils.dart';

import '../../../domain/models/movies_mdl.dart';
import '../../../utils/custom_colors.dart';

class DetailsPage extends StatelessWidget {
  static const routerPage = "/details";
  const DetailsPage({super.key});
  @override
  Widget build(BuildContext context) {
    final data = (ModalRoute.of(context)?.settings.arguments ?? Movie.empty()) as Movie;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                Hero(
                  tag: data.id,
                  child: Image.network(
                    data.poster,
                    width: double.infinity,
                    height: 300,
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  top: 40,
                  left: 16,
                  child: IconButton(
                    icon: const Icon(Icons.arrow_back_ios_new_rounded, color: Colors.white),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                ),
                Positioned(
                  top: 40,
                  right: 16,
                  child: IconButton(
                    icon: const Icon(Icons.more_vert, color: Colors.white),
                    onPressed: () {},
                  ),
                ),
                Positioned(
                    bottom: 0,
                    left: 0,
                    right: 0,
                    child: Container(
                      width: double.infinity,
                      height: 10,
                      decoration: const BoxDecoration(
                          color: white, borderRadius: BorderRadius.vertical(top: Radius.circular(12))),
                    )),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Text(
                          data.title,
                          style: const TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Consumer<DetailsController>(
                        builder: (BuildContext context, controller, Widget? child) {
                          return IconButton(
                            icon: controller.isFavorite(data.id)
                                ? const Icon(
                                    Icons.bookmark,
                                    color: Colors.amber,
                                  )
                                : const Icon(Icons.bookmark_border),
                            onPressed: () {
                              //controller.deleteAll();
                              controller.toggleFavorite(
                                Favorites(
                                  movieId: data.id,
                                  imageUrl: data.poster,
                                  title: data.title,
                                  rating: data.rating,
                                  duration: data.runtime,
                                  genres: data.genre,
                                ),
                              );
                            },
                          );
                        },
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      const Icon(Icons.star, color: Colors.amber, size: 20),
                      const SizedBox(width: 4),
                      Text('${data.rating}/10 IMDb'),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Row(
                      children: data.genre
                          .map((e) {
                            return Chip(
                              label: Text(e),
                              backgroundColor: Colors.blue[100],
                            );
                          })
                          .toList()
                          .divide(const SizedBox(
                            width: 4,
                          ))),
                  const SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text('Length', style: TextStyle(fontWeight: FontWeight.bold)),
                          Text('${data.runtime}min'),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text('Language', style: TextStyle(fontWeight: FontWeight.bold)),
                          Text(data.language),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text('Production', style: TextStyle(fontWeight: FontWeight.bold)),
                          Text(data.production),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  const Text(
                    'Description',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    data.plot,
                    style: TextStyle(color: Colors.grey[600]),
                  ),
                  const SizedBox(height: 16),
                  const Text(
                    'Cast',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Wrap(
                      spacing: 8,
                      children: data.actors.map((e) {
                        return Chip(
                          label: Text(e),
                        );
                      }).toList()),
                  const SizedBox(height: 8),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
