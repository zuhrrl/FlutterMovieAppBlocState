// Mocks generated by Mockito 5.4.1 from annotations
// in ditonton/test/domain/usecases/get_watchlist_tv_test.dart.
// Do not manually edit this file.

// @dart=2.19

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i4;

import 'package:dartz/dartz.dart' as _i2;
import 'package:ditonton/common/failure.dart' as _i5;
import 'package:ditonton/domain/entities/search_result.dart' as _i8;
import 'package:ditonton/domain/entities/tv.dart' as _i6;
import 'package:ditonton/domain/entities/tv_detail.dart' as _i7;
import 'package:ditonton/domain/entities/watchlist.dart' as _i9;
import 'package:ditonton/domain/repositories/tv_repository.dart' as _i3;
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

class _FakeEither_0<L, R> extends _i1.SmartFake implements _i2.Either<L, R> {
  _FakeEither_0(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

/// A class which mocks [TvRepository].
///
/// See the documentation for Mockito's code generation for more information.
class MockTvRepository extends _i1.Mock implements _i3.TvRepository {
  MockTvRepository() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i4.Future<_i2.Either<_i5.Failure, List<_i6.Tv>>> getNowAiringTvs() =>
      (super.noSuchMethod(
        Invocation.method(
          #getNowAiringTvs,
          [],
        ),
        returnValue: _i4.Future<_i2.Either<_i5.Failure, List<_i6.Tv>>>.value(
            _FakeEither_0<_i5.Failure, List<_i6.Tv>>(
          this,
          Invocation.method(
            #getNowAiringTvs,
            [],
          ),
        )),
      ) as _i4.Future<_i2.Either<_i5.Failure, List<_i6.Tv>>>);
  @override
  _i4.Future<_i2.Either<_i5.Failure, List<_i6.Tv>>> getPopularTvs() =>
      (super.noSuchMethod(
        Invocation.method(
          #getPopularTvs,
          [],
        ),
        returnValue: _i4.Future<_i2.Either<_i5.Failure, List<_i6.Tv>>>.value(
            _FakeEither_0<_i5.Failure, List<_i6.Tv>>(
          this,
          Invocation.method(
            #getPopularTvs,
            [],
          ),
        )),
      ) as _i4.Future<_i2.Either<_i5.Failure, List<_i6.Tv>>>);
  @override
  _i4.Future<_i2.Either<_i5.Failure, List<_i6.Tv>>> getTopRatedTvs() =>
      (super.noSuchMethod(
        Invocation.method(
          #getTopRatedTvs,
          [],
        ),
        returnValue: _i4.Future<_i2.Either<_i5.Failure, List<_i6.Tv>>>.value(
            _FakeEither_0<_i5.Failure, List<_i6.Tv>>(
          this,
          Invocation.method(
            #getTopRatedTvs,
            [],
          ),
        )),
      ) as _i4.Future<_i2.Either<_i5.Failure, List<_i6.Tv>>>);
  @override
  _i4.Future<_i2.Either<_i5.Failure, _i7.TvDetail>> getTvDetail(int? id) =>
      (super.noSuchMethod(
        Invocation.method(
          #getTvDetail,
          [id],
        ),
        returnValue: _i4.Future<_i2.Either<_i5.Failure, _i7.TvDetail>>.value(
            _FakeEither_0<_i5.Failure, _i7.TvDetail>(
          this,
          Invocation.method(
            #getTvDetail,
            [id],
          ),
        )),
      ) as _i4.Future<_i2.Either<_i5.Failure, _i7.TvDetail>>);
  @override
  _i4.Future<_i2.Either<_i5.Failure, List<_i6.Tv>>> getTvRecommendations(
          int? id) =>
      (super.noSuchMethod(
        Invocation.method(
          #getTvRecommendations,
          [id],
        ),
        returnValue: _i4.Future<_i2.Either<_i5.Failure, List<_i6.Tv>>>.value(
            _FakeEither_0<_i5.Failure, List<_i6.Tv>>(
          this,
          Invocation.method(
            #getTvRecommendations,
            [id],
          ),
        )),
      ) as _i4.Future<_i2.Either<_i5.Failure, List<_i6.Tv>>>);
  @override
  _i4.Future<_i2.Either<_i5.Failure, List<_i8.SearchResult>>> searchTvs(
          String? query) =>
      (super.noSuchMethod(
        Invocation.method(
          #searchTvs,
          [query],
        ),
        returnValue:
            _i4.Future<_i2.Either<_i5.Failure, List<_i8.SearchResult>>>.value(
                _FakeEither_0<_i5.Failure, List<_i8.SearchResult>>(
          this,
          Invocation.method(
            #searchTvs,
            [query],
          ),
        )),
      ) as _i4.Future<_i2.Either<_i5.Failure, List<_i8.SearchResult>>>);
  @override
  _i4.Future<_i2.Either<_i5.Failure, String>> saveWatchlist(dynamic dynamic) =>
      (super.noSuchMethod(
        Invocation.method(
          #saveWatchlist,
          [dynamic],
        ),
        returnValue: _i4.Future<_i2.Either<_i5.Failure, String>>.value(
            _FakeEither_0<_i5.Failure, String>(
          this,
          Invocation.method(
            #saveWatchlist,
            [dynamic],
          ),
        )),
      ) as _i4.Future<_i2.Either<_i5.Failure, String>>);
  @override
  _i4.Future<_i2.Either<_i5.Failure, String>> removeWatchlist(
          _i7.TvDetail? Tv) =>
      (super.noSuchMethod(
        Invocation.method(
          #removeWatchlist,
          [Tv],
        ),
        returnValue: _i4.Future<_i2.Either<_i5.Failure, String>>.value(
            _FakeEither_0<_i5.Failure, String>(
          this,
          Invocation.method(
            #removeWatchlist,
            [Tv],
          ),
        )),
      ) as _i4.Future<_i2.Either<_i5.Failure, String>>);
  @override
  _i4.Future<bool> isAddedToWatchlist(int? id) => (super.noSuchMethod(
        Invocation.method(
          #isAddedToWatchlist,
          [id],
        ),
        returnValue: _i4.Future<bool>.value(false),
      ) as _i4.Future<bool>);
  @override
  _i4.Future<_i2.Either<_i5.Failure, List<_i9.Watchlist>>> getWatchlist() =>
      (super.noSuchMethod(
        Invocation.method(
          #getWatchlist,
          [],
        ),
        returnValue:
            _i4.Future<_i2.Either<_i5.Failure, List<_i9.Watchlist>>>.value(
                _FakeEither_0<_i5.Failure, List<_i9.Watchlist>>(
          this,
          Invocation.method(
            #getWatchlist,
            [],
          ),
        )),
      ) as _i4.Future<_i2.Either<_i5.Failure, List<_i9.Watchlist>>>);
}
