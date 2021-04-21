import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tv_show_app_flutter/locator.dart';
import 'package:tv_show_app_flutter/view_models/PopularTvShowsViewModel.dart';
import 'package:tv_show_app_flutter/widgets/HomePage.dart';

void main() {
  setupLocator();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Popular Tv Shows',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      debugShowCheckedModeBanner: false,
      home: ChangeNotifierProvider(
          create: (context) => locator<PopularTvShowsViewModel>(),
          child: HomePage()),
    );
  }
}
