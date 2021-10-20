import 'package:bliss/app/global/colors.dart';
import 'package:bliss/app/model/item.dart';
import 'package:bliss/app/global/global.dart' as global;
import 'package:flutter/material.dart';

class FilterItem extends StatelessWidget {
  final Item item;
  final bool visibility;

  const FilterItem(this.item, this.visibility);

  @override
  Widget build(BuildContext context) {
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;

    return  Padding(
      padding: EdgeInsets.fromLTRB(1.0, 2.0, 20.0, 4.0),
      child: Container(
          height: 780.0,
          width:  h < 770.0 ? 220.0 : 230.0,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(20)),
              color: Color(int.parse(item.color)),
              boxShadow: [
                BoxShadow(
                  color: Color(int.parse(item.color)),
                  blurRadius: 8.0,
                ),]
          ),
          child: Column(
            children: [
              Row(
                children: [
                  Expanded(
                    child: Container(
                      margin: EdgeInsets.symmetric(horizontal: 20.0, vertical: 5.0),
                      // height: h < 770.0 ? 50.0 : 60.0,
                      alignment: Alignment.centerLeft,
                      child:  Text(
                        item.code,
                        style: TextStyle(
                          fontFamily: 'Poppins',
                          fontSize: h < 770.0 ? 18.0 : 20.0,
                          color: grey,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Expanded(
                child: Container(
                    margin: EdgeInsets.symmetric(horizontal: 20.0, vertical: 5.0),
                    // height: h < 770.0 ? 50.0 : 60.0,
                    alignment: Alignment.centerLeft,
                    child: Center(
                      child: Image.network(item.image),
                    )
                ),
              ),
            ],
          )
      ),
    );
  }
}
