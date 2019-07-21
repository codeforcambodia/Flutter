import 'dart:async';
import 'package:http/http.dart' as http;
import 'dart:convert';

/* Url api */
final String url = "https://jsonplaceholder.typicode.com";

/* Function for rest api */
/* You must give specific type of future response */
Future<dynamic> fetchData() async {
  final response = await http.get('$url/users');
  final data = json.decode(response.body);
  return data;
}