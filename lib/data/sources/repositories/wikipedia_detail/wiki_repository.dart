import 'package:wikipedia_app/data/model/local_model/wiki_detail.dart';

abstract class WikiRepository{
  Future<WikiDetail> onGetWikiDetail(String title);
}