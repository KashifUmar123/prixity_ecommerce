import 'package:get/get.dart';

abstract class INavigator {
  Future<T?>? pushNamed<T>(String route, {dynamic arguments});

  void pop<T>({T? result});

  void popUntil(String route);

  Future<T?>? pushReplacementNamed<T>(String route, {dynamic arguments});
}

class NavigatorImpl extends INavigator {
  @override
  void pop<T>({T? result}) {
    Get.back<T>(result: result);
  }

  @override
  void popUntil(String route) {
    Get.until((data) => data.settings.name == route);
  }

  @override
  Future<T?>? pushNamed<T>(String route, {dynamic arguments}) {
    return Get.toNamed(route, arguments: arguments);
  }

  @override
  Future<T?>? pushReplacementNamed<T>(String route, {dynamic arguments}) {
    return Get.offAllNamed(route, arguments: arguments);
  }
}
