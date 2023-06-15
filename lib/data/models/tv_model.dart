import 'package:ditonton/domain/entities/tv.dart';
import 'package:equatable/equatable.dart';

class TvModel extends Equatable {
  TvModel({
    required this.backdropPath,
    required this.genreIds,
    required this.id,
    required this.overview,
    required this.popularity,
    required this.posterPath,
    required this.releaseDate,
    required this.voteAverage,
    required this.voteCount,
    required this.title,
  });

  final String? backdropPath;
  final List<int> genreIds;
  final int id;
  final String overview;
  final double popularity;
  final String? posterPath;
  final String? releaseDate;
  final double voteAverage;
  final int voteCount;
  final String? title;

  factory TvModel.fromJson(Map<String, dynamic> json) => TvModel(
      backdropPath: json["backdrop_path"],
      genreIds: List<int>.from(json["genre_ids"].map((x) => x)),
      id: json["id"],
      overview: json["overview"],
      popularity: json["popularity"].toDouble(),
      posterPath: json["poster_path"],
      releaseDate: json["release_date"],
      voteAverage: json["vote_average"].toDouble(),
      voteCount: json["vote_count"],
      title: json["original_name"]);

  Map<String, dynamic> toJson() => {
        "backdrop_path": backdropPath,
        "genre_ids": List<dynamic>.from(genreIds.map((x) => x)),
        "id": id,
        "overview": overview,
        "popularity": popularity,
        "poster_path": posterPath,
        "release_date": releaseDate,
        "vote_average": voteAverage,
        "vote_count": voteCount,
      };

  Tv toEntity() {
    return Tv(
        backdropPath: this.backdropPath,
        genreIds: this.genreIds,
        id: this.id,
        overview: this.overview,
        popularity: this.popularity,
        posterPath: this.posterPath,
        releaseDate: this.releaseDate,
        voteAverage: this.voteAverage,
        voteCount: this.voteCount,
        title: title);
  }

  @override
  List<Object?> get props => [
        backdropPath,
        genreIds,
        id,
        overview,
        popularity,
        posterPath,
        releaseDate,
        voteAverage,
        voteCount,
      ];
}
