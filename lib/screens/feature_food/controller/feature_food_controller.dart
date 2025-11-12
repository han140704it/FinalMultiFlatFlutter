import 'dart:convert';

import 'package:dacs_ha4/common/entities/food.dart';
import 'package:dacs_ha4/screens/search/repos/foods_search_repos.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../repos/feature_food_repos.dart';


class FeatureFoodController extends AutoDisposeAsyncNotifier<List<FoodItem>?>{
  @override
  FutureOr<List<FoodItem>?> build() async{
    final response = await FeatureFoodRepos.featureFood();
    if(response.code==200){
      return (response.data as List)
          .map((foodJson) => FoodItem.fromJson(foodJson))
          .toList();
    }
    return [];
  }
}

final featureFoodControllerProvider =
AutoDisposeAsyncNotifierProvider<FeatureFoodController, List<FoodItem>?>(FeatureFoodController.new);