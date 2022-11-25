import 'dart:collection';

import 'package:any_wash/src/equipment.dart';
import 'package:any_wash/src/service.dart';
import 'package:flutter/material.dart';

class Order with ChangeNotifier {
  /// Internal, private state of the cart.
  final List<Service> _services = [];

  final List<Equipment> _equipments = [];

  /// An unmodifiable view of the items in the cart.
  UnmodifiableListView<Service> get services => UnmodifiableListView(_services);

  UnmodifiableListView<Equipment> get equipments =>
      UnmodifiableListView(_equipments);

  /// The current total price of all items (assuming all items cost $42).
  int get totalPrice => 10; // TODO: change later

  void addEquipment(Equipment equipment) {
    _equipments.add(equipment);
    // This call tells the widgets that are listening to this model to rebuild.
    notifyListeners();
  }

  void removeEquipment(Equipment equipment) {
    _equipments.removeWhere(((element) => element.id == equipment.id));
    // This call tells the widgets that are listening to this model to rebuild.
    notifyListeners();
  }

  void addService(Service service) {
    _services.add(service);
    // This call tells the widgets that are listening to this model to rebuild.
    notifyListeners();
  }

  void removeService(Service service) {
    _services.removeWhere(((element) => element.id == service.id));
    // This call tells the widgets that are listening to this model to rebuild.
    notifyListeners();
  }

  /// Removes all items from the cart.
  void removeAll() {
    _services.clear();
    _equipments.clear();
    // This call tells the widgets that are listening to this model to rebuild.
    notifyListeners();
  }
}
