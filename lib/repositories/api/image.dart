import 'package:register/configs/configs.dart';
import 'dart:math';

abstract class DownloadRepository {}

class ImageRepository implements DownloadRepository {

  Future<dynamic> getDownload({
    String userID,
  }) async {
    final random = Random();
    // Simulate some network exception
    /*if (random.nextBool()) {
      throw NetworkException();
    }*/

    final data = RequestsManager.post(
      uri: ApiRoutes.image,
      params: {
        "id": userID,
      },
    );
    return data;
  }

}

class NetworkException implements Exception {}
