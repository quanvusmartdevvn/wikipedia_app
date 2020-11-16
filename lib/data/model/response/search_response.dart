import 'package:wikipedia_app/data/model/local_model/wikipedia.dart';

class SearchResponse {
  List<Wikipedia> pages;

  SearchResponse({this.pages});

  SearchResponse.fromJson(Map<String, dynamic> json) {
    if (json['pages'] != null) {
      pages = new List<Wikipedia>();
      json['pages'].forEach((v) {
        pages.add(new Wikipedia.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.pages != null) {
      data['pages'] = this.pages.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

