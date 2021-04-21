import 'package:tv_show_app_flutter/api/populartvshow_api_client.dart';
import 'package:tv_show_app_flutter/models/PopularTvShows.dart';

import '../locator.dart';

class PopularTvShowsRepository {
  PopularTvShowsApiClient popularTvShowsApiClient =
      locator<PopularTvShowsApiClient>();

  Future<PopularTvShows> getPopularTvShows(int pageNo) async {
    return await popularTvShowsApiClient.getPopularTvShows(pageNo);
  }
}
