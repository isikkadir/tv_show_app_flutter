import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tv_show_app_flutter/models/PopularTvShows.dart';
import 'package:tv_show_app_flutter/view_models/PopularTvShowsViewModel.dart';
import 'package:tv_show_app_flutter/widgets/ItemContainer.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  PopularTvShowsViewModel _viewModel;
  List<TvShow> tvShows = [];
  ScrollController _scrollController = ScrollController();
  int _currentPage = 1;
  int _maxPage = 1;

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        if (_currentPage <= _maxPage) {
          print("Yeni elemanlar geitr");
          _currentPage++;
          _viewModel.notifyListeners();
        }
      }
    });
  }

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
                controller: _scrollController,
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
    await _viewModel.getPopularTvShows(_currentPage);
    tvShows += _viewModel.getirilenTvShow.tvShows;
    print("Tv Shows getirildi." + tvShows.isEmpty.toString());
    _maxPage = _viewModel.getirilenTvShow.pages;
    print("Tv Show:" + tvShows.length.toString());
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
