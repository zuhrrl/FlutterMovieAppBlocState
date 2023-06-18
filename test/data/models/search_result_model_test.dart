import 'package:ditonton/data/models/search_result_model.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  var fakeResponse = {
    "adult": false,
    "backdrop_path": "/a6ptrTUH1c5OdWanjyYtAkOuYD0.jpg",
    "genre_ids": [10759, 35, 16],
    "id": 37854,
    "origin_country": ["JP"],
    "original_language": "ja",
    "original_name": "ワンピース",
    "overview":
        "Years ago, the fearsome Pirate King, Gol D. Roger was executed leaving a huge pile of treasure and the famous \"One Piece\" behind. Whoever claims the \"One Piece\" will be named the new King of the Pirates.\n\nMonkey D. Luffy, a boy who consumed a \"Devil Fruit,\" decides to follow in the footsteps of his idol, the pirate Shanks, and find the One Piece. It helps, of course, that his body has the properties of rubber and that he's surrounded by a bevy of skilled fighters and thieves to help him along the way.\n\nLuffy will do anything to get the One Piece and become King of the Pirates!",
    "popularity": 104.045,
    "poster_path": "/dum1wnm6kJOUos0XJqjB8s2UWi9.jpg",
    "first_air_date": "1999-10-20",
    "name": "One Piece",
    "vote_average": 8.7,
    "vote_count": 3773,
    "release_date": 'test'
  };

  final tSearchResultModel = SearchResultModel(
      adult: false,
      backdropPath: "/a6ptrTUH1c5OdWanjyYtAkOuYD0.jpg",
      genreIds: [10759, 35, 16],
      id: 37854,
      overview:
          "Years ago, the fearsome Pirate King, Gol D. Roger was executed leaving a huge pile of treasure and the famous \"One Piece\" behind. Whoever claims the \"One Piece\" will be named the new King of the Pirates.\n\nMonkey D. Luffy, a boy who consumed a \"Devil Fruit,\" decides to follow in the footsteps of his idol, the pirate Shanks, and find the One Piece. It helps, of course, that his body has the properties of rubber and that he's surrounded by a bevy of skilled fighters and thieves to help him along the way.\n\nLuffy will do anything to get the One Piece and become King of the Pirates!",
      popularity: 104.045,
      posterPath: "/dum1wnm6kJOUos0XJqjB8s2UWi9.jpg",
      title: "ワンピース",
      voteAverage: 8.7,
      releaseDate: 'test',
      voteCount: 3773);

  group('fromJson', () {
    test('should return a valid model from JSON', () async {
      // arrange
      final Map<String, dynamic> jsonMap = fakeResponse;
      // act
      final result = SearchResultModel.fromJson(jsonMap);
      // assert
      expect(result.title, tSearchResultModel.title);
      expect(result.overview, result.overview);
    });
  });

  group('toJson', () {
    test('should return a JSON map containing proper data', () async {
      // arrange

      // act
      final result = tSearchResultModel.toJson();
      // assert
      final expectedJsonMap = {
        "adult": false,
        "backdrop_path": "/a6ptrTUH1c5OdWanjyYtAkOuYD0.jpg",
        "genre_ids": [10759, 35, 16],
        "id": 37854,
        "overview":
            "Years ago, the fearsome Pirate King, Gol D. Roger was executed leaving a huge pile of treasure and the famous \"One Piece\" behind. Whoever claims the \"One Piece\" will be named the new King of the Pirates.\n\nMonkey D. Luffy, a boy who consumed a \"Devil Fruit,\" decides to follow in the footsteps of his idol, the pirate Shanks, and find the One Piece. It helps, of course, that his body has the properties of rubber and that he's surrounded by a bevy of skilled fighters and thieves to help him along the way.\n\nLuffy will do anything to get the One Piece and become King of the Pirates!",
        "popularity": 104.045,
        "poster_path": "/dum1wnm6kJOUos0XJqjB8s2UWi9.jpg",
        "title": "ワンピース",
        "vote_average": 8.7,
        "vote_count": 3773,
        "release_date": 'test'
      };
      expect(result, expectedJsonMap);
    });
  });
}
