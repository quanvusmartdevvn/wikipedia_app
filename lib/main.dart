import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wikipedia_app/ui/modules/bookmark/view_model/bookmark_view_model.dart';
import 'package:wikipedia_app/ui/modules/history/view_model/history_view_model.dart';
import 'package:wikipedia_app/ui/modules/home/view_model/home_view_model.dart';
import 'package:wikipedia_app/ui/modules/splash/view/splash.dart';
import 'package:wikipedia_app/ui/modules/splash/view_model/splash_view_model.dart';
import 'package:wikipedia_app/ui/modules/wikipedia_detail/view_model/wikipedia_view_model.dart';
import 'package:wikipedia_app/values/theme.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider<SplashViewModel>(
          create: (context) => SplashViewModel(context: context),
        ),
        ChangeNotifierProvider<HomeViewModel>(
          create: (context) => HomeViewModel(),
        ),
        ChangeNotifierProvider<WikiDetailViewModel>(
          create: (context) => WikiDetailViewModel(),
        ),
        ChangeNotifierProvider<BookmarkViewModel>(
          create: (context) => BookmarkViewModel(),
        ),
        ChangeNotifierProvider<HistoryViewModel>(
          create: (context) => HistoryViewModel(),
        ),
      ],
      child: MaterialApp(
        theme: appTheme,
        debugShowCheckedModeBanner: false,
        home: SplashScreen(),
      ),
    ),
  );
}
