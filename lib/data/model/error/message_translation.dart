class MessageTranslations {
  String vi;
  String en;

  MessageTranslations({this.vi, this.en});

  MessageTranslations.fromJson(Map<String, dynamic> json) {
    vi = json['vi'];
    en = json['en'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['vi'] = this.vi;
    data['en'] = this.en;
    return data;
  }
}