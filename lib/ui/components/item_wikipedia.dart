import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:wikipedia_app/data/model/local_model/wikipedia.dart';
import 'package:wikipedia_app/ui/components/text_custom_style.dart';
import 'package:wikipedia_app/values/styles.dart';
import 'package:transparent_image/transparent_image.dart';

class ItemWikipediaWidget extends StatelessWidget {
  final Wikipedia wikipedia;

  ItemWikipediaWidget({@required this.wikipedia});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 20),
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.grey[400],
            blurRadius: 4.0,
            offset: Offset(0, 3),
          ),
        ],
        color: Color.fromRGBO(249, 249, 249, 1),
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Container(
        padding: EdgeInsets.all(10),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: MediaQuery.of(context).size.width / 4,
              child: FadeInImage.memoryNetwork(
                placeholder: kTransparentImage,
                image: wikipedia.thumbnail.trim().isNotEmpty
                    ? "https:" + wikipedia.thumbnail
                    : "https://vi.wikipedia.org/static/images/project-logos/viwiki.png",
              ),
            ),
            Expanded(
              child: Container(
                width: MediaQuery.of(context).size.width /
                    (wikipedia.thumbnail != null ? 1.62 : 1.2),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      padding: EdgeInsets.only(left: 10),
                      child: TextCustomStyle(
                        wikipedia.title,
                        style: styleRegularBlue,
                        maxLine: 2,
                        isOverflow: true,
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(left: 10),
                      child: TextCustomStyle(
                        wikipedia.description,
                        style: styleRegularLightGreen,
                        maxLine: 2,
                        isOverflow: true,
                      ),
                    ),
                    Html(data: wikipedia.excerpt),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
