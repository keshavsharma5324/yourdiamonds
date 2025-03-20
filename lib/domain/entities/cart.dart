import 'package:hive/hive.dart';
import 'package:yourdiamonds/domain/entities/diamond.dart';

part 'cart.g.dart';

@HiveType(typeId: 1)
class CartEntity {
  @HiveField(0)
  final List<DiamondEntity?>? diamonds;

  const CartEntity({this.diamonds});

  String totalCarat() {
    double carat = 0;
    diamonds?.forEach((ele) => carat += (ele?.carat ?? 0));
    return carat.toStringAsFixed(2);
  }

  String totalPrice() {
    double price = 0;
    diamonds?.forEach((ele) => price += (ele?.finalAmount ?? 0));
    return price.toStringAsFixed(2);
  }

  String avgDiscount() {
    double discount = 0;
    diamonds?.forEach((ele) => discount += (ele?.discount ?? 0));
    return (discount / (diamonds?.length ?? 1)).toStringAsFixed(2);
  }

  String avgPrice() {
    double price = 0;
    diamonds?.forEach((ele) => price += (ele?.finalAmount ?? 0));
    return (price / (diamonds?.length ?? 1)).toStringAsFixed(2);
  }
}
