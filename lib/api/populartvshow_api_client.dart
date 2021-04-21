import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:tv_show_app_flutter/models/PopularTvShows.dart';

class PopularTvShowsApiClient {
  Future<PopularTvShows> getPopularTvShows(int pageNo) async {
    final http.Client httpClient = http.Client();
    final baseUrl = "https://www.episodate.com/api/most-popular?page=";
    String formattedUrl = baseUrl + pageNo.toString();
    final gelenCevap = await httpClient.get(formattedUrl);

    if (gelenCevap.statusCode != 200) {
      throw Exception("Getirilemedi..");
    }

    final gelenCevapJson = jsonDecode(gelenCevap.body);
    return PopularTvShows.fromJson(gelenCevapJson);
  }
}
