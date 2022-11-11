import 'package:flutter/material.dart';

class NoEquipment extends StatelessWidget {
  const NoEquipment({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Icon(
            Icons.error,
            color: Colors.black12,
            size: 50,
          ),
          Text('No Equipment to view'),
        ],
      ),
    );
  }
}
