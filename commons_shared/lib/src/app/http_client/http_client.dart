import 'package:commons_dependencies/main.dart';

final $HttpClient = Bind.lazySingleton(
  (i) => HttpClient(),
  export: true,
);

class HttpClient extends DioForNative {
  HttpClient()
      : super(
          BaseOptions(
            // baseUrl: 'http://localhost:8080',
            baseUrl: "http://192.168.100.84:8080",
            connectTimeout: 60 * 1000,
            receiveTimeout: 60 * 1000,
          ),
        );
}
