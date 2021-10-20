import 'package:bliss/app/global/colors.dart';
import 'package:bliss/app/ui/screens/filter/filterScreen.dart';
import 'package:flutter/material.dart';

Widget textLabel(text, fontSize, color, fontWeight) {
  return Text(
    text,
    style: new TextStyle(
        fontFamily: 'Poppins',
        fontSize: fontSize,
        color: color,
        fontWeight: fontWeight
    ),
  );
}

Widget alignTextLabel(text, fontSize, color, fontWeight) {
  return Text(
    text,
    textAlign: TextAlign.center,
    style: new TextStyle(
        fontFamily: 'Poppins',
        fontSize: fontSize,
        color: color,
        fontWeight: fontWeight
    ),
  );
}

Widget imageView(height) {
  return new Container(
    height: height,
    alignment: Alignment.centerLeft,
    child: Image.asset('images/logo.PNG'),
  );
}

Widget smallCardImageView(context, h, color, image, text, type) {
  return Padding(
    padding: EdgeInsets.fromLTRB(1.0, 2.0, 10.0, 4.0),
    child: new InkWell(
      child: Container(
        width: h < 770.0 ? 120.0 : 130.0,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(15)),
            color: color,
            boxShadow: [
              BoxShadow(
                color: color,
                blurRadius: 8.0,
              ),]
        ),
        child: Row(
          children: [
            Expanded(
              child: Container(
                  margin: EdgeInsets.symmetric(horizontal: 5.0, vertical: 5.0),
                  alignment: Alignment.centerRight,
                  child: Image.asset(
                    image,
                    color: Colors.white,
                    width: h < 770.0 ? 20.0 : 25.0,
                    height: h < 770.0 ? 20.0 : 25.0,)
              ),
              flex: 2,
            ),
            Expanded(
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 5.0, vertical: 5.0),
                alignment: Alignment.centerLeft,
                child: Text(
                  text,
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: h < 770.0 ? 18.0 : 20.0,
                    color: white,
                  ),
                ),
              ),
              flex: 3,
            ),
          ],
        ),
      ),
      onTap: (){
        Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(
                builder: (BuildContext context) => FilterScreen(type)),
                (r) => false);
      },
    ),
  );
}


// Widget filterItem(h, item){
//   return Padding(
//     padding: EdgeInsets.fromLTRB(1.0, 2.0, 20.0, 4.0),
//     child: Container(
//         height: 780.0,
//         width:  h < 770.0 ? 220.0 : 230.0,
//         decoration: BoxDecoration(
//             borderRadius: BorderRadius.all(Radius.circular(20)),
//             color: Color(int.parse(item.color)),
//             boxShadow: [
//               BoxShadow(
//                 color: Color(int.parse(item.color)),
//                 blurRadius: 8.0,
//               ),]
//         ),
//         child: Column(
//           children: [
//             Row(
//               children: [
//                 Expanded(
//                   child: Container(
//                     margin: EdgeInsets.symmetric(horizontal: 20.0, vertical: 5.0),
//                     height: h < 770.0 ? 50.0 : 60.0,
//                     alignment: Alignment.centerLeft,
//                     child:  Text(
//                       item.price,
//                       style: TextStyle(
//                         fontFamily: 'Poppins',
//                         fontSize: h < 770.0 ? 18.0 : 20.0,
//                         color: grey,
//                       ),
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//             Expanded(
//               child: Container(
//                   margin: EdgeInsets.symmetric(horizontal: 20.0, vertical: 5.0),
//                   height: h < 770.0 ? 50.0 : 60.0,
//                   alignment: Alignment.centerLeft,
//                   child: Center(
//                     child: Image.network(item.price),
//                   )
//               ),
//             ),
//           ],
//         )
//     ),
//   );
// }




