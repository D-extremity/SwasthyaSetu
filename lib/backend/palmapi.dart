import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:swasthya_setu/openapikey.dart';

Future<String> makeApiRequest(String prompt) async {
  final String apiUrl =
      'https://generativelanguage.googleapis.com/v1beta2/models/text-bison-001:generateText?key=$tokenKey';

  final body = {
    'prompt': {
      'text': prompt,
    },
     "temperature": 1.0,
            "candidateCount": 2
  };
  final response = await http.post(
    Uri.parse(apiUrl),
    headers: {
      'Content-Type': 'application/json',
    },
    body: jsonEncode(body),
  );

  print(response.statusCode);
  if (response.statusCode == 200) {
    print(jsonDecode(response.body));
    String s = jsonDecode(response.body)["candidates"][0]["output"];
    print(jsonDecode(response.body)["candidates"][0]["output"]);
    return s;
    // Handle the API response
  } else {
    return "Try again";
    // Handle error
  }
}
