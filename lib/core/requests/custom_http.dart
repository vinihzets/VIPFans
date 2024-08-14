import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:only_fans/core/requests/base_paths.dart';

class ResponseModel<T> {
  final ResponseStatus status;
  final T? content;
  final int statusCode;
  final String? errorDescription;

  bool get isSuccess => status == ResponseStatus.sucess;

  ResponseModel(
      {required this.status,
      required this.content,
      required this.statusCode,
      this.errorDescription});
}

enum ResponseStatus {
  sucess,
  failure,
  unauthorized;

  static fetchStatus(int statusCode) {
    switch (statusCode) {
      case >= 200 && <= 299:
        return ResponseStatus.sucess;
      case == 401:
        return ResponseStatus.unauthorized;
      default:
        return ResponseStatus.failure;
    }
  }
}

abstract class CustomHttp {
  late String url;

  Map<String, String> fetchHeader(String token) {
    return {
      "Content-Type": "application/json",
      "Accept": "application/json",
      "Authorization": "Bearer $token"
    };
  }

  Future<ResponseModel<T>> get<T>(String path,
      {Map<String, String>? headers,
      Map<String, dynamic>? queryParameters,
      required T Function(String json) translator});

  Future<ResponseModel<T>> put<T>(String path,
      {Map<String, String>? headers,
      Map<String, dynamic>? body,
      Encoding? enconding,
      required T Function(Map json) translator});

  Future<ResponseModel<T>> post<T>(String path,
      {Map<String, String>? headers,
      Map<String, dynamic>? body,
      Encoding? encoding,
      required T Function(Map json) translator});

  Future<ResponseModel<T>> delete<T>(String path,
      {Map<String, String>? headers,
      Map<String, dynamic>? queryParameters,
      required T Function(Map json) translator});
}

class CustomHttpImpl implements CustomHttp {
  BasePaths paths;
  @override
  late String url;

  CustomHttpImpl(this.paths) {
    url = (paths.localhost == 'localhost'
        ? 'api.dev.mycontrol.io'
        : paths.baseMap[
            paths.localhost.isEmpty ? 'smartlegacy.com.br' : paths.localhost])!;
  }

  @override
  Future<ResponseModel<T>> delete<T>(String path,
      {Map<String, String>? headers,
      Encoding? encoding,
      Map<String, dynamic>? queryParameters,
      required T Function(Map json) translator}) async {
    final result = await http.delete(Uri.https(url, path),
        headers: headers, body: queryParameters, encoding: encoding);

    final status = ResponseStatus.fetchStatus(result.statusCode);

    if (status == ResponseStatus.sucess) {
      return ResponseModel<T>(
        status: ResponseStatus.sucess,
        content: translator(
          jsonDecode(result.body),
        ),
        statusCode: result.statusCode,
      );
    }

    return ResponseModel(
        status: ResponseStatus.failure,
        content: null,
        statusCode: result.statusCode);
  }

  @override
  Map<String, String> fetchHeader(String token) {
    return {
      "Content-Type": "application/json",
      "Accept": "application/json",
      "Authorization": "Bearer $token"
    };
  }

  @override
  Future<ResponseModel<T>> get<T>(String path,
      {Map<String, String>? headers,
      Map<String, dynamic>? queryParameters,
      required T Function(
        String json,
      ) translator}) async {
    final result = await http.get(
      Uri.https(url, path, queryParameters),
      headers: headers,
    );

    final status = ResponseStatus.fetchStatus(result.statusCode);
    if (status == ResponseStatus.sucess) {
      return ResponseModel<T>(
        status: status,
        content: translator(
          result.body,
        ),
        errorDescription: result.body,
        statusCode: result.statusCode,
      );
    } else {
      final String? errorPhrase =
          jsonDecode(result.body)?['error']?['description'];

      return ResponseModel(
          status: status,
          content: null,
          errorDescription: errorPhrase ?? result.body,
          statusCode: result.statusCode);
    }
  }

  @override
  Future<ResponseModel<T>> post<T>(String path,
      {Map<String, String>? headers,
      Object? body,
      Encoding? encoding,
      required T Function(Map json) translator}) async {
    final result = await http.post(Uri.https(url, path),
        headers: headers, body: body, encoding: encoding);
    final status = ResponseStatus.fetchStatus(result.statusCode);

    if (status == ResponseStatus.sucess) {
      return ResponseModel<T>(
        status: ResponseStatus.sucess,
        content: translator(
          jsonDecode(result.body),
        ),
        statusCode: result.statusCode,
      );
    }
    return ResponseModel(
        status: ResponseStatus.failure,
        content: jsonDecode(result.body),
        statusCode: result.statusCode);
  }

  @override
  Future<ResponseModel<T>> put<T>(String path,
      {Map<String, String>? headers,
      Encoding? enconding,
      Object? body,
      Encoding? encoding,
      required T Function(Map json) translator}) async {
    final result = await http.put(Uri.https(url, path),
        headers: headers, body: body, encoding: encoding);

    final status = ResponseStatus.fetchStatus(result.statusCode);

    if (status == ResponseStatus.sucess) {
      return ResponseModel<T>(
        status: ResponseStatus.sucess,
        content: translator(
          jsonDecode(result.body),
        ),
        statusCode: result.statusCode,
      );
    }

    return ResponseModel(
        status: ResponseStatus.failure,
        content: jsonDecode(result.body),
        statusCode: result.statusCode);
  }
}
