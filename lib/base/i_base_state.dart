
import 'package:flutter/cupertino.dart';

abstract class IBaseState {
  void showLoading();

  void showToast(String message);

  void dismissDialog();

  void showDialogBox(String content, String title,
      List<Widget> action) {}
}
