import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tv_show_app_flutter/models/PopularTvShows.dart';
import 'package:tv_show_app_flutter/view_models/PopularTvShowsViewModel.dart';
import 'package:tv_show_app_flutter/widgets/ItemContainer.dart';

class HomePage extends StatelessWidget {
  PopularTvShowsViewModel _viewModel;
  List<TvShow> tvShows = [];

  @override
  Widget build(BuildContext context) {
    _viewModel = Provider.of<PopularTvShowsViewModel>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("Popular Tv Shows"),
      ),
      body: FutureBuilder(
        future: getShows(),
        builder: (context, snapshot) {
          if (tvShows.isNotEmpty) {
            return ListView.builder(
                itemCount: tvShows.length,
                itemBuilder: (context, index) {
                  return ItemContainer(index, tvShows, context);
                });
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }

  Future<void> getShows() async {
    print("tvShows getiriliyor");
    await _viewModel.getPopularTvShows();
    tvShows = _viewModel.getirilenTvShow.tvShows;
    print("Tv Shows getirildi." + tvShows.isEmpty.toString());
  }
}
/*
* Temporary Tv Show
* TvShow tempTvShow = TvShow(
      id: 35624,
      name: "TheFlash",
      startDate: null,
      permalink: null,
      endDate: null,
      country: "US",
      network: "TheCW",
      status: "Running",
      imageThumbnailPath:
          "https://static.episodate.com/images/tv-show/thumbnail/35624.jpg");*/
