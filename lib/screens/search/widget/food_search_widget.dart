import 'package:dacs_ha4/screens/details/food_details.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../common/entities/food.dart';
import '../../../common/utils/constants.dart';

class FoodSearchWidget extends ConsumerWidget {
  const FoodSearchWidget({super.key, required this.value});
  final List<FoodItem> value;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ListView(
      children: [
        for (final food in value)
          Card(
            child: ListTile(
              leading: Image.asset(
                // "${AppConstants.IMAGE_UPLOADS_PATH}${food.thumbnail}",
                "${food.thumbnail}",
                width: 60,
                height: 60,
                fit: BoxFit.cover,
              ),
              title: Text(
                "${food.name}",
                maxLines: 5,
                style: TextStyle(fontSize: 15, color: Colors.grey.shade800),
              ),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 7,),
                  Text(
                    "${food.teacher}",
                    style: TextStyle(color: Colors.grey.shade500),
                  ),
                ],
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (BuildContext context) => const FoodDetails(),
                    settings: RouteSettings(
                      arguments: {
                        "id": food.id.toString(),
                      },
                    ),
                  ),
                );
              },
            ),
          )
      ],
    );
  }
}
