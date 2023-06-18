import 'dart:convert';

import 'package:ditonton/data/datasources/tv_remote_data_source.dart';
import 'package:ditonton/common/exception.dart';
import 'package:ditonton/data/models/tv_detail_model.dart';
import 'package:ditonton/data/models/tv_response.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:mockito/mockito.dart';

import 'movie_remote_data_source_test.mocks.dart';

void main() {
  const API_KEY = 'api_key=2174d146bb9c0eab47529b2e77d6b526';
  const BASE_URL = 'https://api.themoviedb.org/3';

  late TvRemoteDataSourceImpl dataSource;
  late MockClientHelper mockClientHelper;

  setUp(() {
    mockClientHelper = MockClientHelper();
    dataSource = TvRemoteDataSourceImpl(client: mockClientHelper);
  });

  group('get Now Playing Tvs', () {
    var airingTvResponse = {
      "page": 1,
      "results": [
        {
          "backdrop_path": "/azWBrlovNOOdy0eQYEe9BoiROoN.jpg",
          "first_air_date": "2023-03-20",
          "genre_ids": [18, 10766],
          "id": 209085,
          "name": "Amor Perfeito",
          "origin_country": ["BR"],
          "original_language": "pt",
          "original_name": "Amor Perfeito",
          "overview": "",
          "popularity": 3026.842,
          "poster_path": "/aOPhyvHDauWFuc3rthpHArCNyrm.jpg",
          "vote_average": 4.4,
          "vote_count": 10
        }
      ],
      "total_pages": 12,
      "total_results": 226
    };
    final tTvList = TvResponse.fromJson(airingTvResponse).tvList;

    test('should return list of Tv Model when the response code is 200',
        () async {
      // arrange
      when(mockClientHelper
              .get(Uri.parse('$BASE_URL/tv/airing_today?$API_KEY')))
          .thenAnswer(
              (_) async => http.Response(json.encode(airingTvResponse), 200));
      // act
      final result = await dataSource.getNowAiringTvs();
      // assert
      expect(result, equals(tTvList));
    });

    test(
        'should throw a ServerException when the response code is 404 or other',
        () async {
      // arrange
      when(mockClientHelper
              .get(Uri.parse('$BASE_URL/tv/airing_today?$API_KEY')))
          .thenAnswer((_) async => http.Response('Not Found', 404));
      // act
      final call = dataSource.getNowAiringTvs();
      // assert
      expect(() => call, throwsA(isA<ServerException>()));
    });
  });

  group('get Popular Tvs', () {
    var popularTvsResponse = {
      "page": 1,
      "results": [
        {
          "backdrop_path": "/azWBrlovNOOdy0eQYEe9BoiROoN.jpg",
          "first_air_date": "2023-03-20",
          "genre_ids": [18, 10766],
          "id": 209085,
          "name": "Amor Perfeito",
          "origin_country": ["BR"],
          "original_language": "pt",
          "original_name": "Amor Perfeito",
          "overview": "",
          "popularity": 3026.842,
          "poster_path": "/aOPhyvHDauWFuc3rthpHArCNyrm.jpg",
          "vote_average": 4.4,
          "vote_count": 10
        },
      ],
      "total_pages": 7521,
      "total_results": 150413
    };
    final tTvList = TvResponse.fromJson(popularTvsResponse).tvList;

    test('should return list of tvs when response is success (200)', () async {
      // arrange
      when(mockClientHelper.get(Uri.parse('$BASE_URL/tv/popular?$API_KEY')))
          .thenAnswer(
              (_) async => http.Response(json.encode(popularTvsResponse), 200));
      // act
      final result = await dataSource.getPopularTvs();
      // assert
      expect(result, tTvList);
    });

    test(
        'should throw a ServerException when the response code is 404 or other',
        () async {
      // arrange
      when(mockClientHelper.get(Uri.parse('$BASE_URL/tv/popular?$API_KEY')))
          .thenAnswer((_) async => http.Response('Not Found', 404));
      // act
      final call = dataSource.getPopularTvs();
      // assert
      expect(() => call, throwsA(isA<ServerException>()));
    });
  });

  group('get Top Rated Tvs', () {
    var topRatedResponse = {
      "page": 1,
      "results": [
        {
          "backdrop_path": "/84XPpjGvxNyExjSuLQe0SzioErt.jpg",
          "first_air_date": "2008-01-20",
          "genre_ids": [18, 80],
          "id": 1396,
          "name": "Breaking Bad",
          "origin_country": ["US"],
          "original_language": "en",
          "original_name": "Breaking Bad",
          "overview":
              "When Walter White, a New Mexico chemistry teacher, is diagnosed with Stage III cancer and given a prognosis of only two years left to live. He becomes filled with a sense of fearlessness and an unrelenting desire to secure his family's financial future at any cost as he enters the dangerous world of drugs and crime.",
          "popularity": 212.604,
          "poster_path": "/ggFHVNu6YYI5L9pCfOacjizRGt.jpg",
          "vote_average": 8.9,
          "vote_count": 11783
        }
      ],
      "total_pages": 144,
      "total_results": 2880
    };
    final tTvList = TvResponse.fromJson(topRatedResponse).tvList;

    test('should return list of tvs when response code is 200 ', () async {
      // arrange
      when(mockClientHelper.get(Uri.parse('$BASE_URL/tv/top_rated?$API_KEY')))
          .thenAnswer(
              (_) async => http.Response(json.encode(topRatedResponse), 200));
      // act
      final result = await dataSource.getTopRatedTvs();
      // assert
      expect(result, tTvList);
    });

    test(
        'should throw ServerException when response code top rated is other than 200',
        () async {
      // arrange
      when(mockClientHelper.get(Uri.parse('$BASE_URL/tv/top_rated?$API_KEY')))
          .thenAnswer((_) async => http.Response('Not Found', 404));
      // act
      final call = dataSource.getTopRatedTvs();
      // assert
      expect(() => call, throwsA(isA<ServerException>()));
    });
  });

  group('get tv detail', () {
    final tId = 1;
    var detailTvResponse = {
      "adult": false,
      "backdrop_path": "/aWPhMZ0P2DyfWB7k5NXhGHSZHGC.jpg",
      "created_by": [
        {
          "id": 1244781,
          "credit_id": "635517d843cd54007f774b21",
          "name": "Walcyr Carrasco",
          "gender": 2,
          "profile_path": "/uQq1U3PSssPsWkIahtlimxmpetZ.jpg"
        }
      ],
      "episode_run_time": [],
      "first_air_date": "2023-05-08",
      "genres": [
        {"id": 18, "name": "Drama"},
        {"id": 80, "name": "Crime"},
        {"id": 10766, "name": "Soap"}
      ],
      "homepage": "http://gshow.com/terraepaixao",
      "id": 209265,
      "in_production": true,
      "languages": ["pt"],
      "last_air_date": "2023-06-08",
      "last_episode_to_air": {
        "id": 4469673,
        "name": "Episode 28",
        "overview": "",
        "vote_average": 0.0,
        "vote_count": 0,
        "air_date": "2023-06-08",
        "episode_number": 28,
        "production_code": "",
        "runtime": null,
        "season_number": 1,
        "show_id": 209265,
        "still_path": null
      },
      "name": "Terra e Paixão",
      "next_episode_to_air": {
        "id": 4469674,
        "name": "Episode 29",
        "overview": "",
        "vote_average": 0.0,
        "vote_count": 0,
        "air_date": "2023-06-09",
        "episode_number": 29,
        "production_code": "",
        "runtime": null,
        "season_number": 1,
        "show_id": 209265,
        "still_path": null
      },
      "networks": [
        {
          "id": 60,
          "logo_path": "/w5KLywO8bPe98prvv0UewMBAZHO.png",
          "name": "TV Globo",
          "origin_country": "BR"
        }
      ],
      "number_of_episodes": 100,
      "number_of_seasons": 1,
      "origin_country": ["BR"],
      "original_language": "pt",
      "original_name": "Terra e Paixão",
      "overview": "",
      "popularity": 3004.871,
      "poster_path": "/5kCMJ0vVzN9PsoamKctNnUz68Q2.jpg",
      "production_companies": [
        {
          "id": 46430,
          "logo_path": "/aGCY6cOXY488eOpdOnm3ZgBhEly.png",
          "name": "Estúdios Globo",
          "origin_country": "BR"
        }
      ],
      "production_countries": [
        {"iso_3166_1": "BR", "name": "Brazil"}
      ],
      "seasons": [
        {
          "air_date": "2023-05-08",
          "episode_count": 100,
          "id": 306802,
          "name": "Season 1",
          "overview": "",
          "poster_path": "/5kCMJ0vVzN9PsoamKctNnUz68Q2.jpg",
          "season_number": 1
        }
      ],
      "spoken_languages": [
        {"english_name": "Portuguese", "iso_639_1": "pt", "name": "Português"}
      ],
      "status": "Returning Series",
      "tagline": "",
      "type": "Scripted",
      "vote_average": 6.2,
      "vote_count": 9
    };
    final tTvDetail = TvDetailResponse.fromJson(detailTvResponse);

    test('should return tv detail when the response code is 200', () async {
      // arrange
      when(mockClientHelper.get(Uri.parse('$BASE_URL/tv/$tId?$API_KEY')))
          .thenAnswer(
              (_) async => http.Response(json.encode(detailTvResponse), 200));
      // act
      final result = await dataSource.getTvDetail(tId);
      // assert
      expect(result, equals(tTvDetail));
    });

    test('should return server erxception when the response code is not 200',
        () async {
      // arrange
      when(mockClientHelper.get(Uri.parse('$BASE_URL/tv/$tId?$API_KEY')))
          .thenAnswer((_) async => http.Response('notfound', 404));

      // assert
      expect(() async => await dataSource.getTvDetail(tId),
          throwsA(isA<ServerException>()));
    });
  });

  group('get tv recommendations', () {
    var tvRecomendationResponse = {
      "page": 1,
      "results": [
        {
          "adult": false,
          "backdrop_path": "/2Erj4Oav9EHAtqLI354VM7ULDqu.jpg",
          "id": 73586,
          "name": "Yellowstone",
          "original_language": "en",
          "original_name": "Yellowstone",
          "overview": "Follow the violent world of the Dutton family",
          "poster_path": "/peNC0eyc3TQJa6x4TdKcBPNP4t0.jpg",
          "media_type": "tv",
          "genre_ids": [37, 18],
          "popularity": 416.628,
          "first_air_date": "2018-06-20",
          "vote_average": 8.143,
          "vote_count": 1635,
          "origin_country": ["US"]
        },
      ],
      "total_pages": 2,
      "total_results": 40
    };
    final tTvList = TvResponse.fromJson(tvRecomendationResponse).tvList;
    final tId = 1;

    test('should return list of Tv Model when the response code is 200',
        () async {
      // arrange
      when(mockClientHelper
              .get(Uri.parse('$BASE_URL/tv/$tId/recommendations?$API_KEY')))
          .thenAnswer((_) async =>
              http.Response(json.encode(tvRecomendationResponse), 200));
      // act
      final result = await dataSource.getTvRecommendations(tId);
      // assert
      expect(result, equals(tTvList));
    });

    test('should throw Server Exception when the response code is 404 or other',
        () async {
      // arrange
      when(mockClientHelper
              .get(Uri.parse('$BASE_URL/tv/$tId/recommendations?$API_KEY')))
          .thenAnswer((_) async => http.Response('Not Found', 404));
      // act
      final call = dataSource.getTvRecommendations(tId);
      // assert
      expect(() => call, throwsA(isA<ServerException>()));
    });
  });
}
