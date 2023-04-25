import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/models.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;

class ApiServices {
  //  endpoint url of api
  String endpoint = "https://podcast.saikumar150.repl.co/";

//  fetch of restaurents data from api

  Future<List<CatergoriesModel>> fetchCollections() async {
    try {
      http.Response response =
          await http.get(Uri.parse("${endpoint}categories/?search="));

      if (response.statusCode == 200) {
        final List results = jsonDecode(response.body);

        return results.map((e) => CatergoriesModel.fromJson(e)).toList();
      } else {
        print('object');
        throw Exception(response.reasonPhrase);
      }
    } catch (e) {
      print(e);
    }
   return  throw Exception('response.reasonPhrase');
  }

  Future<List<PodcastModel>> fetchPodcast(search) async {
    http.Response response =
        await http.get(Uri.parse("${endpoint}podcasts/?search=$search"));

    if (response.statusCode == 200) {
      final List results = jsonDecode(response.body);
      return results.map((e) => PodcastModel.fromJson(e)).toList();
    } else {
      throw Exception(response.reasonPhrase);
    }
 
  }
}

final ApiDataProvider = Provider<ApiServices>((ref) => ApiServices());
