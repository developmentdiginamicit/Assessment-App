import 'dart:developer';
import 'dart:io';
import 'package:assessili_assement_app/constants/end_points.dart';
import 'package:assessili_assement_app/data/api_response.dart';
import 'package:assessili_assement_app/data/local_storage.dart';
import 'package:dio/dio.dart';
import 'package:talker/talker.dart';
import 'package:talker_dio_logger/talker_dio_logger.dart';



class ApiClient {
  final Dio _dio = Dio();
  LocalStorage localStorageService = LocalStorage();

  ApiClient() {
    _dio.options.baseUrl = EndPoints.baseUrl;
    _dio.options.connectTimeout = const Duration(seconds: 15);
    _dio.options.receiveTimeout = const Duration(seconds: 15);
    //interceptor for add token
    _dio.interceptors.add(InterceptorsWrapper(onRequest: (options, handler) {
      String token = LocalStorage().getToken();
      if (token.isNotEmpty) {
        options.headers['Authorization'] = 'Bearer $token';
      }
      return handler.next(options);
    }, onError: (DioException e, handler) {
      if (e.response?.statusCode == 401) {}
      return handler.next(e);
    }));
    _dio.interceptors.add(
      TalkerDioLogger(
        settings: TalkerDioLoggerSettings(
          printResponseData: true,
          printErrorMessage: true,
          printRequestData: true,
          printErrorData: true,
          requestPen: AnsiPen()..yellow(),
          responsePen: AnsiPen()..green(),
          errorPen: AnsiPen()..red(),
        ),
      ),
    );
  }

  //GET REQUEST
  Future<ApiResponse<T>> getRequest<T>({
    required String endPoint,
    required T Function(Map<String, dynamic>) fromJson,
    Map<String, dynamic>? queryParameters,
  }) async {
    try {
      final response = await _dio.get(endPoint, queryParameters: queryParameters);
      final data = fromJson(response.data);
      return ApiResponse<T>(data: data, statusCode: response.statusCode ?? 0);
    } on DioException catch (e) {
      final statusCode = e.response?.statusCode ?? 0;
      final errorMessage = _handleDioError(e, statusCode);
      return ApiResponse<T>(errorMessage: errorMessage, statusCode: statusCode);
    }
  }

  //GET REQUEST WITH LIST OF DATA
  Future<ApiResponse<List<T>>> getRequestList<T>({
    required String endPoint,
    required List<T> Function(List<dynamic>) fromJosnList,
    Map<String, dynamic>? queryParameters,
  }) async {
    try {
      final response = await _dio.get(endPoint, queryParameters: queryParameters);
      final data = fromJosnList(response.data);
      return ApiResponse<List<T>>(data: data, statusCode: response.statusCode ?? 0);
    } on DioException catch (e) {
      final statusCode = e.response?.statusCode ?? 0;
      final errorMessage = _handleDioError(e, statusCode);
      return ApiResponse<List<T>>(errorMessage: errorMessage, statusCode: statusCode);
    }
  }

  //POST REQUEST
  Future<ApiResponse<T>> postRequest<T>({
    required String endPoint,
    Map<String, dynamic>? reqModel,
    required T Function(Map<String, dynamic>) fromJson,
  }) async {
    try {
      final response = await _dio.post(endPoint, data: reqModel);
      final data = fromJson(response.data);
      return ApiResponse<T>(data: data, statusCode: response.statusCode ?? 0);
    } on DioException catch (e) {
      final statusCode = e.response?.statusCode ?? 0;
      final errorMessage = _handleDioError(e, statusCode);
      return ApiResponse<T>(errorMessage: errorMessage, statusCode: statusCode);
    }
  }

  //POST REQUEST
  Future<ApiResponse<T>> patchRequest<T>({
    required String endPoint,
    Map<String, dynamic>? reqModel,
    required T Function(Map<String, dynamic>) fromJson,
  }) async {
    try {
      final response = await _dio.patch(endPoint, data: reqModel);
      final data = fromJson(response.data);
      return ApiResponse<T>(data: data, statusCode: response.statusCode ?? 0);
    } on DioException catch (e) {
      final statusCode = e.response?.statusCode ?? 0;
      final errorMessage = _handleDioError(e, statusCode);
      return ApiResponse<T>(errorMessage: errorMessage, statusCode: statusCode);
    }
  }

