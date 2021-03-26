import 'package:register/configs/config.dart';

class ApiRoutes {
  static final ApiRoutes _instance = ApiRoutes.internal();

  factory ApiRoutes() {
    return _instance;
  }

  ApiRoutes.internal();

  static final image = parseRoutes(
    apiName: 'getAvatar',
  );

  static Uri parseRoutes({
    String apiName,
  }) {
    return Uri.parse(Config.api + apiName);
  }

}