import 'package:dacs_ha4/screens/details/food_details.dart';
import 'package:dacs_ha4/screens/home/widget/food_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../common/utils/constants.dart';
import '../../../provider/food_data_provider.dart';
import '../controller/home_controller.dart';

class FoodList extends StatelessWidget {
  final WidgetRef ref;
  const FoodList({super.key, required this.ref});

  @override
  Widget build(BuildContext context) {
    final foodState = ref.watch(homeListProvider);
    return foodState.when(
      data: (data) {
        final foodList = FoodDataProvider.foodList;
        return GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 0.87,
          ),
          shrinkWrap: true,
          physics: const ScrollPhysics(),
          itemCount: data?.length,
          itemBuilder: (context, index) {
            final food = foodList[index];
            return Padding(
              padding: const EdgeInsets.all(5.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  FoodItem(
                    // imagePath: "${AppConstants.IMAGE_UPLOADS_PATH}${data![index].thumbnail}",
                    imagePath:  "${data![index].thumbnail}",
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