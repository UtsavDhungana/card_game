import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:http/http.dart';
import 'package:injectable/injectable.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

import '../../app/database/user_dao.dart';
import '../constants/configs.dart';

abstract class BaseRemoteDataSource {
  Future<Response> performPostRequest(
      String endpoint, Object? parameter, Map<String, String>? header);

  Future<Response> performGetRequest(String endpoint);

  Future<Response> performMultiPartPostRequest(
    String endpoint,
    Map<String, String> parameter,
    List<MultipartFile>? fileList,
    Map<String, String>? header,
  );
}

@LazySingleton(as: BaseRemoteDataSource)
class BaseRemoteDataSourceImpl extends BaseRemoteDataSource {
  final _timeoutDuration = const Duration(seconds: 25);
  final Client client;
  final UserDao userDao;
  BaseRemoteDataSourceImpl(
    this.client,
    this.userDao,
  );

  @override
  Future<Response> performGetRequest(String endpoint) async {
    final token = await userDao.getToken() ?? '';
    final header = {
      'Authorization': token,
      'content-type': 'application/json',
    };
    return await get(
      Uri.parse(
        ApiConfig.apiBaseUrl + endpoint,
      ),
      headers: header,
    ).timeout(
      _timeoutDuration,
      onTimeout: onTimeout,
    );
  }

  @override
  Future<Response> performPostRequest(
    String endpoint,
    Object? parameter,
    Map<String, String>? header,
  ) async {
    var token = '';
    Map<String, String> headerData = {};
    if (header == null) {
      token = await userDao.getToken() ?? '';
      headerData = {
        'Authorization': token,
        'content-type': 'application/json',
      };
    }
    log(ApiConfig.apiBaseUrl + endpoint);
    return await post(
      Uri.parse(ApiConfig.apiBaseUrl + endpoint),
      body: parameter,
      headers: header ?? headerData,
    ).timeout(_timeoutDuration, onTimeout: onTimeout);
  }

  Never onTimeout() {
    return (throw const SocketException(""));
  }

  @override
  Future<Response> performMultiPartPostRequest(
    String endpoint,
    Map<String, String> parameter,
    List<MultipartFile>? fileList,
    Map<String, String>? header,
  ) async {
    var token = '';
    Map<String, String> headerData = {};
    if (header == null) {
      token = await userDao.getToken() ?? '';
      headerData = {
        'Authorization': token,
        'content-type': 'application/json',
      };
    }

    var request = MultipartRequest(
      'POST',
      Uri.parse(ApiConfig.apiBaseUrl + endpoint),
    );

    request.fields.addAll(parameter);

    if (fileList != null) {
      request.files.addAll(fileList);
    }
    request.headers.addAll(
      header ?? headerData,
    );
    final resp =
        await request.send().timeout(_timeoutDuration, onTimeout: onTimeout);
    return Response.fromStream(resp);
  }
}

// @LazySingleton()
// class Client {
//   Client client = Client();
// }

@module
abstract class RegisterModule {
  @lazySingleton
  Client get client => Client();

  @lazySingleton
  InternetConnectionChecker get internetConnectionChecker =>
      InternetConnectionChecker();
}
