import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:wikipedia_app/data/model/error/get_page_error.dart';
import 'package:wikipedia_app/data/model/local_model/wiki_detail.dart';
import 'package:wikipedia_app/data/sources/remote/api_config.dart';
import 'package:wikipedia_app/data/sources/remote/api_endpoints.dart';
import 'package:wikipedia_app/data/sources/repositories/wikipedia_detail/wiki_repository.dart';

class WikiRepositoryImpl implements WikiRepository {
  @override
  Future<WikiDetail> onGetWikiDetail(String title) async {
    final responseJson = await http.get(
        ApiConfig.SERVER_URL + ApiEndpoints.GET_PAGE+"$title/bare");
    final statusCode = responseJson.statusCode;
    var response = json.decode(responseJson.body);
    if (statusCode < 200 || statusCode >= 300 || responseJson.body == null) {
      throw GetPageError.fromJson(response);
    } else {
      WikiDetail wikiDetail = WikiDetail.fromJson(response);
      return wikiDetail;
    }
  }



}
