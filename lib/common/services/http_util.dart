import 'package:dacs_ha4/global.dart';
import 'package:dio/dio.dart';
import 'package:retry/retry.dart';

class HttpUtil {
  late Dio dio;

  static final HttpUtil _instance = HttpUtil._internal();

  factory HttpUtil() {
    return _instance;
  }

  HttpUtil._internal() {
    BaseOptions options = BaseOptions(
      baseUrl: "http://0.0.0.0:8008/",
      connectTimeout: const Duration(seconds: 5),
      receiveTimeout: const Duration(seconds: 5),
      headers: {},
      contentType: "application/json; charset=utf-8",
      responseType: ResponseType.json,
    );
    dio = Dio(options);
    dio.interceptors.add(InterceptorsWrapper(
      onRequest: (options, handler) {
        return handler.next(options);
      },
      onResponse: (response, handler) {

        return handler.next(response);
      },
      onError: (DioException e, handler) {
        ErrorEntity eInfo = createErrorEntity(e);
        onError(eInfo);
        return handler.next(e);
      },
    ));
  }

  Map<String, dynamic>? getAuthorizationHeader() {
    var headers = <String, dynamic>{};

    var accessToken = Global.storageService.getUserToken();

    if (accessToken.isNotEmpty) {
      headers['Authorization'] = 'Bearer $accessToken';
    }

    return headers;
  }
  // Future<Response> get(String path, {
  //   Map<String, dynamic>? queryParameters,
  //   Options? options,
  // }) async {
  //   Options requestOptions = options ?? Options();
  //   requestOptions.headers = requestOptions.headers ?? {};
  //
  //   // Lấy Authorization Header nếu có
  //   Map<String, dynamic>? authorization = getAuthorizationHeader();
  //   if (authorization != null) {
  //     requestOptions.headers!.addAll(authorization);
  //   }
  //
  //   try {
  //     // Gửi yêu cầu GET
  //     var response = await dio.get(
  //       path,
  //       queryParameters: queryParameters,
  //       options: requestOptions,
  //     );
  //
  //     return response;
  //   } catch (error) {
  //     // Xử lý lỗi nếu có
  //     if (error is DioException) {
  //       ErrorEntity errorEntity = createErrorEntity(error);
  //       onError(errorEntity);
  //     }
  //     rethrow;  // Ném lại lỗi để xử lý ngoài
  //   }
  // }

  Future post(String path, {
    Object? data,
    Map<String, dynamic>? queryParameters,
    Options? options,
  }) async {
    Options requestOptions = options ?? Options();
    requestOptions.headers = requestOptions.headers ?? {};

    Map<String, dynamic>? authorization = getAuthorizationHeader();
    if (authorization != null) {
      requestOptions.headers!.addAll(authorization);
    }
    var response = await dio.post(
      path,
      data: data,
      queryParameters: queryParameters,
      options: requestOptions,
    );
    print('hhhhhhhhhhhhhhhhhhhhhhhhppppppppppppppppppppppppppp');
    print(response.data);
    return response.data;
  }
  Future post2(String path, {
    Object? data,  // Dữ liệu gửi qua body
    Options? options, // Các tùy chọn khác (nếu có)
  }) async {
    Options requestOptions = options ?? Options();
    requestOptions.headers = requestOptions.headers ?? {};

    Map<String, dynamic>? authorization = getAuthorizationHeader();
    if (authorization != null) {
      requestOptions.headers!.addAll(authorization);
    }

    var response = await dio.post(
      path,
      data: data,  // Dữ liệu gửi qua body
      options: requestOptions,
    ).timeout(const Duration(seconds: 100));
    print("-----------testjson----------------");
    print(data);

    return response.data;
  }

  Future post1(String path, {
    Object? data,
    Map<String, dynamic>? queryParameters,
    Options? options,
  }) async {
    Options requestOptions = options ?? Options();
    requestOptions.headers = requestOptions.headers ?? {};

    Map<String, dynamic>? authorization = getAuthorizationHeader();
    if (authorization != null) {
      requestOptions.headers!.addAll(authorization);
    }
    var response = await dio.post(
      path,
      data: data,
      queryParameters: queryParameters,
      options: requestOptions,
    );
    print('hhhhhhhhhhhhhhhhhhhhhhhhppppppppppppppppppp');
    print(response.data);
    return response;
  }



