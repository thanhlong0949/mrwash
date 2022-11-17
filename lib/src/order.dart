import 'package:flutter/material.dart';

class Order with ChangeNotifier {
  int? id;
  int? customer_id;
  int? feedback_id;
  int? manager_id;
  int? payment_id;
  int? service_id;
  int? equipment_id;
  set serviceEquip(value) {
    equipment_id = value;
    notifyListeners();
  }

  set serviceId(value) {
    service_id = value;
    notifyListeners();
  }

  Order();
}
