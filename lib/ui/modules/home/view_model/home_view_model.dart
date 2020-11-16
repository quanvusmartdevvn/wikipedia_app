import 'package:flutter/cupertino.dart';
import 'package:wikipedia_app/data/di/injector.dart';
import 'package:wikipedia_app/data/model/local_model/wikipedia.dart';
import 'package:wikipedia_app/data/model/response/search_response.dart';
import 'package:wikipedia_app/data/sources/local/daos/wiki_dao.dart';
import 'package:wikipedia_app/data/sources/local/dbconfig.dart';
import 'package:wikipedia_app/data/sources/repositories/home/home_repository.dart';
import 'package:wikipedia_app/ui/modules/home/contract/home_contract.dart';
import 'package:wikipedia_app/utils/check_internet.dart';

class HomeViewModel extends ChangeNotifier {
  TextEditingController searchTextController;
  HomeRepository _repository;
  HomeContract contract;
  SearchResponse searchResponse;
  bool isLoadData;
  bool validateSearch = false;
  WikiDAO _wikiDAO = WikiDAO();
  List<Wikipedia> wikies;

  HomeViewModel() {
    isLoadData = true;
    _repository = Injector().onSearch;
    searchTextController = TextEditingController();
    _getDbInstance().then((value) {
      isLoadData = false;
      this.getWikiesLocal(20);
    });
  }

  Future _getDbInstance() async => await DbConfig.getInstance();

  void onSearch() {
    checkInterNet().then((value) {
      if (value != null && value) {
        assert(_repository != null);
        _repository
            .onSearch(searchTextController.text, 20)
            .then((response) => contract.onSearchSuccess(response))
            .catchError((error) => contract.onSearchError(error));
      } else {
        this.searchWikiesLocal(searchTextController.text);
      }
    });
  }

  void searchSuccess(SearchResponse response) {
    searchResponse = SearchResponse();
    searchResponse = response;
    isLoadData = false;
    // this.deleteTable();
    searchResponse.pages.forEach((element) {
      element.watchtime = 0;
      _wikiDAO.insert(element);
    });
    notifyListeners();
  }

  void searchError() {
    isLoadData = false;
    notifyListeners();
  }

  void getWikiesLocal(int limit) async {
    searchResponse = SearchResponse();
    searchResponse.pages = await _wikiDAO.getWikies(limit);
    print("${searchResponse.pages.length}");
    notifyListeners();
  }

  void searchWikiesLocal(String searchText) async {
    isLoadData = false;
    searchResponse = SearchResponse();
    searchResponse.pages = await _wikiDAO.searchWikies(searchText);
    notifyListeners();
  }

  void deleteTable() async {
    await _wikiDAO.deleteTable();
    notifyListeners();
  }
}
