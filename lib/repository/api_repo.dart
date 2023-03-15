import 'package:restapicourse/services/remote_service.dart';

import '../models/quran.dart';

class ApiRepo {
  final ApiService apiService;

  ApiRepo(this.apiService);
  Future<List<Reciter>?> getReciters() async {
    final response = await apiService.getReciters();
    if (response != null) {
      final data = response.data['reciters'] as List<dynamic>;
      return data
          .map(
            (singleRec) => Reciter.fromJson(singleRec),
          )
          .toList();
    } else {
      throw Exception('Failed to load data');
    }
  }
}
