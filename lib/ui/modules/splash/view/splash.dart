import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:wikipedia_app/base/base_state.dart';
import 'package:wikipedia_app/ui/components/custom_image.dart';
import 'package:wikipedia_app/ui/modules/splash/view_model/splash_view_model.dart';
import 'package:wikipedia_app/values/images.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends BaseState<SplashScreen> {
  @override
  void initState() {
    SystemChrome.setEnabledSystemUIOverlays([]);
    super.initState();

    Provider.of<SplashViewModel>(context, listen: false).splashAction(context);
  }

  @override
  void dispose() {
    super.dispose();
    SystemChrome.setEnabledSystemUIOverlays(SystemUiOverlay.values);
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  @override
  Widget buildWidget() {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Stack(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              color: Colors.white.withOpacity(.8),
            ),
            Center(
              child: CustomImage(
                url: wikipedia_logo,
                width: 190,
                height: 190,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
