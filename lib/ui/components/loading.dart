import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:wikipedia_app/ui/components/text_custom_style.dart';

import 'package:wikipedia_app/values/colors.dart' as colors;
import 'package:wikipedia_app/values/styles.dart';

class LoadingWidget extends StatefulWidget {
  final bool backgroundTransparent;
  final String message;
  final bool status;
  final Widget child;

  const LoadingWidget(
      {Key key,
      this.status,
      this.child,
      this.message,
      this.backgroundTransparent})
      : super(key: key);

  @override
  _LoadingWidgetState createState() => _LoadingWidgetState();
}

class _LoadingWidgetState extends State<LoadingWidget> {
  @override
  Widget build(BuildContext context) {
    return Stack(
        children: <Widget>[widget.child, _loadingWidget(widget.status)]);
  }

  Widget _loadingWidget(bool loadingWidget) {
    return loadingWidget == true
        ? Container(
            alignment: Alignment.center,
            color: widget.backgroundTransparent == true
                ? Colors.transparent
                : Colors.white.withOpacity(0.7),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  SpinKitCircle(
                    color: colors.loadingColor,
                    size: 50.0,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: TextCustomStyle(
                      widget.message,
                      style: styleTextLoading,
                    ),
                  ),
                ]),
          )
        : Container();
  }
}
