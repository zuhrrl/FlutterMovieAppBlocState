import 'package:equatable/equatable.dart';

class Watchlist extends Equatable {
  int isMovie;

  int? id;
  String? overview;
  String? posterPath;
  String? title;

  Watchlist({
    required this.isMovie,
    required this.id,
    required this.overview,
    required this.posterPath,
    required this.title,
  });

  @override
  List<Object?> get props => [
        isMovie,
        id,
        overview,
        posterPath,
        title,
      ];
}
