import 'dart:convert';

import 'package:ditonton/data/models/movie_detail_model.dart';
import 'package:ditonton/data/models/movie_model.dart';
import 'package:ditonton/data/models/movie_response.dart';
import 'package:ditonton/common/exception.dart';
import 'package:ditonton/data/models/search_result_model.dart';
import 'package:ditonton/utils/client_helper.dart';
import 'package:http/http.dart' as http;

abstract class MovieRemoteDataSource {
  Future<List<MovieModel>> getNowPlayingMovies();
  Future<List<MovieModel>> getPopularMovies();
  Future<List<MovieModel>> getTopRatedMovies();
  Future<MovieDetailResponse> getMovieDetail(int id);
  Future<List<MovieModel>> getMovieRecommendations(int id);
  Future<List<SearchResultModel>> searchMovies(String query);
}

class MovieRemoteDataSourceImpl implements MovieRemoteDataSource {
  static const API_KEY = 'api_key=2174d146bb9c0eab47529b2e77d6b526';
  static const BASE_URL = 'https://api.themoviedb.org/3';

  final ClientHelper _clientHelper = ClientHelper();

  @override
  Future<List<MovieModel>> getNowPlayingMovies() async {
    var client = await _clientHelper.getClient();

    final response =
        await client.get(Uri.parse('$BASE_URL/movie/now_playing?$API_KEY'));

    if (response.statusCode == 200) {
      return MovieResponse.fromJson(json.decode(response.body)).movieList;
    } else {
      throw ServerException();
    }
  }

  @override
  Future<MovieDetailResponse> getMovieDetail(int id) async {
    var client = await _clientHelper.getClient();

    final response =
        await client.get(Uri.parse('$BASE_URL/movie/$id?$API_KEY'));

    if (response.statusCode == 200) {
      return MovieDetailResponse.fromJson(json.decode(response.body));
    } else {
      throw ServerException();
    }
  }

  @override
  Future<List<MovieModel>> getMovieRecommendations(int id) async {
    var client = await _clientHelper.getClient();

    final response = await client
        .get(Uri.parse('$BASE_URL/movie/$id/recommendations?$API_KEY'));

    if (response.statusCode == 200) {
      return MovieResponse.fromJson(json.decode(response.body)).movieList;
    } else {
      throw ServerException();
    }
  }

  @override
  Future<List<MovieModel>> getPopularMovies() async {
    var client = await _clientHelper.getClient();

    final response =
        await client.get(Uri.parse('$BASE_URL/movie/popular?$API_KEY'));

    if (response.statusCode == 200) {
      return MovieResponse.fromJson(json.decode(response.body)).movieList;
    } else {
      throw ServerException();
    }
  }

  @override
  Future<List<MovieModel>> getTopRatedMovies() async {
    var client = await _clientHelper.getClient();

    final response =
        await client.get(Uri.parse('$BASE_URL/movie/top_rated?$API_KEY'));

    if (response.statusCode == 200) {
      return MovieResponse.fromJson(json.decode(response.body)).movieList;
    } else {
      throw ServerException();
    }
  }

  @override
  Future<List<SearchResultModel>> searchMovies(String query) async {
    var client = await _clientHelper.getClient();

    final response = await client
        .get(Uri.parse('$BASE_URL/search/movie?$API_KEY&query=$query'));

    if (response.statusCode == 200) {
      var resp = MovieResponse.fromJson(json.decode(response.body)).movieList;
      List<SearchResultModel> resultSearch = [];

      resp.forEach((element) {
        resultSearch.add(SearchResultModel(
            isMovie: true,
            adult: false,
            originalTitle: '',
            video: false,
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
