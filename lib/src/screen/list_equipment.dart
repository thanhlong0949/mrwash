import 'package:any_wash/src/equipment.dart';
import 'package:any_wash/src/order.dart';
import 'package:flutter/material.dart';
import 'package:any_wash/src/graphql/__generated__/equipment.data.gql.dart';
import 'package:any_wash/src/graphql/__generated__/equipment.var.gql.dart';
import 'package:any_wash/src/graphql/__generated__/equipment.req.gql.dart';
import 'package:ferry/ferry.dart';
import 'package:get_it/get_it.dart';
import 'package:ferry_flutter/ferry_flutter.dart';
import 'package:provider/provider.dart';

class EquipmentList extends StatefulWidget {
  const EquipmentList({Key? key}) : super(key: key);
  @override
  State<StatefulWidget> createState() => _EquipmentListState();
}

class _EquipmentListState extends State<EquipmentList> {
  @override
  Widget build(BuildContext context) {
    final client = GetIt.I<Client>();
    final List<Equipment> listEquipment = [];
    return Operation(
      operationRequest: GAllEquipmentReq(),
      client: client,
      builder: ((
        BuildContext context,
        OperationResponse<GAllEquipmentData, GAllEquipmentVars>? response,
        Object? error,
      ) {
        if (response!.loading) {
          return Center(child: CircularProgressIndicator());
        }
        final equipments = response.data?.laundry_service_equipment;
        for (var equip in equipments!) {
          Equipment equipment = Equipment(equip.equipment_description,
              equip.equipment_price, equip.equipment_name, equip.equipment_id);
          listEquipment.add(equipment);
        }
        return Consumer<Order>(builder: (context, order, child) {
          int _selectedEquipment = -1;
          // if (order.equipment_id == null) {
          //   _selectedEquipment = 0;
          // } else {
          //   for (var i = 0; i < listEquipment.length; i++) {
          //     if (order.equipment_id == listEquipment[i].id) {
          //       _selectedEquipment = i;
          //     }
          //   }
          // }
          ;
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListView.builder(
              itemCount: listEquipment.length,
              itemBuilder: (context, index) => ListTile(
                selected: index == _selectedEquipment,
                selectedTileColor: Color.fromARGB(255, 147, 174, 188),
                onTap: () => setState(
                  () {
                    // order.equipment_id = listEquipment[index].id;
                    _selectedEquipment = index;
                    DefaultTabController.of(context)?.animateTo(1);
                  },
                ),
                leading: Container(
                  width: 64,
                  height: 64,
                  child: Image(
                    image: AssetImage('assets/Items/item_tshirts.png'),
                  ),
                ),
                title: Text(
                  listEquipment[index].name,
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.black87,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                subtitle: Text(
                  listEquipment[index].description,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(fontSize: 13, color: Colors.blueGrey),
                ),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      listEquipment[index].price,
                      textAlign: TextAlign.center,
                    ),
                    Icon(
                      Icons.attach_money,
                      color: Colors.green,
                    ),
                  ],
                ),
              ),
            ),
          );
        });
      }),
    );
  }
}
