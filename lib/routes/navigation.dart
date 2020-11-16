import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

void push(BuildContext context, Widget page) {
  Navigator.push(context, MaterialPageRoute(builder: (context) => page));
}

void pushWithAnimation(BuildContext context, Widget page) {
  Navigator.push(context,
      PageTransition(type: PageTransitionType.bottomToTop, child: page));
}

void pop(BuildContext context) {
  Navigator.pop(context);
}

void pushReplacement(BuildContext context, Widget page) {
  Navigator.pushReplacement(
      context, MaterialPageRoute(builder: (context) => page));
}

void pushReplacementWithAnimation(BuildContext context, Widget page) {
  Navigator.push(context,
      PageTransition(type: PageTransitionType.bottomToTop, child: page));
}
