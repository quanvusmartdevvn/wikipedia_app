import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:toast/toast.dart';
import 'package:wikipedia_app/base/i_base_state.dart';
import 'package:wikipedia_app/routes/navigation.dart';
import 'package:wikipedia_app/ui/components/loading_circle.dart';

abstract class BaseState<T extends StatefulWidget> extends State<T>
    implements IBaseState{
  Widget buildWidget();
  bool isHaveDialog = false;

  @override
  void showLoading() {
    isHaveDialog = true;
    showDialog(barrierDismissible: false,context: this.context, builder: (context) => LoadingCircle(radius: 20, dotRadius: 10,));
  }

  @override
  void showToast(String message) {
    Toast.show(message, this.context, duration: 4);
  }

  @override
  Widget build(BuildContext context) {
    return this.buildWidget();
  }

  @override
  void dismissDialog() {
    if(isHaveDialog){
      pop(this.context);
    }
  }

  @override
  void showDialogBox( String content, String title, List<Widget> action) {
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return Theme(
            data: ThemeData(
                dialogBackgroundColor: Colors.black,
                dialogTheme: DialogTheme(backgroundColor: Colors.black)),
            child: CupertinoAlertDialog(
                title: Text(title),
                content: Padding(
                  padding: const EdgeInsets.only(top: 10.0),
                  child: Text(content),
                ),
                actions: action),
          );
        });
  }
}
