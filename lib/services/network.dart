import 'package:http/http.dart' as http;

class NetworkLayer {
  Future<String> get(apiUrl) async {
    var response = await http.get(apiUrl);
    if (response.statusCode == 200 && response.statusCode <= 209) {
      return response.body;
    }
    throw Exception('Api Error or Connection Error');
  }
}
