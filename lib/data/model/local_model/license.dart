
class License {
  String url;
  String title;

  License({this.url, this.title});

  License.fromJson(Map<String, dynamic> json) {
    url = json['url'];
    title = json['title'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['url'] = this.url;
    data['title'] = this.title;
    return data;
  }
}