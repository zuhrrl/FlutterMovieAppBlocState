import 'package:ditonton/domain/entities/tv_detail.dart';
import 'package:ditonton/domain/entities/watchlist.dart';
import 'package:equatable/equatable.dart';

class TvTable extends Equatable {
  final int id;
  final String? title;
  final String? posterPath;
  final String? overview;
  int? isMovie = 0;

  TvTable(
      {required this.id,
      required this.title,
      required this.posterPath,
      required this.overview,
      required this.isMovie});

  factory TvTable.fromEntity(TvDetail tv) => TvTable(
      id: tv.id,
      title: tv.title,
      posterPath: tv.posterPath,
      overview: tv.overview,
      isMovie: 0);

  factory TvTable.fromMap(Map<String, dynamic> map) => TvTable(
      id: map['id'],
      title: map['title'],
      posterPath: map['posterPath'],
      overview: map['overview'],
      isMovie: map['isMovie']);

  Map<String, dynamic> toJson() => {
        'id': id,
        'title': title,
        'posterPath': posterPath,
        'overview': overview,
        'isMovie': isMovie
      };

  Watchlist toEntity() => Watchlist(
      id: id,
      overview: overview,
      posterPath: posterPath,
      title: title,
      isMovie: isMovie ?? 0);

  @override
  List<Object?> get props => [id, title, posterPath, overview, isMovie];
}
