import 'package:flutter/material.dart';
import 'package:tv_show_app_flutter/models/PopularTvShows.dart';

class DetailPage extends StatelessWidget {
  TvShow tvShows;

  DetailPage({Key key, @required this.tvShows}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Kadir"),
      ),
      body: Container(
        child: Text("Gelen tv show" + tvShows.name),
      ),
    );
  }
}
