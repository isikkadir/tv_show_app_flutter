import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:tv_show_app_flutter/models/PopularTvShows.dart';

class PopularTvShowsApiClient {
  Future<PopularTvShows> getPopularTvShows() async {
    final http.Client httpClient = http.Client();
    final url = "https://www.episodate.com/api/most-popular?page=1";
    final gelenCevap = await httpClient.get(url);

    if (gelenCevap.statusCode != 200) {
      throw Exception("Getirilemedi..");
    }

    final gelenCevapJson = jsonDecode(gelenCevap.body);
    return PopularTvShows.fromJson(gelenCevapJson);
  }
}
