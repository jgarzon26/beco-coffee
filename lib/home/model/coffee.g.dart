// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'coffee.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CoffeeImpl _$$CoffeeImplFromJson(Map<String, dynamic> json) => _$CoffeeImpl(
      coffee_id: json['coffee_id'] as String,
      category: Category.fromJson(json['category'] as Map<String, dynamic>),
      company: Company.fromJson(json['company'] as Map<String, dynamic>),
      name: json['name'] as String,
      description: json['description'] as String,
      image_src: json['image_src'] as String,
      price: (json['price'] as num).toDouble(),
      discount_price: (json['discount_price'] as num?)?.toDouble(),
      rating: (json['rating'] as num).toDouble(),
      number_of_ratings: (json['number_of_ratings'] as num).toInt(),
    );

Map<String, dynamic> _$$CoffeeImplToJson(_$CoffeeImpl instance) =>
    <String, dynamic>{
      'coffee_id': instance.coffee_id,
      'category': instance.category,
      'company': instance.company,
      'name': instance.name,
      'description': instance.description,
      'image_src': instance.image_src,
      'price': instance.price,
      'discount_price': instance.discount_price,
      'rating': instance.rating,
      'number_of_ratings': instance.number_of_ratings,
    };
