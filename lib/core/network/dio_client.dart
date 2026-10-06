import 'package:dio/dio.dart';

/// Lightweight Dio network client stub for ClientForge.
/// Real base URL and auth interceptors will be attached during API integration phase.
class DioClient {
  final Dio dio;

  DioClient({Dio? dioOverride})
      : dio = dioOverride ??
            Dio(
              BaseOptions(
                connectTimeout: const Duration(seconds: 15),
                receiveTimeout: const Duration(seconds: 15),
                headers: {
                  'Content-Type': 'application/json',
                  'Accept': 'application/json',
                },
              ),
            );
}
