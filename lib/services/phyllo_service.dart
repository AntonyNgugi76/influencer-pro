import 'dart:developer';
import '../utils/generate_random_string.dart';
import '../utils/http.dart';
import '../utils/result.dart';

class PhylloRepository {
  PhylloRepository._();

  static PhylloRepository get instance => PhylloRepository._();

  final Http _http = Http();

  Future<String?> getUserId(String env) async {
    Result result = await _http.request(
      requestType: RequestType.post,
      url: '$env/v1/users',
      body: {'name': getRadomString(8), 'external_id': getRadomString(20)},
    );
    if (result is Success) {
      return result.value['id'];
    } else {
      log((result as Error).message, name: 'getUserId');
      return null;
    }
  }

  Future<String?> getSdkToken(String env, {required String userId}) async {
    Result result = await _http.request(
      requestType: RequestType.post,
      url: '$env/v1/sdk-tokens',
      body: {
        'user_id': userId,
        'products': ['IDENTITY', 'ENGAGEMENT', 'INCOME'],
      },
    );
    if (result is Success) {
      return result.value['sdk_token'];
    } else {
      log((result as Error).message, name: 'getSdkToken');
      return null;
    }
  }
}
