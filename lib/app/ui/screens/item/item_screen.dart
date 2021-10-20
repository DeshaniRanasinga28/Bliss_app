import 'package:badges/badges.dart';
import 'package:bliss/app/global/colors.dart';
import 'package:bliss/app/model/item.dart';
import 'package:bliss/app/provider/item_provider.dart';
import 'package:bliss/app/ui/screens/checkout/checkout_screen.dart';
import 'package:bliss/app/ui/screens/home/home_screen.dart';
import 'package:bliss/app/ui/widgets/common_widget.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';
import 'package:share/share.dart';
import 'package:toast/toast.dart';

class ItemScreen extends StatefulWidget{
  final bool isFromCart;
  ItemScreen(this.isFromCart);

  @override
  State<StatefulWidget> createState() {
    return _ItemScreenState();
  }
}

class _ItemScreenState extends State<ItemScreen>{

  @override
  Widget build(BuildContext context) {
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;

    final getItemList = Provider.of<ItemProviderModel>(context);

    bool fp = false;
    fp = getItemList.selectedItem.favoriteProducts;

    return Scaffold(
        backgroundColor: Color(int.parse(getItemList.selectedItem.color)),
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          backgroundColor: Color(int.parse(getItemList.selectedItem.color)),
          centerTitle: true,
          automaticallyImplyLeading: false,
          leading: new IconButton(
            icon: const Icon(Icons.arrow_back, color: white253),
            onPressed: () => Navigator.of(context).pushNamed("/homeScreen"),
          ),
          actions: !widget.isFromCart
          ?
          [
            Builder(
              builder: (BuildContext context){
                return IconButton(
                  onPressed: () {
                    final RenderBox box = context.findRenderObject();
                    Share.share(
                        "Bliss",
                        sharePositionOrigin: box.localToGlobal(Offset.zero) & box.size
                    );
                  },
                  icon: Icon(Icons.share, color: white253),
                );
              }
            ),
            IconButton(
              onPressed: () {
                // print("fp:---> ${fp}");
                fp = !fp;
                getItemList.addFavoriteProducts(
                    context,
                    fp,
                    getItemList.itemData.data.indexOf(getItemList.selectedItem));
              },
              icon: Icon(
                  Icons.favorite,
                  color: getItemList.selectedItem.favoriteProducts
                      ? red180
                      : white253
              ),
            ),
            IconButton(
              onPressed: () {
                getItemList.calculateTotalAmount(context);
                Navigator.push(
                  context,
                  PageTransition(
                    duration:  const Duration(milliseconds: 500),
                    reverseDuration: const Duration(milliseconds: 500),
                    type: PageTransitionType.rightToLeft,
                    child: CheckoutScreen(),
                  ),
                );
              },
                icon: getItemList.cartItemList.length > 0
                    ? Badge(
                    badgeContent: Text(
                      getItemList.cartItemList.length.toString(),
                      style: TextStyle(color: Colors.white),
                    ),
                    position: BadgePosition.topEnd(top: -10),
                    child: Icon(Icons.shopping_cart, color: white253),
                ) : Icon(Icons.shopping_cart, color: white253))
          ]
          : []
        ),
        body: SafeArea(
          child: Container(
            margin: EdgeInsets.symmetric(vertical: 20.0),
            height: h * 1.0 / 2.0,
            child: Center(
              child: Image.network(getItemList.selectedItem.image),
            )
          ),
        ),
      bottomNavigationBar: Stack(
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 30.0),
            height: h * 1.0 / 2.0,
            width: w,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30.0),
                topRight: Radius.circular(30.0),
              ),
              color: Color(int.parse(getItemList.selectedItem.cardcolor)),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Container(
                    alignment: Alignment.centerLeft,
                    child: textLabel(getItemList.selectedItem.code.toString(),  h < 770.0 ? 36.0 : 40.0, grey, FontWeight.w500),
                ), flex: 2,),
                Expanded(
                  child: Container(
                    // color: Colors.red,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: Container(
                              // color: Colors.blue,
                              child: textLabel('Brand',  h < 770.0  ? 20.0 : 24.0, grey, FontWeight.w500),
                            ),
                          ),
                          Expanded(
                            child: Container(
                              // color: Colors.blue,
                              child: textLabel(getItemList.selectedItem.width.toString(),  h < 770.0  ? 20.0 : 24.0, grey, FontWeight.w500),
                            ),
                          )
                        ],
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: Container(
                              // color: Colors.blue,
                              child: textLabel('Price',  h < 770.0  ? 20.0 : 24.0, grey, FontWeight.w500),
                            ),
                          ),
                          Expanded(
                            child: Container(
                              // color: Colors.blue,
                              child: textLabel(getItemList.selectedItem.price.toString(),  h < 770.0  ? 20.0 : 24.0, grey, FontWeight.w500),
                            ),
                          )
                        ],
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: Container(
                              // color: Colors.blue,
                              child: textLabel('Color',  h < 770.0  ? 20.0 : 24.0, grey, FontWeight.w500),
                            ),
                          ),
                          Expanded(
                            child: Container(
                              // color: Colors.blue,
                              child: textLabel(getItemList.selectedItem.colors.toString(),  h < 770.0  ? 20.0 : 24.0, grey, FontWeight.w500),
                            ),
                          )
                        ],
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: Container(
                              // color: Colors.blue,
                              child: textLabel('Weight',  h < 770.0  ? 20.0 : 24.0, grey, FontWeight.w500),
                            ),
                          ),
                          Expanded(
                            child: Container(
                              // color: Colors.blue,
                              child: textLabel(getItemList.selectedItem.weight.toString(),  h < 770.0  ? 20.0 : 24.0, grey, FontWeight.w500),
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
                  flex: 3,
                ),
                Expanded(
                  child: Container(
                    width: w,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        GestureDetector(
                          child: CircleAvatar(
                            backgroundColor: Colors.white,
                            child: Icon(Icons.remove, color: grey,),
                          ),
                          onTap: (){
                            getItemList.qutDecrement(context, getItemList.itemData.data.indexOf(getItemList.selectedItem));
                          },
                        ),
                        Padding(padding: EdgeInsets.symmetric(horizontal: 10.0),
                          child: textLabel(getItemList.selectedItem.quantity.toString(),  h < 770.0  ? 20.0 : 24.0, grey, FontWeight.w500),
                        ),
                        GestureDetector(
                          child: CircleAvatar(
                            backgroundColor: Colors.white,
                            child: Icon(Icons.add, color: grey),
                          ),
                          onTap: (){
                            getItemList.qutIncrement(context, getItemList.itemData.data.indexOf(getItemList.selectedItem));
                          },
                        )
                      ],
                    ),
                  ), flex: 1,),
                Expanded(
                  child:
                 !widget.isFromCart
                     ? Container(
                    width: w,
                    // color: Colors.blue,
                    child: Padding(
                      padding: EdgeInsets.only(top: h < 770.0  ? 15.0 : 25.0, bottom:  h < 770.0  ? 15.0 : 25.0,),
                      child: RaisedButton(
                        color: greenB8,
                        child: textLabel('Add to Cart',  h < 770.0  ? 20.0 : 24.0, white, FontWeight.w500),
                        onPressed: () {
                          if(getItemList.selectedItem.quantity > 0){
                            getItemList.addToCart(context, getItemList.selectedItem);
                            Toast.show("Item added to cart",context,backgroundColor: grey,  gravity: 1);
                          }else{
                            Toast.show("0 qty can be add to cart",context,backgroundColor: red, gravity: 1);
                          }
                        },
                        shape: new RoundedRectangleBorder(
                          borderRadius: new BorderRadius.circular(10.0),
                        ),
                      ),
                    )
                  )
                     : Container(),
                  flex: 2,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

}
