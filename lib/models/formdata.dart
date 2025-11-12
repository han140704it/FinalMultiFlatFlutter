import 'dart:convert';
import 'package:http/http.dart' as http;

class Predict {
  // Các trường dữ liệu mà bạn sẽ thu thập từ người dùng
  String dateOfHarvest;
  String season;
  double latitude;
  double longitude;

  // Constructor để khởi tạo lớp Predict
  Predict({
    required this.dateOfHarvest,
    required this.season,
    required this.latitude,
    required this.longitude,
  });

  factory Predict.fromJson(Map<String, dynamic> json) {
    return Predict(
      dateOfHarvest: json['Date_of_Harvest'],
      season: json['Season'],
      latitude: json['Latitude'],
      longitude: json['Longitude'],
      // district: json['District'],
      // fieldSize: json['Field_size_ha'],
      // intensity: json['Intensity'],
    );
  }
  // Phương thức để chuyển đổi đối tượng thành JSON
  Map<String, dynamic> toJson() {
    return {
      "Date_of_Harvest": dateOfHarvest,
      "Season": season,
      "Latitude": latitude,
      "Longitude": longitude,
    };
  }
}
