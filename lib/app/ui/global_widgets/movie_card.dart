import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class MovieCard extends StatelessWidget {
  final String imageUrl;
  final String title;
  final double rating;
  final int year;
  final int movieId;

  const MovieCard({
    super.key,
    required this.imageUrl,
    required this.title,
    required this.rating,
    required this.year,
    required this.movieId,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 120,
      margin: const EdgeInsets.only(right: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8.0),
            child: Hero(
              tag: movieId,
              child: Image.network(
                imageUrl,
                width: 120,
                height: 160,
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(height: 8),
          Text(title,
              style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: Colors.black),
              maxLines: 1,
              overflow: TextOverflow.ellipsis),
          const SizedBox(height: 4),
          Text("$rating/10 IMDb", style: const TextStyle(color: Colors.grey)),
          Text("$year", style: const TextStyle(color: Colors.grey)),
        ],
      ),
    );
  }
}
