import 'package:dio/dio.dart';
import 'package:spacex_flutter/product/models/past_model.dart';

class PastLaunchRepository {
  final String _pastUrl = 'https://api.spacexdata.com/v5/launches/past';
  final Dio _dio = Dio();

  Future<List<PastLaunchModel>> getPastLaunch() async {
    try {
      final response = await _dio.get(_pastUrl);
      if (response.statusCode == 200) {
        final List<dynamic> dataList = response.data;
        final List<PastLaunchModel> launchModels =
            dataList.map((data) => PastLaunchModel.fromMap(data)).toList();

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
