import 'package:get/state_manager.dart';
import 'package:welcome_loginsignup_dashboard/model/cart%20model/cart_list_model.dart';
import 'package:welcome_loginsignup_dashboard/model/cart%20model/product_model.dart';

class CartController extends GetxController {
  var numOfItems = 1.obs;

  var totalQty = 0.obs;
  var totalAmount = 0.obs;

  var cartItems = <CartItemListModel>[].obs;

  void removeItem() {
    if (numOfItems.value > 1) {
      numOfItems.value--;
    }
  }

  void addItem() {
    numOfItems.value++;
  }

  void addItemInCart(ProductModel product) {
    final index = cartItems.indexWhere((element) => element.product == product);

    if (index >= 0) {
      //here product already in list, so will upadte qunatity only
      cartItems[index] = CartItemListModel(
        product: product,
        qty: (numOfItems.value + cartItems[index].qty),
      );
    } else {
      cartItems.add(CartItemListModel(product: product, qty: numOfItems.value));
    }

    totalQty.value = totalQty.value + numOfItems.value;

    totalAmount.value =
        totalAmount.value + ((product.price as int) * numOfItems.value);

    numOfItems.value = 1;
  }

  void initliaseQuantity() {
    numOfItems.value = 1;
  }

  void removeThisItemFromList(CartItemListModel currentItem) {
    cartItems.remove(currentItem);

    totalQty.value = totalQty.value - currentItem.qty;
    totalAmount.value = totalAmount.value -
        ((currentItem.product.price as int) * currentItem.qty);
  }
}
