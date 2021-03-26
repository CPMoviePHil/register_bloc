import 'package:flutter/cupertino.dart';

class ImageModel {
  bool result;
  String data;

  ImageModel({
    @required this.result,
    @required this.data,
  });

  ImageModel.fromJson(Map<String, dynamic> json) {
    result = json['result'];
    data = json['data'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['result'] = this.result;
    data['data'] = this.data;
    return data;
  }
}
