import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:capstone_laundry_client/client.dart';
import 'package:ferry/ferry.dart';
import 'package:get_it/get_it.dart';
import 'package:ferry_flutter/ferry_flutter.dart';

import '../widget/equipment_tile.dart';

class EquipmentList extends StatefulWidget {
  const EquipmentList({Key? key}) : super(key: key);
  @override
  State<EquipmentList> createState() => _EquipmentListState();
}

class _EquipmentListState extends State<EquipmentList> {
  final List<String> names = [];

  @override
  Widget build(BuildContext context) {
    final client = GetIt.I<Client>();
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
        return ListView.builder(
            itemCount: equipments!.length,
            itemBuilder: (context, index) => EquipmentListTile(
                  equipment: equipments[index],
                  onTap: () {
                    names.add(equipments[index].equipment_name);
                    print(names);
                  },
                ));
      }),
    );
  }
}
