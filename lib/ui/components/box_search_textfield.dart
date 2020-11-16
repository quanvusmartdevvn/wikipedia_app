import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:wikipedia_app/base/base_state.dart';
import 'package:wikipedia_app/ui/components/custom_image.dart';
import 'package:wikipedia_app/values/colors.dart';
import 'package:wikipedia_app/values/dimens.dart';
import 'package:wikipedia_app/values/fonts.dart';
import 'package:wikipedia_app/values/images.dart';

class BoxSearchTextField extends StatefulWidget {
  final String hintText;
  final TextEditingController controller;
  final Function(String) onSearch;
  BoxSearchTextField({this.hintText, this.controller, this.onSearch});

  @override
  _BoxSearchTextFieldState createState() => _BoxSearchTextFieldState();
}

class _BoxSearchTextFieldState extends BaseState<BoxSearchTextField> {
  @override
  Widget buildWidget() {
    return Container(
      decoration: BoxDecoration(
        color: Color.fromRGBO(249, 249, 249, 1),
        borderRadius: BorderRadius.circular(40),
        border: Border.all(
          width: 1,
          style: BorderStyle.solid,
          color: Color.fromRGBO(162, 169, 177, 1),
        ),
      ),
      padding: EdgeInsets.all(15),
      child: Row(
        children: [
          GestureDetector(
            behavior: HitTestBehavior.opaque,
            onTap: () {
              FocusScope.of(context).requestFocus(FocusNode());
              widget.onSearch("");
            },
            child: CustomImage(
              url: ic_search,
              width: 18,
              height: 18,
              color: Colors.black.withOpacity(0.2),
            ),
          ),
          Container(
            width: 8,
          ),
          Expanded(
            child: TextField(
              controller: widget.controller,
              onEditingComplete: () {
                FocusScope.of(context).requestFocus(FocusNode());
                widget.onSearch("");
              },
              onChanged: (value) {
                widget.onSearch(value);
              },
              textInputAction: TextInputAction.search,
              style: TextStyle(
                  color: textColorBlack,
                  fontFamily: sanFranciscoRegular,
                  fontSize: fontText),
              decoration: InputDecoration(
                  contentPadding: EdgeInsets.only(bottom: 0),
                  isDense: true,
                  border: InputBorder.none,
                  hintText: widget.hintText,
                  hintStyle: TextStyle(
                      color: Colors.black.withOpacity(0.2),
                      fontFamily: sanFranciscoRegular,
                      fontSize: fontText)),
            ),
          ),
          widget.controller.text != ""
              ? GestureDetector(
                  onTap: () {
                    widget.controller.clear();
                  },
                  child:
                      Icon(Icons.clear, color: Colors.black.withOpacity(0.2)))
              : Container()
        ],
      ),
    );
  }
}
