import 'package:dio/dio.dart';
import 'package:xml/xml.dart';

import '../model/covid_statistics.dart';

class CovidStatisticsRepository {
  late var _dio;
  CovidStatisticsRepository() {
    _dio = Dio(
      BaseOptions(
        baseUrl: "http://openapi.data.go.kr",
        queryParameters: {'ServiceKey': 'g2/C8XhSQcaPDQb9OjnnvabIkHuwOAtkE1Ec1VzX5Nnv/vi0kKMQa2XxrWKVxv6o7T4afuCW3cEQxsaZpTvTQQ=='},
      ),
    );
  }

  Future<List<Covid19StatisticsModel>> fetchCovid19Statistics({String? startDate, String? endDate}) async {
    var query = Map<String, String>();
    if (startDate != null) query.putIfAbsent('startCreateDt', () => startDate);
    if (endDate != null) query.putIfAbsent('endCreateDt', () => endDate);
    var response = await _dio.get(
      '/openapi/service/rest/Covid19/getCovid19InfStateJson'
      ,queryParameters: query
    );
    final document = XmlDocument.parse(response.data);
    final results = document.findAllElements('item');
    if (results.isNotEmpty) {
      return results .map<Covid19StatisticsModel>(
        (element) => Covid19StatisticsModel.fromXml(element)).toList();
    } else {
      return Future.value(null);
    }
  }
}