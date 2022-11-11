import 'package:flutter/material.dart';
import 'package:capstone_laundry_client/client.dart';
import 'package:ferry/ferry.dart';
import 'package:get_it/get_it.dart';
import 'package:ferry_flutter/ferry_flutter.dart';

class EquipmentListTile extends StatelessWidget {
  final GAllEquipmentData_laundry_service_equipment equipments;
  const EquipmentListTile({Key? key, required this.equipments})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Expanded(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
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
                  Text(
                    equipments.equipment_name,
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.black87,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    equipments.equipment_description,
                    maxLines: 4,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(fontSize: 13, color: Colors.blueGrey),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 20, 10, 0),
              child: Row(
                children: [
                  Text(
                    equipments.equipment_price,
                    textAlign: TextAlign.center,
                  ),
                  Icon(
                    Icons.attach_money,
                    color: Colors.green,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
