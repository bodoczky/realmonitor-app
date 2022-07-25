import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart';
import 'package:ingatlan_figyelo_teszt/models/filter/filter_model.dart';

class FiltersRepository {
  final String _baseUrl = "https://jsonplaceholder.typicode.com/posts";

  Future<FilterModel> getFilters(FilterModel filterModel) async {
    Map<String, String> headers = {
      HttpHeaders.contentTypeHeader: "application/json"
    };

    final Response response = await post(Uri.parse(_baseUrl),
        headers: headers, body: jsonEncode(filterModel.toJson()));
    if (response.statusCode == 200 || response.statusCode == 201) {
      return FilterModel.fromJson(jsonDecode(response.body));
    } else {
      throw Exception("Failed to load filters");
    }
  }
}
