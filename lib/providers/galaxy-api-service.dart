import 'dart:convert';
import 'package:future_builder_example/models/galaxy-list-item.dart';
import 'package:http/http.dart' as http;

class GalaxyApiService {
  Future<GalaxyListItem> fetchGalaxyItem(
    String type,
    int id,
  ) async {
    try {
      print('Fetch $type $id');
      final response =
          await http.get(Uri.parse('https://swapi.dev/api/$type/$id'));
      if (response.statusCode == 200) {
        final item = json.decode(response.body);
        return GalaxyListItem.fromJson(item);
      } else {
        throw Exception('Failed to load data');
      }
    } catch (e) {
      throw Exception('Failed to load data: $e');
    }
  }
}
