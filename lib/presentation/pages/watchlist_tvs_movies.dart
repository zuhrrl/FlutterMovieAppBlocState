import 'dart:convert';

import 'package:ditonton/common/state_enum.dart';
import 'package:ditonton/common/utils.dart';
import 'package:ditonton/presentation/bloc/watchlist_bloc.dart';
import 'package:ditonton/presentation/widgets/watchlist_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:logger/logger.dart';
import 'package:provider/provider.dart';

class WatchListTvsMovies extends StatefulWidget {
  static const ROUTE_NAME = '/watchlist-movie';

  @override
  _WatchListTvsMoviesState createState() => _WatchListTvsMoviesState();
}

class _WatchListTvsMoviesState extends State<WatchListTvsMovies>
    with RouteAware {
  @override
  void initState() {
    super.initState();
    Future.microtask(
        () => context.read<WatchlistBloc>().add(onFetchWatchList()));
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    routeObserver.subscribe(this, ModalRoute.of(context)!);
  }

  void didPopNext() {
    context.read<WatchlistBloc>().add(onFetchWatchList());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Watchlist'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: BlocBuilder<WatchlistBloc, WatchlistState>(
          builder: (context, state) {
            if (state is WatchlistLoading) {
              return Center(
                child: CircularProgressIndicator(),
              );
            }

            if (state is WatchlistHasData) {
              return ListView.builder(
                itemBuilder: (context, index) {
                  final watchList = state.watchList[index];
                  Logger().d(watchList);
                  return WatchlistCard(watchList);
                },
                itemCount: state.watchList.length,
              );
            }

            if (state is WatchlistError) {
              return Center(
                child: Text(state.message),
              );
            } else {
              return Center(
                key: Key('error_message'),
                child: Text('Failed load'),
              );
            }
          },
        ),
      ),
    );
  }

  @override
  void dispose() {
    routeObserver.unsubscribe(this);
    super.dispose();
  }
}
