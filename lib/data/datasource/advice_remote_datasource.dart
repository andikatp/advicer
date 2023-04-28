import 'dart:convert';

import 'package:advice/data/exceptions/exceptions.dart';

import '../models/advice_model.dart';
import 'package:http/http.dart' as http;

abstract class AdviceRemoteDatasource {
  Future<AdviceModel> getAdviceFromRemoteDatasource();
}

class AdviceRemoteDataSourceImpl implements AdviceRemoteDatasource {
  final http.Client client;
  AdviceRemoteDataSourceImpl({required this.client});

  @override
  Future<AdviceModel> getAdviceFromRemoteDatasource() async {
    final response = await client
        .get(Uri.parse('https://api.flutter-community.com/api/v1/advice'));
    if (response.statusCode != 200) {
      throw ServerException();
    }
    final decode = jsonDecode(response.body);
    return AdviceModel.fromJson(decode);
  }
}
