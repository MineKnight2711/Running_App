import 'dart:convert';

import 'package:flutter_running_demo/models/direction_model/direction_model.dart';
import 'package:flutter_running_demo/models/direction_model/route_model/location_model/location_model.dart';
import 'package:http/http.dart' as http;
import 'package:logger/logger.dart';

class GoongApi {
  final apiKey = "vYnHBjpDZijBY0NAHM4W6OIVL7z0LJLmqMaR8xAW";
  final baseUrl = "https://rsapi.goong.io";
  Future<DirectionModel> getRoute({
    required LocationModel startLocation,
    required LocationModel endLocation,
  }) async {
    final origin = "${startLocation.lat}, ${startLocation.lng}";
    final destination = "${endLocation.lat}, ${endLocation.lng}";
    final url = Uri.parse(
        "$baseUrl/Direction?origin=$origin&destination=$destination&api_key=$apiKey");
    final response = await http.get(url);
    if (response.statusCode == 200) {
      DirectionModel directionModel =
          DirectionModel.fromJson(jsonDecode(response.body));
      Logger().i(directionModel.toJson());
      return directionModel;
    } else {
      throw Exception("Failed to load route");
    }
  }
}
