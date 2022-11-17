import 'package:any_wash/src/equipment.dart';
import 'package:capstone_laundry_client/client.dart';
import 'package:flutter/material.dart';

class EquipmentListTile extends StatelessWidget {
  final Equipment equipment;
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
        child: Image(
          image: AssetImage('assets/Items/item_tshirts.png'),
        ),
      ),
      title: Text(
        equipment.name,
        style: TextStyle(
          fontSize: 18,
          color: Colors.black87,
          fontWeight: FontWeight.bold,
        ),
      ),
      subtitle: Text(
        equipment.description,
        overflow: TextOverflow.ellipsis,
        style: TextStyle(fontSize: 13, color: Colors.blueGrey),
      ),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            equipment.price,
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
