import 'package:flutter/material.dart';
import 'package:capstone_laundry_client/client.dart';
import 'package:ferry/ferry.dart';
import 'package:get_it/get_it.dart';
import 'package:ferry_flutter/ferry_flutter.dart';

class EquipmentList extends StatelessWidget {
  final client = GetIt.I<Client>();
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Row(
            children: [
              Container(
                height: 90,
                width: 90,
                decoration: BoxDecoration(
                  color: Colors.blueGrey,
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
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
                        final equipment = response.data?.toString();
                        return Text(equipment.toString());
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
