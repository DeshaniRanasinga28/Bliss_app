import 'package:bliss/app/global/colors.dart';
import 'package:bliss/app/provider/item_provider.dart';
import 'package:bliss/app/ui/widgets/common_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:toast/toast.dart';

class CheckoutScreen extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return _CheckoutScreenState();
  }
}

class _CheckoutScreenState extends State<CheckoutScreen>{
  @override
  Widget build(BuildContext context) {
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;

    final getItemList = Provider.of<ItemProviderModel>(context);

    return Scaffold(
      backgroundColor: white253,
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Container(
          margin: EdgeInsets.symmetric( horizontal: 30.0),
          child: getItemList.cartItemList.isEmpty
          ? Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 10.0,
              ),
              textLabel(
                  'BLISS', 38.0, greenB8, FontWeight.w800),
              Expanded(
                child: Container(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Icon(Icons.add_shopping_cart, size:h < 770.0 ? 150.0 :180.0, color: greenB8),
                        alignTextLabel('Your cart is currently\nempty !', 20.0, grey, null)
                      ],
                    )
                ),
              )
            ],
          )
          : Column(crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // imageView( h < 770.0 ? 50.0 : 60.0),
              SizedBox(
                height: 20.0,
              ),
              textLabel(
                  'BLISS', 38.0, greenB8, FontWeight.w800),
              SizedBox(
                height: 20.0,
              ),
              Container(
                height: 320.0,
                child: Container(
                    child: ListView.builder(
                      scrollDirection: Axis.vertical,
                      shrinkWrap: false,
                      itemCount: getItemList.cartItemList.length,
                      itemBuilder: (BuildContext context, int index) {
                        getItemList.setSingleItem(getItemList.itemData.data[index]);
                        return Container(
                          margin: EdgeInsets.symmetric(vertical: 10.0),
                          height: 140.0,
                          width: w,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.all(Radius.circular(15)),
                              color: Color(int.parse(getItemList.selectedItem.color)),
                              boxShadow: [
                                BoxShadow(
                                  color: Color(int.parse(getItemList.selectedItem.color)),
                                  blurRadius: 8.0,
                                ),]
                          ),
                          child: Row(
                            children: [
                              Expanded(
                                child: Container(
                                  margin: EdgeInsets.symmetric(vertical: 5.0, horizontal: 5.0),
                                  child:  Image.network(getItemList.selectedItem.image),
                                ),
                                flex: 1,
                              ),
                              Expanded(
                                child: Container(
                                  margin: EdgeInsets.symmetric(vertical: 5.0, horizontal: 5.0),
                                  child: Column(
                                    children: [
                                      Expanded(
                                        child: Container(
                                          child: Row(
                                            children: [
                                              Expanded(
                                                child: Container(
                                                  alignment: Alignment.centerLeft,
                                                  child: textLabel(getItemList.selectedItem.code.toString(),  h < 770.0  ? 18.0 : 20.0, grey, FontWeight.w500),
                                                ),
                                                flex: 3,
                                              ),
                                              Expanded(
                                                child: InkWell(
                                                  child: Container(
                                                    alignment: Alignment.center,
                                                    child: Icon(Icons.close, color: white, size: 20.0,),
                                                  ),
                                                  onTap: (){
                                                    getItemList.removeFromCart(context, getItemList.cartItemList[index]);
                                                  },
                                                ),
                                                flex: 1,
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        child: Container(
                                          alignment: Alignment.centerLeft,
                                          child: textLabel(getItemList.selectedItem.price.toString(),  h < 770.0  ? 18.0 : 20.0, grey, FontWeight.w500),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                flex: 2,
                              )
                            ],
                          ),
                        );
                      },
                    ),
                  )
              ),
              Divider(
                height: 10,
                thickness: 2.0,
                color: greenB8,
              ),
              Row(
                children: [
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.symmetric(vertical: 10.0),
                      alignment: Alignment.centerLeft,
                      child: textLabel('Total', 25.0, grey, FontWeight.w700) ,
                    )),
                  Expanded(
                      child: Container(
                        padding: EdgeInsets.symmetric(vertical: 10.0),
                        alignment: Alignment.centerRight,
                        child: textLabel('Rs. ${getItemList.total}0', 25.0, grey, FontWeight.w700) ,
                      )),
                ],
              )
            ],
          )
        )
      ),

      bottomNavigationBar: Stack(
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 30.0),
            height: 100.0,
            width: w,
            color: white253,
            child: Padding(
              padding: EdgeInsets.only(top: 25.0, bottom: 25.0,),
              child: getItemList.cartItemList.isNotEmpty
                  ? RaisedButton(
                color: greenB8,
                child: textLabel('Checkout',  h < 770.0  ? 20.0 : 24.0, white, FontWeight.w500),
                onPressed: () {
                  getItemList.cartItemList.clear();
                  Toast.show("Checkout", context, backgroundColor: grey, textColor: white);
                  Navigator.of(context).pushNamed("/homeScreen");

                },
                shape: new RoundedRectangleBorder(
                  borderRadius: new BorderRadius.circular(10.0),
                ),
              )
                  : RaisedButton(
                color: greenB8,
                child: textLabel('Brows Items',  h < 770.0  ? 20.0 : 24.0, white, FontWeight.w500),
                shape: new RoundedRectangleBorder(
                  borderRadius: new BorderRadius.circular(10.0),
                ),
                onPressed: () => Navigator.of(context).pushNamed("/homeScreen"),
              ),
            )
          ),
        ],
      ),
    );
  }
}