  //DELETE REQUEST
  Future<ApiResponse<Map<String, dynamic>>> deleteRequest(
      {required String endPoint, Map<String, dynamic>? queryParameters}) async {
    try {
      final response = await _dio.delete(endPoint, queryParameters: queryParameters);
      final data = response.data as Map<String, dynamic>;
      return ApiResponse<Map<String, dynamic>>(data: data, statusCode: response.statusCode ?? 0);
    } on DioException catch (e) {
      final statusCode = e.response?.statusCode ?? 0;
      final errorMessage = _handleDioError(e, statusCode);
      return ApiResponse<Map<String, dynamic>>(statusCode: statusCode, errorMessage: errorMessage);
    }
  }

  //MULTI PART REQUEST
  Future<ApiResponse<T>> postRequestWithFile<T>({
    required String endPoint,
    required List<File>? files,
    Map<String, dynamic>? reqModel,
    String? fieldName,
    required T Function(Map<String, dynamic>) fromJson,
  }) async {
    try {
      Map<String, dynamic> formDataMap = {...?reqModel};

      if (files != null && files.isNotEmpty) {
        for (int i = 0; i < files.length; i++) {
          String fileName = files[i].path.split('/').last;
          formDataMap["$fieldName${i + 1}"] =
              await MultipartFile.fromFile(files[i].path, filename: fileName);
        }
      }

      FormData formData = FormData.fromMap(formDataMap);
      log("file-->${formData.files}");
      final response = await _dio.post(endPoint, data: formData);
      final responseData = fromJson(response.data);
      return ApiResponse<T>(data: responseData, statusCode: response.statusCode ?? 0);
    } on DioException catch (e) {
      final statusCode = e.response?.statusCode ?? 0;
      final errorMessage = _handleDioError(e, statusCode);
      return ApiResponse<T>(statusCode: statusCode, errorMessage: errorMessage);
    }
  }

  //MULTI PART REQUEST
  Future<ApiResponse<T>> driverPostRequestWithFile<T>({
    required String endPoint,
    required List<File> files,
    Map<String, dynamic>? reqModel,
    List<String>? fieldName,
    bool isUpdate = false,
    required T Function(Map<String, dynamic>) fromJson,
  }) async {
    try {
      Map<String, dynamic> formDataMap = {...?reqModel};

      if (files.isNotEmpty) {
        for (int i = 0; i < files.length; i++) {
          String fileName = files[i].path.split('/').last;
          formDataMap[fieldName![i]] =
              await MultipartFile.fromFile(files[i].path, filename: fileName);
        }
      }

      FormData formData = FormData.fromMap(formDataMap);
      log("file-->${formData.files}");
      final response = isUpdate == true
          ? await _dio.put(endPoint, data: formData)
          : await _dio.post(endPoint, data: formData);
      final responseData = fromJson(response.data);
      return ApiResponse<T>(data: responseData, statusCode: response.statusCode ?? 0);
    } on DioException catch (e) {
      final statusCode = e.response?.statusCode ?? 0;
      final errorMessage = _handleDioError(e, statusCode);
      return ApiResponse<T>(statusCode: statusCode, errorMessage: errorMessage);
    }
  }

  //handle error
  String _handleDioError(DioException error, int statusCode) {
    String errorMessage;
    switch (error.type) {
      case DioExceptionType.cancel:
        errorMessage = "Request to API server was cancelled";
        break;
      case DioExceptionType.connectionTimeout:
        errorMessage = "Connection timeout with API server";
        break;
      case DioExceptionType.receiveTimeout:
        errorMessage = "Receive timeout in connection with API server";
        break;
      case DioExceptionType.sendTimeout:
        errorMessage = "Send timeout in connection with API server";
        break;
      case DioExceptionType.badResponse:
        errorMessage = _handleStatusCode(statusCode);
        break;
      case DioExceptionType.unknown:
        errorMessage = "Connection to API server failed due to internet connection";
        break;
      default:
        errorMessage = "Unexpected error occurred";
        break;
    }
    return errorMessage;
  }

  String _handleStatusCode(int statusCode) {
    switch (statusCode) {
      case 400:
        return "$statusCode Bad Request";
      case 401:
        return "$statusCode Unauthorized";
      case 403:
        return "$statusCode Forbidden";
      case 404:
        return "$statusCode Not Found";
      case 500:
        return "$statusCode Internal Server Error";
      case 503:
        return "$statusCode Service Unavailable";
      default:
        return "Recive invalid status code $statusCode";
    }
  }
}
