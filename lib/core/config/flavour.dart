
import 'package:test_app/core/network/network_constants.dart';

enum Flavor {
  dev,
  prod,
}

class F {
  static Flavor? appFlavor;

  static String get name => appFlavor?.name ?? '';

  static String get baseUrl {
    switch (appFlavor) {
      case Flavor.dev:
        return baseUrlApi;
      case Flavor.prod:
        return baseUrlApi;
      default:
        return '';
    }
  }
}