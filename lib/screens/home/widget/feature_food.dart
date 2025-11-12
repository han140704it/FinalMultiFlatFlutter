import 'package:dacs_ha4/screens/feature_food/controller/feature_food_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../common/utils/constants.dart';
import '../../../provider/food_data_provider.dart';
import '../../../models/food.dart';
import '../../details/food_details.dart';
import '../../feature_food/widget/feature_food_widget.dart';
import 'food_item1.dart';

class FeatureFoods extends StatelessWidget {
  final WidgetRef ref;
  const FeatureFoods({super.key, required this.ref});

  @override
  Widget build(BuildContext context) {
    final featureFood = ref.watch(featureFoodControllerProvider);
    // List<Food> featuredFoodList = [
    //   FoodDataProvider.foodList[0],
    //   FoodDataProvider.foodList[1],
    //   FoodDataProvider.foodList[2],
    //   FoodDataProvider.foodList[3],
    //   FoodDataProvider.foodList[4],
    // ];
    return featureFood.when(
        data: (data){
          final foodList = FoodDataProvider.foodList;
          return Column(

            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Khóa học online",
                    style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: Colors.grey.shade800),
                  ),

                  InkWell(
                    onTap: () {},
                    child: const Text("See All",
                      style: TextStyle(color: Colors.blue, fontSize: 12),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 5,
              ),
              SizedBox(
                height: 185,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: data?.length,
                  itemBuilder: (context, index) {
                    final food = foodList[index];
                    return Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          FeatureFoodWidget(
                            // imagePath: "${AppConstants.IMAGE_UPLOADS_PATH}${data![index].thumbnail}",
                            imagePath: "${data![index].thumbnail}",
                            title: "${data[index].name}",
                            teacher: "${data[index].teacher}",
                            food: food,
                            func: (){
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (BuildContext context) => const FoodDetails(),
                                  settings: RouteSettings(
                                    arguments: {
                                      "id": data[index].id.toString(),
                                      // Add other key-value pairs if needed
                                    },
                                  ),
                                ),
                              );
                            },
                          ),
                        ],
                      ),
                    );
                  },
                ),
              )
            ],
          );
        },
        error: (error, stackTrace) {
          print(error.toString());
          print(stackTrace.toString());
          return const Center(child: Text("Error loading data"));
        },
        loading: () => const Center(
          child: CircularProgressIndicator(),
        ),
    );
  }
}
