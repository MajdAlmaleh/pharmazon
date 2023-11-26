//import 'package:dio/dio.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
//import 'package:http/http.dart' as http;

class ApiService {
  final Dio _dio;

// BaseOptions options = BaseOptions(
//   baseUrl: 'http://127.0.0.1:8000/api/',
//  // connectTimeout: 5000,
// //  receiveTimeout: 3000,
// );



 // final _baseUrl = 'https://192.168.2.104:8000/api/';
  ApiService(this._dio);
  Future<dynamic> get(
      {required String urlEndPoint, @required String? token}) async {
    Map<String, String> headers = {};
    if (token != null) {
      headers.addAll({'Authorization': '$token'});
    }
    
    final Response response = await _dio.get(urlEndPoint,
        options: Options(headers: headers));

    if (response.statusCode == 200||response.statusCode == 201) {
      response.data;
    } else {
      throw Exception(
          'there is a problem with status code ${response.statusCode}');
    }
  }
  Future<dynamic> delete(
      {required String urlEndPoint, @required String? token}) async {
    Map<String, String> headers = {
       'Accept':'application/json'
    };
    if (token != null) {
      headers.addAll({'Authorization': '$token'});
      //i deleted Bearer before the token
    }
    
    final Response response = await _dio.delete(urlEndPoint,
        options: Options(headers: headers));

    if (response.statusCode == 200||response.statusCode == 201) {
      response.data;
    } else {
      throw Exception(
          'there is a problem with status code ${response.statusCode}');
    }
  }

  Future<dynamic> post(
      {required String urlEndPoint,
      @required dynamic body,
      @required String? token}) async {
    Map<String, String> headers = {
      'Accept':'application/json'
    };

    if (token != null) {
      headers.addAll({'Authorization': '$token'});
    }

    Response response = await _dio.post(
      urlEndPoint,
      options: Options(headers: headers),
      data: body,
    );
    if (response.statusCode == 200||response.statusCode == 201) {
      Map<String,dynamic> data =response.data;
      return data;
    } else {
      throw Exception(
          'there is a problem with status code ${response.statusCode} with body ${response.data}');
    }
  }

  Future<dynamic> put(
      {required String urlEndPoint,
      @required dynamic body,
      @required String? token}) async {
    Map<String, String> headers = {};
    headers.addAll({'Content-Type': 'application/x-www-form-unlencoded'});
    if (token != null) {
      headers.addAll({'Authorization': '$token'});
    }

    Response response = await _dio.put(
      urlEndPoint,
      data: body,
      options: Options(headers: headers),
    );
    if (response.statusCode == 200) {
Map<String,dynamic> data =response.data;      return data;
    } else {
      throw Exception(
          'there is a problem with status code ${response.statusCode} with body ${response.data}');
    }
  }
}
