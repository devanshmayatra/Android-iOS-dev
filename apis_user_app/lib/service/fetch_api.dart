import 'package:apis_user_app/models/user_model.dart';
import 'package:http/http.dart';

class FetchApi {
  final Client client = Client();
  final String uriLink = 'https://dummyjson.com/users';

  Future<UserModel?> getUserDataResponse(String gender) async {
    final String uri = gender == "all users"
        ? uriLink
        : '${uriLink}/filter?key=gender&value=${gender}';

    final uriResponse = Uri.parse(uri);
    final response = await client.get(uriResponse);

    if (response.statusCode == 200) {
      return UserModel.fromJson(response.body);
    }
    return null;
  }
}
