import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart';

import '../error/exception.dart';

dynamic decodeBodyAndThrowPossibleException(Response resp) {
  try {
    final json = jsonDecode(
      resp.body,
    );
    if (resp.statusCode > 299 || json["success"] == false) {
      if (json['message'] != null) {
        String message = '';
        if (json['message'].runtimeType.toString().contains('List')) {
          String temp = '';
          json['message'].forEach((data) {
            temp = '$temp $data';
          });
          message = temp;
        } else {
          message = json['message'];
        }
        throw ServerException(message);
      } else {
        throw Exception();
      }
    }
    return json;
  } catch (e) {
    rethrow;
  }
}
