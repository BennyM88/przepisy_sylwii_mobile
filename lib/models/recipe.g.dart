// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'recipe.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Recipe _$$_RecipeFromJson(Map<String, dynamic> json) => _$_Recipe(
      dishName: json['dishName'] as String,
      url: json['url'] as String? ?? '',
      category: json['category'] as String? ?? '',
      amount: json['amount'] as int? ?? 0,
      time: json['time'] as int? ?? 0,
      ingredients: (json['ingredients'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      preparation: (json['preparation'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$_RecipeToJson(_$_Recipe instance) => <String, dynamic>{
      'dishName': instance.dishName,
      'url': instance.url,
      'category': instance.category,
      'amount': instance.amount,
      'time': instance.time,
      'ingredients': instance.ingredients,
      'preparation': instance.preparation,
    };
