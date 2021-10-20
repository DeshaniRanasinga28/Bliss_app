import 'package:bliss/app/global/colors.dart';
import 'package:bliss/app/model/item.dart';
import 'package:bliss/app/provider/item_provider.dart';
import 'package:bliss/app/global/global.dart' as global;
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProductItem extends StatelessWidget {
  final Item item;
  final int index;
  final bool favoriteProducts;
  final Item selectedItem;

  const ProductItem(this.item, this.index, this.favoriteProducts,  this.selectedItem);

  @override
  Widget build(BuildContext context) {
    bool fp = favoriteProducts;
    final getItemList = Provider.of<ItemProviderModel>(context);
    fp = getItemList.itemData.data[index].favoriteProducts;

    print("fg 1:--->${fp.toString()}");

    var h = MediaQuery.of(context).size.height;
    return Padding(
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
                        height: h < 770.0 ? 50.0 : 60.0,
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
                    Container(
                        margin: EdgeInsets.symmetric(horizontal: 20.0, vertical: 5.0),
                        height: h < 770.0 ? 50.0 : 60.0,
                        width : h < 770.0 ? 50.0 : 60.0,
                        alignment: Alignment.centerLeft,
                        child: Center(  //isFavoriteProducts
                            child:
                            IconButton(
                              onPressed: (){
                                fp = !fp;
                                getItemList.addFavoriteProducts(context, fp, index);
                                global.addFav = fp;
                                print("fg 3:--->${fp.toString()}");
                              },
                              icon: !fp
                                  ? Icon(Icons.favorite, color: white)
                                  : Icon(Icons.favorite, color: red180),
                              iconSize: h < 770.0 ? 30.0 : 35.0,
                            )
                          //(Icons.favorite, color: white253, size: 35.0,),
                        )
                    ),
                  ],
                ),
                Expanded(
                  child: Container(
                      margin: EdgeInsets.symmetric(horizontal: 20.0, vertical: 5.0),
                      height: h < 770.0 ? 50.0 : 60.0,
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
