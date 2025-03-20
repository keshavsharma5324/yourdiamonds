import 'package:yourdiamonds/data/models/diamond_model.dart';

class CartModel {
  List<DiamondModel?>? diamonds;

  CartModel({
    this.diamonds,
  });

  factory CartModel.fromJson(Map<String, dynamic> json) {
    return CartModel(
      diamonds: json["Diamonds"] == null
          ? []
          : List<DiamondModel>.from(
              json["Diamonds"].map(
                (x) => x == null ? DiamondModel() : DiamondModel.fromJson(x),
              ),
            ),
    );
  }

  double totalCarat() {
    double carat = 0;
    diamonds?.forEach((ele) => carat += (ele?.carat ?? 0));
    return carat;
  }

  double totalPrice() {
    double price = 0;
    diamonds?.forEach((ele) => price += (ele?.finalAmount ?? 0));
    return price;
  }

  double totalDiscount() {
    double discount = 0;
    diamonds?.forEach((ele) => discount += (ele?.discount ?? 0));
    return discount;
  }

  double avgPrice() {
    return totalPrice() / (diamonds?.length ?? 1);
  }
}
