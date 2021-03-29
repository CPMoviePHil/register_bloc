import 'package:register/configs/configs.dart';
import 'dart:math';

abstract class DownloadRepository {}

class ImageRepository implements DownloadRepository {

  Future<dynamic> getDownload({
    int userID,
  }) async {
    final random = Random();
    // Simulate some network exception
    /*if (random.nextBool()) {
      throw NetworkException();
    }*/
    List<String> studentIDs = ['371', '372', '373'];
    random.nextInt(2);
    final data = RequestsManager.post(
      uri: ApiRoutes.image,
      params: {
        "id": studentIDs[random.nextInt(2)],
      },
    );
    return data;
  }

}

class NetworkException implements Exception {}
