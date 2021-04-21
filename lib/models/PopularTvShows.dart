import 'dart:convert';

PopularTvShows popularTvShowsFromJson(String str) =>
    PopularTvShows.fromJson(json.decode(str));

String popularTvShowsToJson(PopularTvShows data) => json.encode(data.toJson());

class PopularTvShows {
  PopularTvShows({
    this.total,
    this.page,
    this.pages,
    this.tvShows,
  });

  String total;
  int page;
  int pages;
  List<TvShow> tvShows;

  factory PopularTvShows.fromJson(Map<String, dynamic> json) => PopularTvShows(
        total: json["total"] == null ? null : json["total"],
        page: json["page"] == null ? null : json["page"],
        pages: json["pages"] == null ? null : json["pages"],
        tvShows: json["tv_shows"] == null
            ? null
            : List<TvShow>.from(
                json["tv_shows"].map((x) => TvShow.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "total": total == null ? null : total,
        "page": page == null ? null : page,
        "pages": pages == null ? null : pages,
        "tv_shows": tvShows == null
            ? null
            : List<dynamic>.from(tvShows.map((x) => x.toJson())),
      };
}

class TvShow {
  TvShow({
    this.id,
    this.name,
    this.permalink,
    this.startDate,
    this.endDate,
    this.country,
    this.network,
    this.status,
    this.imageThumbnailPath,
  });

  int id;
  String name;
  String permalink;
  String startDate;
  dynamic endDate;
  String country;
  String network;
  String status;
  String imageThumbnailPath;

  factory TvShow.fromJson(Map<String, dynamic> json) => TvShow(
        id: json["id"] == null ? null : json["id"],
        name: json["name"] == null ? null : json["name"],
        permalink: json["permalink"] == null ? null : json["permalink"],
        startDate: json["start_date"] == null ? null : json["start_date"],
        endDate: json["end_date"],
        country: json["country"] == null ? null : json["country"],
        network: json["network"] == null ? null : json["network"],
        status: json["status"] == null ? null : json["status"],
        imageThumbnailPath: json["image_thumbnail_path"] == null
            ? null
            : json["image_thumbnail_path"],
      );

  Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "name": name == null ? null : name,
        "permalink": permalink == null ? null : permalink,
        "start_date": startDate == null ? null : startDate,
        "end_date": endDate,
        "country": country == null ? null : country,
        "network": network == null ? null : network,
        "status": status == null ? null : status,
        "image_thumbnail_path":
            imageThumbnailPath == null ? null : imageThumbnailPath,
      };
}
