import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wikipedia_app/base/base_state.dart';
import 'package:wikipedia_app/data/model/error/get_page_error.dart';
import 'package:wikipedia_app/data/model/local_model/wiki_detail.dart';
import 'package:wikipedia_app/data/sources/local/dbconfig.dart';
import 'package:wikipedia_app/ui/components/loading.dart';
import 'package:wikipedia_app/ui/modules/wikipedia_detail/contract/wikipedia_contract.dart';
import 'package:wikipedia_app/ui/modules/wikipedia_detail/view_model/wikipedia_view_model.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:wikipedia_app/ui/components/text_custom_style.dart';
import 'package:wikipedia_app/values/strings.dart';
import 'package:wikipedia_app/values/styles.dart';

import 'package:wikipedia_app/data/model/local_model/wikipedia.dart';

import 'package:wikipedia_app/data/sources/local/daos/wiki_dao.dart';
import 'package:wikipedia_app/data/sources/local/tables/wiki_table.dart';
import 'package:wikipedia_app/routes/navigation.dart';

class WikiDetailPage extends StatefulWidget {
  final String title;
  final Wikipedia wikipediaDetail;

  WikiDetailPage({@required this.title, @required this.wikipediaDetail});

  @override
  _WikiDetailPageState createState() => _WikiDetailPageState();
}

class _WikiDetailPageState extends BaseState<WikiDetailPage>
    implements WikiDetailContract {
  WikiDetailViewModel mModel;
  Completer<WebViewController> _controller = Completer<WebViewController>();
  int bookmark;
  WikiDAO _wikiDAO = WikiDAO();

  Future _getDbInstance() async => await DbConfig.getInstance();

  @override
  void initState() {
    super.initState();
    mModel = Provider.of<WikiDetailViewModel>(context, listen: false);
    mModel.contract = this;
    mModel.onGetDetail(widget.title);
    updateWikiLocal(widget.wikipediaDetail.bookmark);
    setState(() {
      bookmark = widget.wikipediaDetail.bookmark;
    });
    mModel.isLoadData = true;
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  @override
  Widget buildWidget() {
    return Consumer<WikiDetailViewModel>(builder: (context, model, child) {
      return Scaffold(
        appBar: _appBar(),
        body: SafeArea(
          child: LoadingWidget(
            message: please_wait,
            status: model.isLoadData,
            child: model.wikiDetail != null
                ? _buildBody(model.wikiDetail)
                : Container(),
          ),
        ),
      );
    });
  }

  Future<int> updateWikiLocal(int bookmarkParam) async {
    widget.wikipediaDetail.bookmark = bookmarkParam;
    widget.wikipediaDetail.watchtime = DateTime.now().millisecondsSinceEpoch;
    await _getDbInstance();
    WikiTable wikiTable =
        new WikiTable.fromJson(widget.wikipediaDetail.toJson());
    return await _wikiDAO.update(wikiTable);
  }

  Widget _appBar() {
    return AppBar(
      leading: IconButton(
        icon: Icon(Icons.arrow_back),
        color: Colors.grey[500],
        onPressed: () {
          pop(context);
        },
      ),
      actions: [
        IconButton(
          icon: Icon(bookmark == 1 ? Icons.bookmark : Icons.bookmark_outline),
          color: bookmark == 1 ? Colors.orange : Colors.grey[500],
          onPressed: () async {
            if (bookmark == 1) {
              await updateWikiLocal(0);
              setState(() {
                bookmark = 0;
              });
            } else {
              await updateWikiLocal(1);
              setState(() {
                bookmark = 1;
              });
            }
          },
        )
      ],
      backgroundColor: Colors.white,
      title: TextCustomStyle(
        widget.title,
        style: styleTextTitle,
      ),
      centerTitle: true,
    );
  }

  Widget _buildBody(WikiDetail wikiDetail) {
    return Container(
        child: WebView(
      initialUrl: wikiDetail.htmlUrl,
      javascriptMode: JavascriptMode.unrestricted,
      onWebViewCreated: (WebViewController webViewController) {
        _controller.complete(webViewController);
      },
      javascriptChannels: <JavascriptChannel>[].toSet(),
      onPageStarted: (String url) {},
      onPageFinished: (String url) {},
      gestureNavigationEnabled: true,
    ));
  }

  @override
  void onDetailWikiError(GetPageError error) {
    mModel.getDetailError();
  }

  @override
  void onDetailWikiSuccess(WikiDetail response) {
    mModel.getDetailSuccess(response);
  }

  @override
  void dispose() {
    super.dispose();
    mModel.wikiDetail = null;
    mModel.isLoadData = false;
  }
}
