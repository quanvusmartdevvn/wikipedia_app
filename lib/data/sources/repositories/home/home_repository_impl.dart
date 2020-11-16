import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:wikipedia_app/data/model/error/search_error.dart';
import 'package:wikipedia_app/data/model/response/search_response.dart';
import 'package:wikipedia_app/data/sources/remote/api_config.dart';
import 'package:wikipedia_app/data/sources/remote/api_endpoints.dart';
import 'package:wikipedia_app/data/sources/repositories/home/home_repository.dart';

class HomeRepositoryImpl implements HomeRepository {
  @override
  Future<SearchResponse> onSearch(String searchText, int limit) async {
    final responseJson = await http.get(
        ApiConfig.SERVER_URL + ApiEndpoints.SEARCH+"$searchText&limit=$limit");
    final statusCode = responseJson.statusCode;
    var response = json.decode(responseJson.body);
    if (statusCode < 200 || statusCode >= 300 || responseJson.body == null) {
      throw SearchError.fromJson(response);
    } else {
      SearchResponse searchResponse = SearchResponse.fromJson(response);
      return searchResponse;
    }
  }



}
