import 'package:bliss/app/global/colors.dart';
import 'package:bliss/app/model/item.dart';
import 'package:bliss/app/util/api/item_api_request.dart';
import 'package:bliss/app/util/check_connection.dart';
import 'package:flutter/material.dart';
import 'package:toast/toast.dart';

class ItemProviderModel with ChangeNotifier {
  bool isLoading = true;
  Data itemData;

  List<Item> cartItemList = [];
  List<Item> searchItemList = [];

  Item selectedItem = Item();

  List<Item> bagItemList = [];
  List<Item> purseItemList = [];
  double total = 0.0;

  getItemsData(context) {
    checkNetworkConnection(context).then((value) async {
      isLoading = true;
      notifyListeners();
      if (value == true) {
        await getAllItemDataList(context).then((res) {
          if (res != null) {
            itemData = res;
          }
        });
        addToCategory(context, itemData.data);
        isLoading = false;
        notifyListeners();
      } else {
        Toast.show('Please check your Internet connection', context, duration: 2, backgroundColor: red);
      }
    });
  }


  addFavoriteProducts(context, favoriteProducts, index) {
    itemData.data[index].favoriteProducts = favoriteProducts;
    notifyListeners();
  }

  setSingleItem(item) => selectedItem = item;


  qutIncrement(context, index) {
    itemData.data[index].quantity++;
    notifyListeners();
  }

  qutDecrement(context, index) {
    if (itemData.data[index].quantity > 0) {
      itemData.data[index].quantity--;
    }
    notifyListeners();
  }


  addToCart(context, item) {
    if (cartItemList.contains(item)) {
    } else {
      cartItemList.add(item);
    }
    notifyListeners();
  }


  removeFromCart(context, item) {
    if (cartItemList.contains(item)) {
      cartItemList.remove(item);
      calculateTotalAmount(context);
      notifyListeners();
    }
  }

  addToCategory(context, items) {
    for (Item i in items) {
      if(i.category == 'guitar') {
        bagItemList.add(i);
        notifyListeners();
      } else {
        purseItemList.add(i);
        notifyListeners();
      }
    }
  }

  calculateTotalAmount(context) {
    total = 0;

    for (var i = 0; i < cartItemList.length; i++) {
      total += double.parse(cartItemList[i].price) * double.parse(cartItemList[i].quantity.toString());
    }
    notifyListeners();
  }

  searchItems(context, keyword) {
    searchItemList.clear();
    for (var i = 0; i < itemData.data.length; i++) {
      if (itemData.data[i].code == keyword) {
        searchItemList.add(itemData.data[i]);
        print(searchItemList.length);
        notifyListeners();
      }
    }
  }
}
