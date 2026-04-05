import 'dart:io';

import 'package:dio/dio.dart';

import 'api_state.dart';

/// A generic wrapper for Dio API calls that handles errors uniformly.
///
/// [apiCall] should perform the Dio request and return the parsed result.
///
/// Returns [ApiSuccess] with the data on success, or [ApiError] with a
/// user-friendly message on failure.
///
/// Example:
/// ```dart
/// final result = await safeApiCall(() async {
///   final response = await dio.get('/endpoint');
///   return MyModel.fromJson(response.data);
/// });
///
/// switch (result) {
///   case ApiSuccess(:final data):
///     // use data
///   case ApiError(:final message):
///     // show message
/// }
/// ```
Future<ApiState<T>> safeApiCall<T>(Future<T> Function() apiCall) async {
  try {
    final result = await apiCall();
    return ApiSuccess(result);
  } on DioException catch (e) {
    return switch (e.type) {
      DioExceptionType.connectionTimeout ||
      DioExceptionType.sendTimeout ||
      DioExceptionType.receiveTimeout =>
        const ApiError('Connection timed out. Please try again.'),
      DioExceptionType.connectionError =>
        const ApiError('No internet connection. Please check your network.'),
      DioExceptionType.badResponse =>
        ApiError('Server error: ${e.response?.statusCode} - ${e.response?.statusMessage}'),
      DioExceptionType.cancel =>
        const ApiError('Request was cancelled.'),
      _ => ApiError('Network error: ${e.message}'),
    };
  } on SocketException {
    return const ApiError('No internet connection. Please check your network.');
  } catch (e) {
    return ApiError('An unexpected error occurred: $e');
  }
}
