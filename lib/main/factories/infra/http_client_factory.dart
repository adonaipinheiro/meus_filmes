import 'package:http/http.dart';
import 'package:meus_filmes/infra/http/http_adapter.dart';

HttpAdapter makeHttpClient() => HttpAdapter(client: Client());
