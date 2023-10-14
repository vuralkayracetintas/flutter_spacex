import 'package:dio/dio.dart';
import 'package:spacex_flutter/core/next_launch/next_launch_bloc.dart';
import 'package:spacex_flutter/product/constans/string_constans.dart';
import 'package:spacex_flutter/product/models/latest_model.dart';
import 'package:spacex_flutter/product/models/next_model.dart';

class SpacexRepository {
  final String _baseUrl = StringConstans.baseUrl;

  final Dio _dio = Dio();

  Future<LatestModel> getLatestLaunch() async {
    try {
      final response = await _dio.get(_baseUrl);
      if (response.statusCode == 200) {
        return LatestModel.fromMap(response.data);
      } else {
        throw Exception('HTTP isteği başarısız: ${response.statusCode}');
      }
    } catch (error) {
      throw Exception('API isteği sırasında hata oluştu aaaa: $error');
    }
  }
}
