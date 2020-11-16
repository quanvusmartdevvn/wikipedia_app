import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:wikipedia_app/routes/navigation.dart';
import 'package:wikipedia_app/ui/modules/home/view/home_page.dart';

class SplashViewModel extends ChangeNotifier {
  final BuildContext context;

  SplashViewModel({this.context});

  splashAction(BuildContext _context) async {
    Future.delayed(Duration(seconds: 3), () {
      pushReplacement(_context, HomePage());
    });
  }
}
