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
  @override
  Widget build(BuildContext context) {
    final client = GetIt.I<Client>();
    return Container(
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Operation(
                      operationRequest: GAllEquipmentReq(),
                      client: client,
                      builder: ((
                        BuildContext context,
                        OperationResponse<GAllEquipmentData, GAllEquipmentVars>?
                            response,
                        Object? error,
                      ) {
                        if (response!.loading) {
                          return Center(child: CircularProgressIndicator());
                        }
                        final equipments =
                            response.data?.laundry_service_equipment;
                        String _choice = equipments!.first.equipment_name;
                        return Column(
                          children: [
                            for (var index = 0;
                                index < equipments.length;
                                index++)
                              Row(
                                children: [
                                  EquipmentListTile(
                                    equipments: equipments[index],
                                  ),
                                  Radio(
                                    value: '',
                                    groupValue: _choice,
                                    onChanged: (value) {
                                      setState(
                                        () {
                                          _choice =
                                              equipments[index].equipment_name;
                                        },
                                      );
                                      log(_choice);
                                    },
                                  ),
                                ],
                              ),
                          ],
                        );
                      }),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
