import 'package:register/configs/configs.dart';
import 'dart:math';

abstract class DownloadRepository {
  /// Throws [NetworkException].
  Future<dynamic> getDownload();
}

class ImageRepository implements DownloadRepository {

  @override
  Future getDownload({
    int userID,
  }) async {
    final random = Random();
    // Simulate some network exception
    if (random.nextBool()) {
      throw NetworkException();
    }
    final data = RequestsManager.post(
      uri: ApiRoutes.image,
      params: {
        'user_id': '1',
      },
    );
    return data;
  }

}

class NetworkException implements Exception {}
