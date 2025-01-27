// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$OrderImpl _$$OrderImplFromJson(Map<String, dynamic> json) => _$OrderImpl(
      order_id: json['order_id'] as String,
      coffee: Coffee.fromJson(json['coffee'] as Map<String, dynamic>),
      coffee_size: $enumDecode(_$CoffeeSizeEnumMap, json['coffee_size']),
      coffee_sugar: $enumDecode(_$CoffeeSugarEnumMap, json['coffee_sugar']),
      order_date: DateTime.parse(json['order_date'] as String),
      quantity: (json['quantity'] as num?)?.toInt() ?? 1,
    );

Map<String, dynamic> _$$OrderImplToJson(_$OrderImpl instance) =>
    <String, dynamic>{
      'order_id': instance.order_id,
      'coffee': instance.coffee.toJson(),
      'coffee_size': _$CoffeeSizeEnumMap[instance.coffee_size]!,
      'coffee_sugar': _$CoffeeSugarEnumMap[instance.coffee_sugar]!,
      'order_date': instance.order_date.toIso8601String(),
      'quantity': instance.quantity,
    };

const _$CoffeeSizeEnumMap = {
  CoffeeSize.small: 'small',
  CoffeeSize.medium: 'medium',
  CoffeeSize.large: 'large',
};

const _$CoffeeSugarEnumMap = {
  CoffeeSugar.s20: 's20',
  CoffeeSugar.s50: 's50',
  CoffeeSugar.s80: 's80',
  CoffeeSugar.s100: 's100',
};
