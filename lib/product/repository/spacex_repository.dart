import 'package:http/http.dart' as http;

class SpacexRepository {
  Future getLatestLaunch() async {
    var response = await http
        .get(Uri.parse('https://api.spacexdata.com/v4/launches/latest'));
    if (response.statusCode == 200) {
    } else {
      throw Exception('Failed to load latest launch');
    }
  }
}
