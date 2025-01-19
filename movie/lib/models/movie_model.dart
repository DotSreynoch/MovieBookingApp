import 'package:movie/models/cast_model.dart';

class MovieModel {
  final int id;
  final String name;
  final double rating;
  final String director;
  final String storyLine;
  final String image;
  final String imageLogo;
  final List<String> genre;
  final List<MovieCastModel> castList;

  MovieModel({
    required this.id,
    required this.genre,
    required this.name,
    required this.rating,
    required this.director,
    required this.storyLine,
    required this.image,
    required this.imageLogo,
    required this.castList,
  });
}