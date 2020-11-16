import 'package:wikipedia_app/data/model/local_model/latest.dart';
import 'package:wikipedia_app/data/model/local_model/license.dart';

class WikiDetail {
  int id;
  String key;
  String title;
  Latest latest;
  String contentModel;
  License license;
  String htmlUrl;

  WikiDetail(
      {this.id,
        this.key,
        this.title,
        this.latest,
        this.contentModel,
        this.license,
        this.htmlUrl});

  WikiDetail.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    key = json['key'];
    title = json['title'];
    latest =
    json['latest'] != null ? new Latest.fromJson(json['latest']) : null;
    contentModel = json['content_model'];
    license =
    json['license'] != null ? new License.fromJson(json['license']) : null;
    htmlUrl = json['html_url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['key'] = this.key;
    data['title'] = this.title;
    if (this.latest != null) {
      data['latest'] = this.latest.toJson();
    }
    data['content_model'] = this.contentModel;
    if (this.license != null) {
      data['license'] = this.license.toJson();
    }
    data['html_url'] = this.htmlUrl;
    return data;
  }
}
