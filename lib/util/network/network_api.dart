import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:news/core/constants/exception_enums.dart';
import 'package:news/core/error/exceptions/server_exceptions/custom_exceptions.dart';
import 'package:news/core/error/exceptions/server_exceptions/exceptions.dart';
import 'package:news/util/network/api_url.dart';

class DioHelper {
  static late Dio dio;

  /// Initializing dio baseUrl
  static init() {
    try {
      dio = Dio(
        BaseOptions(
          baseUrl: ApiUrl.baseUrl,
          headers: {
            // 'Accept-Language': 'en',
            'Accept': 'application/json',
          },
          receiveDataWhenStatusError: true,
        ),
      );
    } on DioExceptionType catch (exception) {
      /// Get custom massage for the exception
      final errorMessage =
          DioExceptions.fromDioError(exception as DioException).errorType;

      /// throw custom exception
      throw CustomException(errorMessage, 'error.png');
    } catch (e) {
      throw CustomException(CustomStatusCodeErrorType.unExcepted, 'error.png');
    }
  }

  ///use this method to get data from api
  static Future<Response<dynamic>> getData({
    required String url,
    Map<String, dynamic>? queryParameters,
  }) async {
    try {
      final response = await dio.get(url, queryParameters: queryParameters);

      return response;
    } on DioException catch (exception) {
      /// Get custom message for the exception
      debugPrint(
        "here is the error from dio get data ${exception.response!.data["message"]} ",
      );

      final errorType = DioExceptions.fromDioError(exception).errorType;
      final errorMessage = DioExceptions.fromDioError(exception).errorMassage;

      /// throw custom exception
      throw CustomException(errorType, 'error.png', errorMassage: errorMessage);
    } catch (e) {
      throw CustomException(CustomStatusCodeErrorType.unExcepted, 'error.png');
    }
  }

  ///use this method to send data to api
  static Future<Response<dynamic>> postData({
    required String url,
    required FormData data,
  }) async {
    try {
      final response = await dio.post<dynamic>(url, data: data);

      return response;
    } on DioException catch (exception) {
      if (exception.response != null) {
        final errorType = DioExceptions.fromDioError(exception).errorType;
        final errorMessage = DioExceptions.fromDioError(exception).errorMassage;

        throw CustomException(
          errorType,
          'error.png',
          errorMassage: errorMessage,
        );
      } else {
        throw CustomException(
          CustomStatusCodeErrorType.unExcepted,
          'error.png',
          errorMassage: 'un expected',
        );
      }
    }
  }

  ///use this method to update data in api
  static Future<Response<dynamic>> putData({
    required String url,
    required FormData data,
  }) async {
    try {
      final response = await dio.put<dynamic>(url, data: data);
      debugPrint(response.statusCode.toString());
      debugPrint(response.statusMessage);

      return response;
    } on DioException catch (exception) {
      if (exception.response != null) {
        debugPrint(
          "here is the error from dio get data ${exception.response!.data["message"]} ",
        );
        final errorType = DioExceptions.fromDioError(exception).errorType;
        final errorMessage = DioExceptions.fromDioError(exception).errorMassage;
        throw CustomException(
          errorType,
          'error.png',
          errorMassage: errorMessage,
        );
      } else {
        // Handle non-response error
        throw CustomException(
          CustomStatusCodeErrorType.unExcepted,
          'error.png',
        );
      }
    }
  }

  ///use this method to delete data in api
  static Future<Response<dynamic>> deleteData({required String url}) async {
    try {
      final response = await dio.delete<dynamic>(url);
      debugPrint(response.statusCode.toString());
      debugPrint(response.statusMessage);

      return response;
    } on DioException catch (exception) {
      if (exception.response != null) {
        debugPrint(
          "here is the error from dio get data ${exception.response!.data["message"]} ",
        );

        final errorType = DioExceptions.fromDioError(exception).errorType;
        final errorMessage = DioExceptions.fromDioError(exception).errorMassage;
        throw CustomException(
          errorType,
          'error.png',
          errorMassage: errorMessage,
        );
      } else {
        throw CustomException(
          CustomStatusCodeErrorType.unExcepted,
          'error.png',
        );
      }
    }
  }
}
