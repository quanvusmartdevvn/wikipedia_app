import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wikipedia_app/base/base_state.dart';
import 'package:wikipedia_app/data/model/error/search_error.dart';
import 'package:wikipedia_app/data/model/local_model/wikipedia.dart';
import 'package:wikipedia_app/data/model/response/search_response.dart';
import 'package:wikipedia_app/routes/navigation.dart';
import 'package:wikipedia_app/ui/components/loading.dart';
import 'package:wikipedia_app/ui/modules/bookmark/view/bookmark_page.dart';
import 'package:wikipedia_app/ui/modules/history/view/history_page.dart';
import 'package:wikipedia_app/ui/modules/home/contract/home_contract.dart';
import 'package:wikipedia_app/ui/modules/home/view_model/home_view_model.dart';
import 'package:wikipedia_app/ui/modules/wikipedia_detail/view/wikipedia_detail.dart';
import 'package:wikipedia_app/ui/components/box_search_textfield.dart';
import 'package:wikipedia_app/ui/components/item_wikipedia.dart';
import 'package:wikipedia_app/utils/check_internet.dart';
import 'package:wikipedia_app/values/strings.dart';

import '../../../../values/images.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends BaseState<HomePage> implements HomeContract {
  HomeViewModel mModel;
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    mModel = Provider.of<HomeViewModel>(context, listen: false);
    mModel.contract = this;
    mModel.getWikiesLocal(20);
  }

  void onGoBack() {
    mModel.getWikiesLocal(20);
  }

  void openDrawer() {
    _scaffoldKey.currentState.openDrawer();
  }

  @override
  Widget buildWidget() {
    return Consumer<HomeViewModel>(builder: (context, model, child) {
      return Scaffold(
        key: _scaffoldKey,
        backgroundColor: Colors.white,
        resizeToAvoidBottomInset: false,
        drawer: Drawer(
          child: SafeArea(
            child: Column(
              children: [
                Container(
                  width: double.infinity,
                  child: DrawerHeader(
                    child: Column(
                      children: [
                        Expanded(child: Image.asset(wikipedia_logo)),
                      ],
                    ),
                  ),
                ),
                ListTile(
                  title: Row(
                    children: [
                      Container(
                        child: Icon(Icons.bookmark_outline),
                        margin: EdgeInsets.symmetric(horizontal: 16),
                      ),
                      Text("Bookmark"),
                    ],
                  ),
                  onTap: () {
                    Route route =
                        MaterialPageRoute(builder: (context) => Bookmark());
                    Navigator.push(context, route).then((value) => onGoBack());
                  },
                ),
                ListTile(
                  title: Row(
                    children: [
                      Container(
                        child: Icon(Icons.history),
                        margin: EdgeInsets.symmetric(horizontal: 16),
                      ),
                      Text("History"),
                    ],
                  ),
                  onTap: () {
                    Route route =
                        MaterialPageRoute(builder: (context) => HistoryPage());
                    Navigator.push(context, route).then((value) => onGoBack());
                  },
                )
              ],
            ),
          ),
        ),
        body: GestureDetector(
          behavior: HitTestBehavior.opaque,
          onTap: () {
            FocusScope.of(context).requestFocus(FocusNode());
          },
          child: LoadingWidget(
            message: please_wait,
            status: model.isLoadData,
            child: _buildBody(model, openDrawer),
          ),
        ),
      );
    });
  }

  Widget _buildBody(HomeViewModel model, Function openDrawer) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      children: [
        _buildSearch(model, openDrawer),
        model.searchResponse != null && model.searchResponse.pages != null
            ? _buildListWiki(model.searchResponse.pages)
            : Container()
      ],
    );
  }

  Widget _buildSearch(HomeViewModel model, Function openDrawer) {
    return Container(
      decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(width: 1, color: Colors.grey[200]),
          ),
          color: Color.fromRGBO(41, 121, 255, 1),
          boxShadow: [
            BoxShadow(
              color: Colors.blue.withOpacity(0.1),
              blurRadius: 1,
              offset: Offset(0, 2),
            ),
          ]),
      padding: EdgeInsets.only(left: 15, right: 15, top: 60, bottom: 20),
      child: Row(
        children: [
          Expanded(
            child: BoxSearchTextField(
              controller: model.searchTextController,
              hintText: search_hint_text,
              onSearch: (value) {
                model.onSearch();
              },
            ),
          ),
          IconButton(
              icon: Icon(
                Icons.menu,
                color: Colors.white,
              ),
              onPressed: openDrawer)
        ],
      ),
    );
  }

  Widget _buildListWiki(List<Wikipedia> wikipedia) {
    return Expanded(
      child: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: wikipedia.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      checkInterNet().then((value) {
                        if (value != null && value) {
                          pushWithAnimation(
                              context,
                              WikiDetailPage(
                                  title: wikipedia[index].title,
                                  wikipediaDetail: wikipedia[index]));
                        } else {
                          showDialog();
                        }
                      });
                    },
                    child: ItemWikipediaWidget(wikipedia: wikipedia[index]),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void onSearchError(SearchError error) {
    mModel.searchError();
  }

  @override
  void onSearchSuccess(SearchResponse response) {
    mModel.searchSuccess(response);
  }

  void showDialog() {
    return showDialogBox(please_connect, error, <Widget>[
      FlatButton(
        onPressed: () {
          pop(context);
        },
        child: Text(close, style: TextStyle(color: Colors.blueAccent)),
      )
    ]);
  }
}
