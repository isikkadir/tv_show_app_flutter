import 'package:flutter/material.dart';
import 'package:tv_show_app_flutter/locator.dart';
import 'package:tv_show_app_flutter/models/PopularTvShows.dart';
import 'package:tv_show_app_flutter/repository/PopularTvShowsRepository.dart';

class PopularTvShowsViewModel with ChangeNotifier {
  PopularTvShowsRepository _repository = locator<PopularTvShowsRepository>();
  PopularTvShows _getirilenTvShow;

  PopularTvShows get getirilenTvShow => _getirilenTvShow;

  set getirilenTvShow(PopularTvShows value) {
    _getirilenTvShow = value;
  }

  PopularTvShowsViewModel() {
    _getirilenTvShow = PopularTvShows();
  }

  Future<PopularTvShows> getPopularTvShows() async {
    try {
      _getirilenTvShow = await _repository.getPopularTvShows();
    } catch (e) {
      print("Hata çıktı view Model" + e.toString());
    }
    return _getirilenTvShow;
  }
}
