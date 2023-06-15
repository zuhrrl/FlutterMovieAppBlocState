import 'package:ditonton/common/constants.dart';
import 'package:ditonton/presentation/bloc/category_bloc.dart';
import 'package:ditonton/presentation/bloc/search_page_bloc.dart';
import 'package:ditonton/presentation/widgets/search_result_card.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:logger/logger.dart';

class SearchPage extends StatelessWidget {
  static const ROUTE_NAME = '/search';
  String _searchType = 'movies';
  String _query = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Search'),
      ),
      body: BlocBuilder<SearchPageBloc, SearchPageState>(
        builder: (context, state) {
          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextField(
                  key: Key('search_input'),
                  onChanged: (query) {
                    _query = query;
                    context
                        .read<SearchPageBloc>()
                        .add(OnQueryChanged(_searchType, query));
                  },
                  onSubmitted: (query) {
                    debugPrint('onsubmit disini');

                    context
                        .read<SearchPageBloc>()
                        .add(OnQueryChanged(_searchType, query));
                  },
                  decoration: InputDecoration(
                    hintText: 'Search title',
                    prefixIcon: Icon(Icons.search),
                    border: OutlineInputBorder(),
                  ),
                  textInputAction: TextInputAction.search,
                ),
                SizedBox(
                  height: 10,
                ),
                BlocBuilder<CategoryBloc, CategoryState>(
                  builder: (context, categoryState) {
                    if (categoryState is SelectedCategory) {
                      return Row(
                        children: [
                          ButtonCategorySearch(
                            key: Key('movies'),
                            isTicked: categoryState.category == 'movies'
                                ? true
                                : false,
                            textButton: 'Movies',
                            onTap: () {
                              _searchType = 'movies';
                              context
                                  .read<CategoryBloc>()
                                  .add(onCategoryChanged('movies'));
                              context
                                  .read<SearchPageBloc>()
                                  .add(OnQueryChanged(_searchType, _query));
                            },
                          ),
                          SizedBox(
                            width: 15,
                          ),
                          ButtonCategorySearch(
                            key: Key('tvs'),
                            isTicked:
                                categoryState.category == 'tvs' ? true : false,
                            textButton: 'TV',
                            onTap: () {
                              _searchType = 'tvs';

                              context
                                  .read<CategoryBloc>()
                                  .add(onCategoryChanged('tvs'));
                              context
                                  .read<SearchPageBloc>()
                                  .add(OnQueryChanged(_searchType, _query));
                            },
                          )
                        ],
                      );
                    }

                    return Row(
                      children: [
                        ButtonCategorySearch(
                          key: Key('movies'),
                          isTicked: true,
                          textButton: 'Movies',
                          onTap: () {
                            _searchType = 'movies';

                            context
                                .read<CategoryBloc>()
                                .add(onCategoryChanged('movies'));
                            context
                                .read<SearchPageBloc>()
                                .add(OnQueryChanged(_searchType, _query));
                          },
                        ),
                        SizedBox(
                          width: 15,
                        ),
                        ButtonCategorySearch(
                          key: Key('tvs'),
                          isTicked: false,
                          textButton: 'TV',
                          onTap: () {
                            _searchType = 'tvs';
                            context
                                .read<CategoryBloc>()
                                .add(onCategoryChanged('tvs'));
                            context
                                .read<SearchPageBloc>()
                                .add(OnQueryChanged(_searchType, _query));
                          },
                        )
                      ],
                    );
                  },
                ),
                SizedBox(height: 16),
                Text(
                  'Search Result',
                  style: kHeading6,
                ),
                if (state is SearchLoading) ...[
                  Center(
                    child: CircularProgressIndicator(),
                  )
                ],
                if (state is SearchHasData) ...[
                  Expanded(
                    child: ListView.builder(
                      padding: const EdgeInsets.all(8),
                      itemBuilder: (context, index) {
                        final result = state.result[index];

                        Logger().d(result);
                        return SearchResultCard(result);
                      },
                      itemCount: state.result.length,
                    ),
                  )
                ]
              ],
            ),
          );
        },
      ),
    );
  }
}

class ButtonCategorySearch extends StatelessWidget {
  final bool isTicked;
  final String textButton;
  final Function() onTap;
  const ButtonCategorySearch(
      {super.key,
      required this.isTicked,
      required this.textButton,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    if (isTicked) {
      return ElevatedButton(
        onPressed: () {},
        child: Text(
          textButton,
          style: TextStyle(color: Colors.black),
        ),
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.yellow,
          side: const BorderSide(
              width: 2, // the thickness
              color: Colors.yellow // the color of the border
              ),
        ),
      );
    }
    return ElevatedButton(
      onPressed: onTap,
      child: Text(
        textButton,
        style: TextStyle(color: Colors.white),
      ),
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.transparent,
        side: const BorderSide(
            width: 2, // the thickness
            color: Colors.yellow // the color of the border
            ),
      ),
    );
  }
}
