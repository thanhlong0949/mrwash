import 'package:any_wash/src/equipment.dart';
import 'package:flutter/material.dart';
import 'package:capstone_laundry_client/client.dart';
import 'package:ferry/ferry.dart';
import 'package:get_it/get_it.dart';
import 'package:ferry_flutter/ferry_flutter.dart';

import '../widget/equipment_tile.dart';

class EquipmentList extends StatelessWidget {
  const EquipmentList({Key? key}) : super(key: key);

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
        return ListView.builder(
            itemCount: listEquipment.length,
            itemBuilder: (context, index) => EquipmentListTile(
                  equipment: listEquipment[index],
                  onTap: () {
                    print(listEquipment[index].name);
                  },
                ));
      }),
    );
  }
}
