import 'package:wikipedia_app/data/model/error/message_translation.dart';

class GetPageError {
  String error;
  String name;
  String value;
  String failureCode;
  Null failureData;
  MessageTranslations messageTranslations;
  int httpCode;
  String httpReason;

  GetPageError(
      {this.error,
        this.name,
        this.value,
        this.failureCode,
        this.failureData,
        this.messageTranslations,
        this.httpCode,
        this.httpReason});

  GetPageError.fromJson(Map<String, dynamic> json) {
    error = json['error'];
    name = json['name'];
    value = json['value'];
    failureCode = json['failureCode'];
    failureData = json['failureData'];
    messageTranslations = json['messageTranslations'] != null
        ? new MessageTranslations.fromJson(json['messageTranslations'])
        : null;
    httpCode = json['httpCode'];
    httpReason = json['httpReason'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['error'] = this.error;
    data['name'] = this.name;
    data['value'] = this.value;
    data['failureCode'] = this.failureCode;
    data['failureData'] = this.failureData;
    if (this.messageTranslations != null) {
      data['messageTranslations'] = this.messageTranslations.toJson();
    }
    data['httpCode'] = this.httpCode;
    data['httpReason'] = this.httpReason;
    return data;
  }
}