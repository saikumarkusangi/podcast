import 'dart:convert';
import 'package:flutter_application_1/models/models.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart';

class ApiServices {
  //  endpoint url of api
  String endpoint = "https://podcast.saikumar150.repl.co/";

//  fetch of restaurents data from api

  Future<List<CatergoriesModel>> fetchCollections() async {

    Response response = await get(Uri.parse("${endpoint}categories/"));

    if (response.statusCode == 200) {
      final List results = jsonDecode(response.body)['data'];
      return results.map((e) => CatergoriesModel.fromJson(e)).toList();
    } else {
      throw Exception(response.reasonPhrase);
    }
  }
}

final ApiDataProvider = Provider<ApiServices>((ref) => ApiServices());
