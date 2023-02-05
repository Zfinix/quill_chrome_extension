import 'package:quill/core/model.dart';
import 'package:http/http.dart' as http;
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'api_provider.g.dart'; // part of code used with dart:build to generate the api_provider.g.dart file

@riverpod // this function is a provider
Future<QuillBotModel> fetchQuillMessage(
  FetchQuillMessageRef ref, {
  // message to be sent to the quillbot api
  required String message,
}) async {
  // declare a final variable to hold the API URL
  final quillBotApiBaseUrl =
      'https://quillbot.com/api/paraphraser/single-paraphrase/2?text=${Uri.encodeComponent(message)}'
      '&strength=2&autoflip=false&wikify=false&fthresh=-1&inputLang=en&quoteIndex=-1';

  // make an HTTP GET request to the API
  final response = await http.get(
    Uri.parse(quillBotApiBaseUrl), // parse the API URL string into a Uri object
    headers: {
      'accept':
          'text/html,application/xhtml+xml,application/xml;q=0.9,image/avif,image/webp,image/apng,*/*;q=0.8',
      'accept-language': 'en-GB,en;q=0.9',
      'cache-control': 'no-cache',
    },
  );

  // return an instance of QuillBotModel parsed from the API response
  return QuillBotModel.fromJson(response.body);
}
