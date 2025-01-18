import 'package:freezed_annotation/freezed_annotation.dart';

part 'search_model.freezed.dart';

enum FilterSearchType {
  none,
  bestSell,
  rating,
  discount,
  aZ,
  zA,
}

@freezed
class SearchModel with _$SearchModel {
  const factory SearchModel({
    required String query,
    required bool isSearching,
    required FilterSearchType filterSearchType,
  }) = _SearchModel;
}
