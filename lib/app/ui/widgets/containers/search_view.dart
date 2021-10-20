import 'package:bliss/app/global/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../common_widget.dart';

class SearchView extends StatefulWidget {

  @override
  _SearchViewState createState() => _SearchViewState();
}

class _SearchViewState extends State<SearchView> {
  @override
  Widget build(BuildContext context) {
    var h = MediaQuery.of(context).size.height;
    return  Container(
        padding: EdgeInsets.all(h < 770.0 ? 5.0 : 8.0),
        margin: EdgeInsets.only( right: 30.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(25)),
          color: white,
        ),
        child: Row(
          children: [
            Expanded(
              child: Container(
                  height: h < 770.0 ? 42.0 : 48.0,
                  color: white,
                  alignment: Alignment.centerLeft,
                  child: textLabel("Search Your Model", h < 770.0 ? 18.0 : 20.0, Colors.grey[400], null),
              ),
              flex: 6,
            ),
            Container(
                height: h < 770.0 ? 45.0 : 48.0,
                width: h < 770.0 ? 45.0 : 48.0,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  color: greenB8,
                ),
                child: Center(
                  child: Icon(
                    Icons.search_rounded,
                    color: white,
                    size: h < 770.0 ? 30.0 : 35.0,
                  ),
                )
            )
          ],
        )
    );
  }
}


