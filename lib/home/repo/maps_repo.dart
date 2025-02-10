import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

class MapsRepo {
  final _mapAndroidApi = 'AIzaSyDo48gQJucGYsTlfLPtthm9Xeynq5N2gks';
}

@riverpod
MapsRepo mapsRepo(Ref ref) {
  return MapsRepo();
}
