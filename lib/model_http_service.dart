import 'dart:convert';

import 'package:example/example_model.dart';
import 'package:http/http.dart' as http;

class ModelHttpService {
  Future<List<ExampleModel>> getExamples() async {
    Uri url = Uri.parse(
        "https://example-6211c-default-rtdb.firebaseio.com/example.json");

    final response = await http.get(url);
    final data = jsonDecode(response.body);
    List<ExampleModel> info = [];

    if (data != null) {
      data.forEach((key, value) {
        info.add(
          ExampleModel.fromJson(value),
        );
      });
    } else {}
    return info;
  }

  Future<ExampleModel> addUser() async {
    Uri url = Uri.parse(
        "https://example-6211c-default-rtdb.firebaseio.com/example.json");

    final response =await http.post(
      url,
      body: jsonEncode({
        'name': "Behruz",
        'imageUrl':
            "https://cdn.motor1.com/images/mgl/MkO9NN/s1/future-supercars.webp"
      }),
    );

    final data = jsonDecode(response.body);
    print(data);

    return data;
  }
}
