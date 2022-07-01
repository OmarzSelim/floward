import 'package:internet_connection_checker/internet_connection_checker.dart';

class InternetConnectionHandler {
  static Future<bool> checkInternetConnection() async {
    bool hasInternet = await InternetConnectionChecker().hasConnection;
    // ignore: avoid_print
    print("hasInternet: $hasInternet");
    return hasInternet;
  }
}
