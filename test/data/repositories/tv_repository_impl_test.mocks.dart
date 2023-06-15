// Mocks generated by Mockito 5.4.1 from annotations
// in ditonton/test/data/repositories/tv_repository_impl_test.dart.
// Do not manually edit this file.

// @dart=2.19

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i4;

import 'package:ditonton/data/datasources/tv_local_data_source.dart' as _i7;
import 'package:ditonton/data/datasources/tv_remote_data_source.dart' as _i3;
import 'package:ditonton/data/models/search_result_model.dart' as _i6;
import 'package:ditonton/data/models/tv_detail_model.dart' as _i2;
import 'package:ditonton/data/models/tv_model.dart' as _i5;
import 'package:ditonton/data/models/tv_table.dart' as _i8;
import 'package:mockito/mockito.dart' as _i1;

// ignore_for_file: type=lint
// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types
// ignore_for_file: subtype_of_sealed_class

class _FakeTvDetailResponse_0 extends _i1.SmartFake
    implements _i2.TvDetailResponse {
  _FakeTvDetailResponse_0(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

/// A class which mocks [TvRemoteDataSource].
///
/// See the documentation for Mockito's code generation for more information.
class MockTvRemoteDataSource extends _i1.Mock
    implements _i3.TvRemoteDataSource {
  MockTvRemoteDataSource() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i4.Future<List<_i5.TvModel>> getNowAiringTvs() => (super.noSuchMethod(
        Invocation.method(
          #getNowAiringTvs,
          [],
        ),
        returnValue: _i4.Future<List<_i5.TvModel>>.value(<_i5.TvModel>[]),
      ) as _i4.Future<List<_i5.TvModel>>);
  @override
  _i4.Future<List<_i5.TvModel>> getPopularTvs() => (super.noSuchMethod(
        Invocation.method(
          #getPopularTvs,
          [],
        ),
        returnValue: _i4.Future<List<_i5.TvModel>>.value(<_i5.TvModel>[]),
      ) as _i4.Future<List<_i5.TvModel>>);
  @override
  _i4.Future<List<_i5.TvModel>> getTopRatedTvs() => (super.noSuchMethod(
        Invocation.method(
          #getTopRatedTvs,
          [],
        ),
        returnValue: _i4.Future<List<_i5.TvModel>>.value(<_i5.TvModel>[]),
      ) as _i4.Future<List<_i5.TvModel>>);
  @override
  _i4.Future<_i2.TvDetailResponse> getTvDetail(int? id) => (super.noSuchMethod(
        Invocation.method(
          #getTvDetail,
          [id],
        ),
        returnValue:
            _i4.Future<_i2.TvDetailResponse>.value(_FakeTvDetailResponse_0(
          this,
          Invocation.method(
            #getTvDetail,
            [id],
          ),
        )),
      ) as _i4.Future<_i2.TvDetailResponse>);
  @override
  _i4.Future<List<_i5.TvModel>> getTvRecommendations(int? id) =>
      (super.noSuchMethod(
        Invocation.method(
          #getTvRecommendations,
          [id],
        ),
        returnValue: _i4.Future<List<_i5.TvModel>>.value(<_i5.TvModel>[]),
      ) as _i4.Future<List<_i5.TvModel>>);
  @override
  _i4.Future<List<_i6.SearchResultModel>> searchTvs(String? query) =>
      (super.noSuchMethod(
        Invocation.method(
          #searchTvs,
          [query],
        ),
        returnValue: _i4.Future<List<_i6.SearchResultModel>>.value(
            <_i6.SearchResultModel>[]),
      ) as _i4.Future<List<_i6.SearchResultModel>>);
}

/// A class which mocks [TvLocalDataSource].
///
/// See the documentation for Mockito's code generation for more information.
class MockTvLocalDataSource extends _i1.Mock implements _i7.TvLocalDataSource {
  MockTvLocalDataSource() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i4.Future<String> insertWatchlist(
    dynamic item,
    String? type,
  ) =>
      (super.noSuchMethod(
        Invocation.method(
          #insertWatchlist,
          [
            item,
            type,
          ],
        ),
        returnValue: _i4.Future<String>.value(''),
      ) as _i4.Future<String>);
  @override
  _i4.Future<String> removeWatchlist(_i8.TvTable? tv) => (super.noSuchMethod(
        Invocation.method(
          #removeWatchlist,
          [tv],
        ),
        returnValue: _i4.Future<String>.value(''),
      ) as _i4.Future<String>);
  @override
  _i4.Future<_i8.TvTable?> getTvById(int? id) => (super.noSuchMethod(
        Invocation.method(
          #getTvById,
          [id],
        ),
        returnValue: _i4.Future<_i8.TvTable?>.value(),
      ) as _i4.Future<_i8.TvTable?>);
  @override
  _i4.Future<List<_i8.TvTable>> getWatchlistTvs() => (super.noSuchMethod(
        Invocation.method(
          #getWatchlistTvs,
          [],
        ),
        returnValue: _i4.Future<List<_i8.TvTable>>.value(<_i8.TvTable>[]),
      ) as _i4.Future<List<_i8.TvTable>>);
}