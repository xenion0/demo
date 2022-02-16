import 'package:demo/data/models/user.dart';

class ResponseData {
  bool? status;
  var message;
  User? data;

  ResponseData({this.status, this.message, this.data});

  ResponseData.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    data = (json['data'] != null ? User.fromJson(json['data']) : null);
  }
  Map<String, dynamic> toJson() =>
      {'state': status, 'message': message, 'data': data!.toJson()};
}



