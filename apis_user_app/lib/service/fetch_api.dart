import 'dart:math';

import 'package:apis_user_app/models/user_model.dart';
import 'package:http/http.dart';

class FetchApi {
  final Client client = Client();
  final String uriLink = 'https://dummyjson.com/users';

  Future<UserModel?> getUserDataResponse(List users) async {
    int offset = users.length;
    int limit = 30;
    String url = '$uriLink?limit=$limit&skip=$offset';

    log(limit);

    final uriResponse = Uri.parse(url);
    final response = await client.get(uriResponse);

    if (response.statusCode == 200) {
      return UserModel.fromJson(response.body);
    }
    return null;
  }
}
