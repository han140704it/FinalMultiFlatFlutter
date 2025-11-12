import 'package:dacs_ha4/common/entities/food.dart';
import 'package:dacs_ha4/screens/search/repos/foods_search_repos.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';


class FoodsSearchController extends AutoDisposeAsyncNotifier<List<FoodItem>?>{
  @override
  FutureOr<List<FoodItem>?> build() async{
    final response = await FoodsSearchRepos.foodsDefaultSearch();
    if(response.code==200){
      return response.data;
    }
    return [];
  }
  searchData (String search) async{
    SearchRequestEntity searchRequestEntity = SearchRequestEntity();
    searchRequestEntity.search = search;
    var response = await FoodsSearchRepos.foodsSearch(params: searchRequestEntity);

    if(response.code==200){
      state = AsyncValue.data(response.data);
    }else{
      state = AsyncValue.data([]);
    }
  }
}

final foodsSearchControllerProvider =
AutoDisposeAsyncNotifierProvider<FoodsSearchController, List<FoodItem>?>(FoodsSearchController.new);