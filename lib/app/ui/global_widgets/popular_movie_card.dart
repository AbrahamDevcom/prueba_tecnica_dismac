import 'package:flutter/material.dart';

class PopularMovieCard extends StatelessWidget {
  final String imageUrl;
  final String title;
  final double rating;
  final int duration;
  final List<String> genres;

  const PopularMovieCard(
      {super.key,
      required this.imageUrl,
      required this.title,
      required this.rating,
      required this.duration,
      required this.genres});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8.0),
            child: Image.network(
              imageUrl,
              width: 100,
              height: 150,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.black)),
                const SizedBox(height: 8),
                Text("$rating/10 IMDb", style: const TextStyle(color: Colors.grey)),
                const SizedBox(height: 8),
                Text("$duration min.", style: const TextStyle(color: Colors.grey)),
                const SizedBox(height: 8),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: genres
                        .map((genre) => Padding(
                              padding: const EdgeInsets.only(right: 8.0),
                              child: Chip(
                                label: Text(genre),
                              ),
                            ))
                        .toList(),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
