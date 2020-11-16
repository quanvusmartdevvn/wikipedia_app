
import 'package:wikipedia_app/data/model/error/search_error.dart';
import 'package:wikipedia_app/data/model/response/search_response.dart';

abstract class HomeContract {
  void onSearchSuccess(SearchResponse response);
  void onSearchError(SearchError error);
}