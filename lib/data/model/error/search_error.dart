import 'package:wikipedia_app/data/model/error/message_translation.dart';

class SearchError {
  MessageTranslations messageTranslations;
  int httpCode;
  String httpReason;

  SearchError({this.messageTranslations, this.httpCode, this.httpReason});

  SearchError.fromJson(Map<String, dynamic> json) {
    messageTranslations = json['messageTranslations'] != null
        ? new MessageTranslations.fromJson(json['messageTranslations'])
        : null;
    httpCode = json['httpCode'];
    httpReason = json['httpReason'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.messageTranslations != null) {
      data['messageTranslations'] = this.messageTranslations.toJson();
    }
    data['httpCode'] = this.httpCode;
    data['httpReason'] = this.httpReason;
    return data;
  }
}