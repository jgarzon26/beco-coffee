import 'package:beco_coffee/home/model/search_model.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'search_notifier.g.dart';

@riverpod
class SearchNotifier extends _$SearchNotifier {
  @override
  SearchModel build() {
    return const SearchModel(
      query: '',
      isSearching: false,
      filterSearchType: FilterSearchType.none,
    );
  }

  void setSearchState(bool isSearching) {
    state = state.copyWith(
      isSearching: isSearching,
    );
  }

  void setQuery(String query) {
    state = state.copyWith(
      query: query,
    );
  }

  void setState(FilterSearchType filterSearchType) {
    state = state.copyWith(
      filterSearchType: filterSearchType,
    );
  }
}
