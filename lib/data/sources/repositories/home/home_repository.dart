
import 'package:wikipedia_app/data/model/response/search_response.dart';

abstract class HomeRepository{
  Future<SearchResponse> onSearch(String searchText, int limit);
}