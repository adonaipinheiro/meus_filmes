import 'dart:convert';

import 'package:http/http.dart';
import 'package:meus_filmes/data/http/http_client.dart';
import 'package:meus_filmes/data/http/http_error.dart';

class HttpAdapter extends HttpClient {
  HttpAdapter({required this.client});

  final Client client;

  @override
  Future<dynamic> get({required String url}) async {
    var response = Response('', 500);
    try {
      response = await client.get(Uri.parse(url));
    } catch (error) {
      throw HttpError.serverError;
    }
    switch (response.statusCode) {
      case 200:
        return response.body.isEmpty ? null : jsonDecode(response.body);
      case 204:
        return null;
      case 400:
        throw HttpError.badRequest;
      case 401:
        throw HttpError.unauthorized;
      case 403:
        throw HttpError.forbidden;
      case 404:
        throw HttpError.notFound;
      default:
        throw HttpError.serverError;
    }
  }
}
