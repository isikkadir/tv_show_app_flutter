import 'package:flutter/material.dart';
import 'package:tv_show_app_flutter/models/PopularTvShows.dart';

Widget ItemContainer(int index, List<TvShow> tvShows, BuildContext context) {
  return Container(
    width: MediaQuery.of(context).size.width,
    height: 165,
    color: Colors.blue.shade900,
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Container(
          width: 130,
          height: 150,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(15.0),
            child: Image.network(
              tvShows[index].imageThumbnailPath,
              fit: BoxFit.fill,
            ),
          ),
        ),
        Container(
          width: (MediaQuery.of(context).size.width - 130),
          height: 120,
          color: Colors.blue.shade700,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                tvShows[index].name,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 5,
              ),
              Text(
                tvShows[index].network + " (" + tvShows[index].country + ")",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 22.0,
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(
                height: 3,
              ),
              Text(
                "Started on: " + tvShows[index].startDate.toString(),
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 16.0,
                  fontWeight: FontWeight.w300,
                ),
              ),
              SizedBox(
                height: 3,
              ),
              Text(
                tvShows[index].status,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 19.0,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          ),
        )
      ],
    ),
  );
}