  Future post3(String path, {
    Object? data,
    Options? options,
  }) async {
    Options requestOptions = options ?? Options();
    requestOptions.headers = requestOptions.headers ?? {};

    Map<String, dynamic>? authorization = getAuthorizationHeader();
    if (authorization != null) {
      requestOptions.headers!.addAll(authorization);
    }

    final r = RetryOptions(maxAttempts: 3); // Số lần thử lại

    try {
      var response = await r.retry(
            () async {
          return await dio.post(
            path,
            data: data,
            options: requestOptions,
          ).timeout(const Duration(seconds: 180)); // Thời gian timeout mới
        },
        retryIf: (e) => e is DioException && e.type == DioErrorType.receiveTimeout, // Chỉ retry khi gặp timeout
      );
      print("-----------testjson----------------");
      print(data);
      return response.data;
    } catch (e) {
      print("Lỗi khi gửi yêu cầu: $e");
      throw e; // Ném lỗi ra ngoài sau khi đã thử lại
    }
  }


  Future<Map<String, dynamic>> get1(String path, {
    Map<String, dynamic>? queryParameters,
    Options? options,
  }) async {
    Options requestOptions = options ?? Options();
    requestOptions.headers = requestOptions.headers ?? {};

    Map<String, dynamic>? authorization = getAuthorizationHeader();
    if (authorization != null) {
      requestOptions.headers!.addAll(authorization);
    }
    var response = await dio.get(
      path,
      queryParameters: queryParameters,
      options: requestOptions,
    );
    print('hhhhhhhhhhhhhhhhhhhhhhhh11111111111111');
    print(response.data);
    return response.data ;
  }
  Future get(String path, {
    Map<String, dynamic>? queryParameters,
    Options? options,
  }) async {
    Options requestOptions = options ?? Options();
    requestOptions.headers = requestOptions.headers ?? {};

    Map<String, dynamic>? authorization = getAuthorizationHeader();
    if (authorization != null) {
      requestOptions.headers!.addAll(authorization);
    }
    var response = await dio.get(
      path,
      queryParameters: queryParameters,
      options: requestOptions,
    );

    return response ;
  }

}

class ErrorEntity implements Exception {
  int code = -1;
  String message = "";
  ErrorEntity({required this.code, required this.message});

  @override
  String toString() {
    if (message == "") return "Exception";

    return "Exception code $code, $message";
  }
}

ErrorEntity createErrorEntity(DioException error) {
  switch (error.type) {
    case DioExceptionType.connectionTimeout:
      return ErrorEntity(code: -1, message: "Connection timed out");
    case DioExceptionType.sendTimeout:
      return ErrorEntity(code: -1, message: "Send timed out");
    case DioExceptionType.receiveTimeout:
      return ErrorEntity(code: -1, message: "Receive timed out");
    case DioExceptionType.badCertificate:
      return ErrorEntity(code: -1, message: "Bad SSL certificates");
    case DioExceptionType.badResponse:
      switch (error.response!.statusCode) {
        case 400:
          return ErrorEntity(code: 400, message: "Request syntax error");
        case 401:
          return ErrorEntity(code: 401, message: "Permission denied");
        case 500:
          return ErrorEntity(code: 500, message: "Server internal error");
      }
      return ErrorEntity(code: -1, message: "Server bad response");
    case DioExceptionType.cancel:
      return ErrorEntity(code: -1, message: "Request canceled");
    case DioExceptionType.connectionError:
      return ErrorEntity(code: -1, message: "Connection error");
    case DioExceptionType.unknown:
      return ErrorEntity(code: -1, message: "Unknown error");
  }
}

void onError(ErrorEntity eInfo) {
  print('error.code -> ${eInfo.code}, error.message -> ${eInfo.message}');
  switch (eInfo.code) {
    case 400:
      print("Server syntax error");
      break;
    case 401:
      print("You are denied to continue");
      break;
    case 500:
      print("Internal server error");
      break;
    default:
      print("Unknown error");
      break;
  }
}
