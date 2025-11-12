import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:dacs_ha4/models/formdata.dart';
import 'package:dacs_ha4/provider/predict_provider.dart';

class PredictScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Khởi tạo controller cho các TextField
    TextEditingController dateOfHarvestController = TextEditingController();
    final seasonController = TextEditingController();
    TextEditingController latitudeController = TextEditingController();
    TextEditingController longitudeController = TextEditingController();

    return ChangeNotifierProvider<PredictNotifier>(
      create: (context) => PredictNotifier(),
      child: Scaffold(
        appBar: AppBar(
          title: Text("Predict Screen"),
        ),
        body: Consumer<PredictNotifier>(
          builder: (context, predictNotifier, _) {
            return Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  // TextField cho Date_of_Harvest
                  TextField(
                    controller: dateOfHarvestController,
                    decoration: InputDecoration(
                      labelText: 'Date of Harvest',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  SizedBox(height: 10),

                  // Dropdown cho Season
                  DropdownButtonFormField<String>(
                    value: seasonController.text.isEmpty ? null : seasonController.text,
                    decoration: InputDecoration(
                      labelText: 'Select Season',
                      border: OutlineInputBorder(),
                    ),
                    onChanged: (newValue) {
                      seasonController.text = newValue!;
                    },
                    items: [
                      DropdownMenuItem<String>(
                        value: 'Season(SA = Summer Autumn, WS = Winter Spring)_SA',
                        child: Text('Season SA'),
                      ),
                      DropdownMenuItem<String>(
                        value: 'Season(SA = Summer Autumn, WS = Winter Spring)_WS',
                        child: Text('Season WS'),
                      ),
                    ],
                  ),
                  SizedBox(height: 10),

                  // TextField cho Latitude
                  TextField(
                    controller: latitudeController,
                    keyboardType: TextInputType.numberWithOptions(decimal: true),
                    decoration: InputDecoration(
                      labelText: 'Latitude',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  SizedBox(height: 10),

                  // TextField cho Longitude
                  TextField(
                    controller: longitudeController,
                    keyboardType: TextInputType.numberWithOptions(decimal: true),
                    decoration: InputDecoration(
                      labelText: 'Longitude',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  SizedBox(height: 20),

                  // Nút gửi dự đoán đến server
                  ElevatedButton(
                    onPressed: () {
                      // Lấy giá trị từ các TextField và cập nhật đối tượng Predict
                      Predict newPredict = Predict(
                        dateOfHarvest: dateOfHarvestController.text,
                        season: seasonController.text,
                        latitude: double.tryParse(latitudeController.text) ?? 0.0,
                        longitude: double.tryParse(longitudeController.text) ?? 0.0,
                      );

                      // Cập nhật đối tượng Predict và gửi lên server
                      predictNotifier.updatePredict(newPredict);
                      predictNotifier.sendPredictToServer();
                    },
                    child: Text('Send Predict to Server'),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
