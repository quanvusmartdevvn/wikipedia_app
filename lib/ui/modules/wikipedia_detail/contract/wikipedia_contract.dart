
import 'package:wikipedia_app/data/model/error/get_page_error.dart';
import 'package:wikipedia_app/data/model/local_model/wiki_detail.dart';

abstract class WikiDetailContract {
  void onDetailWikiSuccess(WikiDetail response);
  void onDetailWikiError(GetPageError error);
}