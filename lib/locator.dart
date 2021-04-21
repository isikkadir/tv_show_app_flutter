import 'package:get_it/get_it.dart';
import 'package:tv_show_app_flutter/api/populartvshow_api_client.dart';
import 'package:tv_show_app_flutter/repository/PopularTvShowsRepository.dart';
import 'package:tv_show_app_flutter/view_models/PopularTvShowsViewModel.dart';

GetIt locator = GetIt.instance;

void setupLocator() {
  locator.registerLazySingleton(() => PopularTvShowsRepository());
  locator.registerLazySingleton(() => PopularTvShowsApiClient());
  locator.registerFactory(() => PopularTvShowsViewModel());
}
