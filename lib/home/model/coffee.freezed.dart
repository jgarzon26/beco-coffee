// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'coffee.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Coffee _$CoffeeFromJson(Map<String, dynamic> json) {
  return _Coffee.fromJson(json);
}

/// @nodoc
mixin _$Coffee {
  String get coffee_id => throw _privateConstructorUsedError;
  Category get category => throw _privateConstructorUsedError;
  Company get company => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  String get image_src => throw _privateConstructorUsedError;
  double get price => throw _privateConstructorUsedError;
  double? get discount_price => throw _privateConstructorUsedError;
  double get rating => throw _privateConstructorUsedError;
  int get number_of_ratings => throw _privateConstructorUsedError;

  /// Serializes this Coffee to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Coffee
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CoffeeCopyWith<Coffee> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CoffeeCopyWith<$Res> {
  factory $CoffeeCopyWith(Coffee value, $Res Function(Coffee) then) =
      _$CoffeeCopyWithImpl<$Res, Coffee>;
  @useResult
  $Res call(
      {String coffee_id,
      Category category,
      Company company,
      String name,
      String description,
      String image_src,
      double price,
      double? discount_price,
      double rating,
      int number_of_ratings});

  $CategoryCopyWith<$Res> get category;
  $CompanyCopyWith<$Res> get company;
}

/// @nodoc
class _$CoffeeCopyWithImpl<$Res, $Val extends Coffee>
    implements $CoffeeCopyWith<$Res> {
  _$CoffeeCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Coffee
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? coffee_id = null,
    Object? category = null,
    Object? company = null,
    Object? name = null,
    Object? description = null,
    Object? image_src = null,
    Object? price = null,
    Object? discount_price = freezed,
    Object? rating = null,
    Object? number_of_ratings = null,
  }) {
    return _then(_value.copyWith(
      coffee_id: null == coffee_id
          ? _value.coffee_id
          : coffee_id // ignore: cast_nullable_to_non_nullable
              as String,
      category: null == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as Category,
      company: null == company
          ? _value.company
          : company // ignore: cast_nullable_to_non_nullable
              as Company,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      image_src: null == image_src
          ? _value.image_src
          : image_src // ignore: cast_nullable_to_non_nullable
              as String,
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as double,
      discount_price: freezed == discount_price
          ? _value.discount_price
          : discount_price // ignore: cast_nullable_to_non_nullable
              as double?,
      rating: null == rating
          ? _value.rating
          : rating // ignore: cast_nullable_to_non_nullable
              as double,
      number_of_ratings: null == number_of_ratings
          ? _value.number_of_ratings
          : number_of_ratings // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }

  /// Create a copy of Coffee
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $CategoryCopyWith<$Res> get category {
    return $CategoryCopyWith<$Res>(_value.category, (value) {
      return _then(_value.copyWith(category: value) as $Val);
    });
  }

  /// Create a copy of Coffee
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $CompanyCopyWith<$Res> get company {
    return $CompanyCopyWith<$Res>(_value.company, (value) {
      return _then(_value.copyWith(company: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$CoffeeImplCopyWith<$Res> implements $CoffeeCopyWith<$Res> {
  factory _$$CoffeeImplCopyWith(
          _$CoffeeImpl value, $Res Function(_$CoffeeImpl) then) =
      __$$CoffeeImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String coffee_id,
      Category category,
      Company company,
      String name,
      String description,
      String image_src,
      double price,
      double? discount_price,
      double rating,
      int number_of_ratings});

  @override
  $CategoryCopyWith<$Res> get category;
  @override
  $CompanyCopyWith<$Res> get company;
}

/// @nodoc
class __$$CoffeeImplCopyWithImpl<$Res>
    extends _$CoffeeCopyWithImpl<$Res, _$CoffeeImpl>
    implements _$$CoffeeImplCopyWith<$Res> {
  __$$CoffeeImplCopyWithImpl(
      _$CoffeeImpl _value, $Res Function(_$CoffeeImpl) _then)
      : super(_value, _then);

  /// Create a copy of Coffee
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? coffee_id = null,
    Object? category = null,
    Object? company = null,
    Object? name = null,
    Object? description = null,
    Object? image_src = null,
    Object? price = null,
    Object? discount_price = freezed,
    Object? rating = null,
    Object? number_of_ratings = null,
  }) {
    return _then(_$CoffeeImpl(
      coffee_id: null == coffee_id
          ? _value.coffee_id
          : coffee_id // ignore: cast_nullable_to_non_nullable
              as String,
      category: null == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as Category,
      company: null == company
          ? _value.company
          : company // ignore: cast_nullable_to_non_nullable
              as Company,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      image_src: null == image_src
          ? _value.image_src
          : image_src // ignore: cast_nullable_to_non_nullable
              as String,
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as double,
      discount_price: freezed == discount_price
          ? _value.discount_price
          : discount_price // ignore: cast_nullable_to_non_nullable
              as double?,
      rating: null == rating
          ? _value.rating
          : rating // ignore: cast_nullable_to_non_nullable
              as double,
      number_of_ratings: null == number_of_ratings
          ? _value.number_of_ratings
          : number_of_ratings // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CoffeeImpl implements _Coffee {
  const _$CoffeeImpl(
      {required this.coffee_id,
      required this.category,
      required this.company,
      required this.name,
      required this.description,
      required this.image_src,
      required this.price,
      this.discount_price,
      required this.rating,
      required this.number_of_ratings});

  factory _$CoffeeImpl.fromJson(Map<String, dynamic> json) =>
      _$$CoffeeImplFromJson(json);

  @override
  final String coffee_id;
  @override
  final Category category;
  @override
  final Company company;
  @override
  final String name;
  @override
  final String description;
  @override
  final String image_src;
  @override
  final double price;
  @override
  final double? discount_price;
  @override
  final double rating;
  @override
  final int number_of_ratings;

  @override
  String toString() {
    return 'Coffee(coffee_id: $coffee_id, category: $category, company: $company, name: $name, description: $description, image_src: $image_src, price: $price, discount_price: $discount_price, rating: $rating, number_of_ratings: $number_of_ratings)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CoffeeImpl &&
            (identical(other.coffee_id, coffee_id) ||
                other.coffee_id == coffee_id) &&
            (identical(other.category, category) ||
                other.category == category) &&
            (identical(other.company, company) || other.company == company) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.image_src, image_src) ||
                other.image_src == image_src) &&
            (identical(other.price, price) || other.price == price) &&
            (identical(other.discount_price, discount_price) ||
                other.discount_price == discount_price) &&
            (identical(other.rating, rating) || other.rating == rating) &&
            (identical(other.number_of_ratings, number_of_ratings) ||
                other.number_of_ratings == number_of_ratings));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      coffee_id,
      category,
      company,
      name,
      description,
      image_src,
      price,
      discount_price,
      rating,
      number_of_ratings);

  /// Create a copy of Coffee
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CoffeeImplCopyWith<_$CoffeeImpl> get copyWith =>
      __$$CoffeeImplCopyWithImpl<_$CoffeeImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CoffeeImplToJson(
      this,
    );
  }
}

abstract class _Coffee implements Coffee {
  const factory _Coffee(
      {required final String coffee_id,
      required final Category category,
      required final Company company,
      required final String name,
      required final String description,
      required final String image_src,
      required final double price,
      final double? discount_price,
      required final double rating,
      required final int number_of_ratings}) = _$CoffeeImpl;

  factory _Coffee.fromJson(Map<String, dynamic> json) = _$CoffeeImpl.fromJson;

  @override
  String get coffee_id;
  @override
  Category get category;
  @override
  Company get company;
  @override
  String get name;
  @override
  String get description;
  @override
  String get image_src;
  @override
  double get price;
  @override
  double? get discount_price;
  @override
  double get rating;
  @override
  int get number_of_ratings;

  /// Create a copy of Coffee
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CoffeeImplCopyWith<_$CoffeeImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
