import 'package:dio/dio.dart';
import 'package:spacex_flutter/product/constans/string_constans.dart';
import 'package:spacex_flutter/product/models/next_model.dart';

class NextLaunchRepository {
  final String _nextUrl = StringConstans.baseUrlNext;
  final Dio _dio = Dio();
  Future<List<NextLaunchModel>> getNextLaunch() async {
    try {
      final response = await _dio.get(_nextUrl);
      if (response.statusCode == 200) {
        final List<dynamic> dataList = response.data;

        final List<NextLaunchModel> launchModels =
            dataList.map((data) => NextLaunchModel.fromMap(data)).toList();

        return launchModels;
      } else {
        throw Exception(
            'HTTP isteği başarısız: ${response.statusCode}, Hata mesajı: ${response.data}');
      }
    } catch (error) {
      throw Exception('API isteği sırasında hata oluştu eee: $error');
    }
  }
}
