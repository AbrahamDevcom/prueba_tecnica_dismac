import 'package:hive/hive.dart';
part 'favorites_mdl.g.dart';

@HiveType(typeId: 1)
class Favorites {
  @HiveField(1)
  int movieId;
  @HiveField(2)
  String imageUrl;
  @HiveField(3)
  String title;
  @HiveField(4)
  double rating;
  @HiveField(5)
  int duration;
  @HiveField(6)
  List<String> genres;

  Favorites({
    required this.movieId,
    required this.imageUrl,
    required this.title,
    required this.rating,
    required this.duration,
    required this.genres,
  });

  factory Favorites.empty() {
    return Favorites(
      movieId: -1,
      imageUrl: "",
      title: "",
      rating: 0.0,
      duration: 0,
      genres: [],
    );
  }
  Map<String, dynamic> toJson() => {
        "id": movieId,
        "title": title,
        "genres": List<dynamic>.from(genres.map((x) => x)),
        "rating": rating,
        "poster": imageUrl,
        "runtime": duration,
      };
}
