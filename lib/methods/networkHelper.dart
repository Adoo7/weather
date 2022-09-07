import 'dart:convert';

import 'package:http/http.dart' as http;

const apiKey = 'c10524f7495e03ec2c220a01b91c5081';

class NetworkHelper {
  NetworkHelper(this.inputURL);
  final inputURL;

  Future getData() async {
    http.Response response = await http.get(Uri.parse(inputURL));
    if (response.statusCode == 200) {
      String data = response.body;
      return jsonDecode(data);
    } else {
      print(response.statusCode);
      print('API call fail');
      return 'null';
    }
  }
}
