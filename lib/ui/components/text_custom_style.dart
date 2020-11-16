import 'package:flutter/cupertino.dart';

class TextCustomStyle extends StatelessWidget {
  final String text;
  final bool isCenter;
  final bool isRight;
  final int maxLine;
  final TextStyle style;
  final bool isOverflow;

  TextCustomStyle(this.text,
      {this.isCenter, this.maxLine, this.style, this.isOverflow, this.isRight});

  @override
  Widget build(BuildContext context) {
    return Text(text,
        style: style,
        textAlign: isCenter != null
            ? TextAlign.center
            : isRight != null ? TextAlign.right : null,
        maxLines: maxLine ?? null,
        overflow: isOverflow != null && isOverflow ? TextOverflow.ellipsis : null);
  }
}
