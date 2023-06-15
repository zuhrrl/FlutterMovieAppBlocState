import 'dart:convert';
import 'dart:math';

import 'package:ditonton/data/datasources/movie_remote_data_source.dart';
import 'package:ditonton/data/models/movie_detail_model.dart';
import 'package:ditonton/data/models/movie_response.dart';
import 'package:ditonton/common/exception.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:mockito/mockito.dart';

import '../../json_reader.dart';
import '../../helpers/test_helper.mocks.dart';

void main() {
  const API_KEY = 'api_key=2174d146bb9c0eab47529b2e77d6b526';
  const BASE_URL = 'https://api.themoviedb.org/3';

  late MovieRemoteDataSourceImpl dataSource;
  late MockHttpClient mockHttpClient;

  WidgetsFlutterBinding.ensureInitialized();

  setUp(() {
    mockHttpClient = MockHttpClient();
    dataSource = MovieRemoteDataSourceImpl();
  });

  group('fromJson', () {
    test('should return a valid model from JSON', () async {
      var fakeResponse = {
        "page": 1,
        "results": [
          {
            "adult": false,
            "backdrop_path": "/iCK2cw43Zb4dppHvufJg0RXaVes.jpg",
            "genre_ids": [28, 12, 35, 14, 16],
            "id": 188070,
            "original_language": "ja",
            "original_title": "ドリコ×ONE PIECE×ドラゴンボールZ 超コラボスペシャル!!",
            "overview":
                "A two-part crossover special featuring characters from Dragon Ball Z, One Piece and Toriko.",
            "popularity": 114.475,
            "poster_path": "/1azUShBxKqHUUJf61BIpnJTtAWO.jpg",
            "release_date": "2013-04-07",
            "title":
                "Dream 9 Toriko & One Piece & Dragon Ball Z Super Collaboration Special!!",
            "video": true,
            "vote_average": 7.412,
            "vote_count": 238
          }
        ]
      };
      // arrange
      final Map<String, dynamic> jsonMap = fakeResponse;
      // act
      final result = MovieResponse.fromJson(jsonMap);
      var item = result.movieList[0];
      // assert
      expect(result.movieList.isNotEmpty, true);
      expect(item.backdropPath, '/iCK2cw43Zb4dppHvufJg0RXaVes.jpg');
    });
  });
}
