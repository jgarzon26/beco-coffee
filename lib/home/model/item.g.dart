// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ItemImpl _$$ItemImplFromJson(Map<String, dynamic> json) => _$ItemImpl(
      item_id: json['item_id'] as String,
      coffee: Coffee.fromJson(json['coffee'] as Map<String, dynamic>),
      coffee_size: $enumDecode(_$CoffeeSizeEnumMap, json['coffee_size']),
      coffee_sugar: $enumDecode(_$CoffeeSugarEnumMap, json['coffee_sugar']),
      quantity: (json['quantity'] as num).toInt(),
    );

Map<String, dynamic> _$$ItemImplToJson(_$ItemImpl instance) =>
    <String, dynamic>{
      'item_id': instance.item_id,
      'coffee': instance.coffee.toJson(),
      'coffee_size': _$CoffeeSizeEnumMap[instance.coffee_size]!,
      'coffee_sugar': _$CoffeeSugarEnumMap[instance.coffee_sugar]!,
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
