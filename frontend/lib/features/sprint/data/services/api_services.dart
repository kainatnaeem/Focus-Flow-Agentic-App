
import 'package:dio/dio.dart';

class ApiService {
  final Dio _dio = Dio(
    BaseOptions(
      baseUrl: 'http://10.0.2.2:8000',
      headers: {
        'Content-Type': 'application/json',
      },
    ),
  );

  Future<String> generatePlan({
    required String goal,
    required int minutes,
  }) async {
    final response = await _dio.post(
      '/generate-plan',
      data: {
        'goal': goal,
        'minutes': minutes,
      },
    );

    return response.data['plan'];
  }
}
