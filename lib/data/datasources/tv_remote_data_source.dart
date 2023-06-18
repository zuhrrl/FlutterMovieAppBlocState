import 'dart:convert';

import 'package:ditonton/common/exception.dart';
import 'package:ditonton/data/models/search_result_model.dart';
import 'package:ditonton/data/models/tv_detail_model.dart';
import 'package:ditonton/data/models/tv_model.dart';
import 'package:ditonton/data/models/tv_response.dart';
import 'package:ditonton/utils/client_helper.dart';
// import 'package:http/http.dart' as http;

abstract class TvRemoteDataSource {
  Future<List<TvModel>> getNowAiringTvs();
  Future<List<TvModel>> getPopularTvs();
  Future<List<TvModel>> getTopRatedTvs();
  Future<TvDetailResponse> getTvDetail(int id);
  Future<List<TvModel>> getTvRecommendations(int id);
  Future<List<SearchResultModel>> searchTvs(String query);
}

class TvRemoteDataSourceImpl implements TvRemoteDataSource {
  static const API_KEY = 'api_key=2174d146bb9c0eab47529b2e77d6b526';
  static const BASE_URL = 'https://api.themoviedb.org/3';

  final ClientHelper client;

  TvRemoteDataSourceImpl({required this.client});

  @override
  Future<List<TvModel>> getNowAiringTvs() async {
    final response =
        await client.get(Uri.parse('$BASE_URL/tv/airing_today?$API_KEY'));

    if (response.statusCode == 200) {
      return TvResponse.fromJson(json.decode(response.body)).tvList;
    } else {
      throw ServerException();
    }
  }

  @override
  Future<TvDetailResponse> getTvDetail(int id) async {
    final response = await client.get(Uri.parse('$BASE_URL/tv/$id?$API_KEY'));

    if (response.statusCode == 200) {
      return TvDetailResponse.fromJson(json.decode(response.body));
    } else {
      throw ServerException();
    }
  }

  @override
  Future<List<TvModel>> getTvRecommendations(int id) async {
    final response = await client
        .get(Uri.parse('$BASE_URL/tv/$id/recommendations?$API_KEY'));

    if (response.statusCode == 200) {
      return TvResponse.fromJson(json.decode(response.body)).tvList;
    } else {
      throw ServerException();
    }
  }

  @override
  Future<List<TvModel>> getPopularTvs() async {
    final response =
        await client.get(Uri.parse('$BASE_URL/tv/popular?$API_KEY'));

    if (response.statusCode == 200) {
      return TvResponse.fromJson(json.decode(response.body)).tvList;
    } else {
      throw ServerException();
    }
  }

  @override
  Future<List<TvModel>> getTopRatedTvs() async {
    final response =
        await client.get(Uri.parse('$BASE_URL/tv/top_rated?$API_KEY'));

    if (response.statusCode == 200) {
      return TvResponse.fromJson(json.decode(response.body)).tvList;
    } else {
      throw ServerException();
    }
  }

  @override
  Future<List<SearchResultModel>> searchTvs(String query) async {
    List<SearchResultModel> resultSearch = [];

    final response = await client
        .get(Uri.parse('$BASE_URL/search/tv?$API_KEY&query=$query'));

    if (response.statusCode == 200) {
      var resp = TvResponse.fromJson(json.decode(response.body)).tvList;
      resp.forEach((element) {
        resultSearch.add(SearchResultModel(
            backdropPath: element.backdropPath,
            genreIds: element.genreIds,
            id: element.id,
            overview: element.overview,
            popularity: element.popularity,
            posterPath: element.posterPath,
            releaseDate: element.releaseDate,
            voteAverage: element.voteAverage,
            voteCount: element.voteCount,
            title: element.title));
      });
      return resultSearch;
    } else {
      throw ServerException();
    }
  }
}
