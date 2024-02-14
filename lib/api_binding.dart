import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ApiClient {
  Future<void> sendLatLong({id, latitude, longitude}) async {
    try {
      var headers = {
        'Authorization':
            'Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczpcL1wvYnVnZ3lodWIuY29tXC8iLCJhdWQiOiJodHRwczpcL1wvYnVnZ3lodWIuY29tXC8iLCJpYXQiOjE3MDc5MDA1MzMsIm5iZiI6MTcwNzkwMDU2MywiZXhwIjoxNzA4MDczMzMzLCJkYXRhIjoiT21rYXJnaGFyZ2UifQ.0mWs1JcmSb9tCuozfsChDC8nxvgw2-KAiyLH-mxQYL0'
      };
      var request = http.MultipartRequest(
          'POST',
          Uri.parse(
              'https://dev.buggyhub.com/dev_buggyhub/index.php/sarathi/v1/Sarathi/updatelatlong'));

      request.fields.addAll({
        'sarathi_id': id.toString(),
        'sarathi_latitude': latitude.toString(),
        'sarathi_longitude': longitude.toString()
      });

      request.headers.addAll(headers);

      http.StreamedResponse response = await request.send();

      if (response.statusCode == 200) {
        var data = await response.stream.bytesToString();
        debugPrint(jsonDecode(data).toString());
        debugPrint('Success');
      } else {
        debugPrint(response.statusCode.toString());
      }
    } catch (e) {
      debugPrint(e.toString());
    }
  }
}
