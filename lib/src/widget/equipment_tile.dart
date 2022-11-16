import 'package:capstone_laundry_client/client.dart';
import 'package:flutter/material.dart';

class EquipmentListTile extends StatelessWidget {
  final GAllEquipmentData_laundry_service_equipment equipment;
  final void Function()? onTap;
  const EquipmentListTile({Key? key, required this.equipment, this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      leading: Container(
        width: 64,
        height: 64,
        child: Image.network(
          'https://picsum.photos/250?image=9',
          fit: BoxFit.fill,
          width: 64,
        ),
      ),
      title: Text(
        equipment.equipment_name,
        style: TextStyle(
          fontSize: 18,
          color: Colors.black87,
          fontWeight: FontWeight.bold,
        ),
      ),
      subtitle: Text(
        equipment.equipment_description,
        overflow: TextOverflow.ellipsis,
        style: TextStyle(fontSize: 13, color: Colors.blueGrey),
      ),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            equipment.equipment_price,
            textAlign: TextAlign.center,
          ),
          Icon(
            Icons.attach_money,
            color: Colors.green,
          ),
        ],
      ),
    );
  }
}
