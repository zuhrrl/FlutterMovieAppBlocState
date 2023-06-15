import 'package:ditonton/domain/entities/movie_detail.dart';
import 'package:ditonton/domain/entities/watchlist.dart';
import 'package:equatable/equatable.dart';

class MovieTable extends Equatable {
  final int id;
  final String? title;
  final String? posterPath;
  final String? overview;
  int? isMovie = 1;

  MovieTable(
      {required this.id,
      required this.title,
      required this.posterPath,
      required this.overview,
      this.isMovie});

  factory MovieTable.fromEntity(MovieDetail movie) => MovieTable(
      id: movie.id,
      title: movie.title,
      posterPath: movie.posterPath,
      overview: movie.overview,
      isMovie: 1);

  factory MovieTable.fromMap(Map<String, dynamic> map) => MovieTable(
      id: map['id'],
      title: map['title'],
      posterPath: map['posterPath'],
      overview: map['overview'],
      isMovie: 1);

  Map<String, dynamic> toJson() => {
        'id': id,
        'title': title,
        'posterPath': posterPath,
        'overview': overview,
        'isMovie': 1
      };

  Watchlist toEntity() => Watchlist(
        isMovie: 1,
        id: id,
        overview: overview,
        posterPath: posterPath,
        title: title,
      );

  @override
  List<Object?> get props => [id, title, posterPath, overview, isMovie];
}
