import 'dart:convert';

import 'package:http/http.dart' as http;

class QuizRepository {
  static String apiKey = 'https://opentdb.com/api.php?amount=10';

  static Future getQuizQuestionAnwer() async {
    try {
      final response = await http.get(Uri.parse(apiKey));
      if (response.statusCode == 200) {
        var responseData = jsonDecode(response.body)['results'];
        List result = responseData as List;
        print('result: $result');
        return result;
      }
    } catch (e) {
      print("Error: ${e.toString()}");
    }
  }
}
