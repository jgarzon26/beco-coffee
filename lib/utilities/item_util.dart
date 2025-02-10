
import 'package:beco_coffee/home/model/item.dart';

class ItemUtil {
  
  static double get vat => 0.5;

  static double getSubtotal(List<Item> items) {
      var subtotal = 0.0;

      for (final item in items) {
        final price = item.coffee.discount_price ?? item.coffee.price;
        final quantity = price * item.quantity;

        subtotal += quantity;
      }

      return subtotal;
    }
}

