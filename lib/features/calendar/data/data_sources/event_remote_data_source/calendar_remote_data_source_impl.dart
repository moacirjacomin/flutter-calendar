import 'dart:convert';

import 'package:http/http.dart' as http;

import '../../model/dailly_event_model.dart';
import 'calendar_remote_data_source.dart'; 

class CalendarRemoteDataSourceImpl implements CalendarRemoteDataSource {
  final http.Client client;

  CalendarRemoteDataSourceImpl({required this.client});

  @override
  Future<List<DaillyEventModel>> getCalendars({required String month, required String year}) async {
    // FAKE example
    await Future.delayed(Duration(seconds: 2));

    String fakeData = '''
      [
        {
          "id": "668164e760dbe07a2fd9df5b",
          "date": "2024-09-02",
          "isTaken": false,
          "medication": {
              "id": "668164e760dbe07a2fd9df5b",
              "type": "Medicacao",
              "name": "Tadalafila", 
              "dosage": "500ml (1 comprimido)",
              "notes": "" 
          }
        },     
        {
          "id": "668164e760dbe0337a2fd9df5b",
          "date": "2024-09-03",
          "isTaken": true,
          "medication": {
              "id": "668164e760dbe07a2fd9df5b",
              "type": "Medicacao",
              "name": "Tadalafila", 
              "dosage": "500ml (1 comprimido)",
              "notes": "" 
          }
        } 
      ]
      ''';

    final fakeJson = json.decode(fakeData);
    return DaillyEventModel.fromJsonList(fakeJson);

    // List<String>? cookies = ShardPrefHelper.getCookie();
    // if (cookies == null || cookies.isEmpty) {
    //   throw const ServerException(message: 'No cookies found');
    // }
    // String cookieHeader = cookies.join('; ');
    // String url = '$kBaseUrl/wall/fetch-posts';
    // Map<String, dynamic> queryParameters = {'home': '$isHome'};

    // final response = await client.get(
    //   Uri.parse(url).replace(queryParameters: queryParameters),
    //   headers: <String, String>{
    //     'Cookie': cookieHeader,
    //   },
    // );

    // if (response.statusCode == 200) {
    //   final List<dynamic> jsonData = jsonDecode(response.body);
    //   return jsonData.map((data) => CommunityModel.fromJson(data)).toList();
    // } else {
    //   final message = jsonDecode(response.body)['msg'] ?? 'Unknown error';
    //   throw ServerException(message: message);
    // }
  }
}
