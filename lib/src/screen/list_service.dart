import 'package:any_wash/src/graphql/__generated__/service.data.gql.dart';
import 'package:any_wash/src/graphql/__generated__/service.req.gql.dart';
import 'package:any_wash/src/graphql/__generated__/service.var.gql.dart';
import 'package:any_wash/src/order.dart';
import 'package:any_wash/src/service.dart';
import 'package:ferry/ferry.dart';
import 'package:ferry_flutter/ferry_flutter.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:provider/provider.dart';

class ServiceList extends StatefulWidget {
  const ServiceList({Key? key}) : super(key: key);
  @override
  State<StatefulWidget> createState() => _ServiceListState();
}

class _ServiceListState extends State<ServiceList> {
  @override
  Widget build(BuildContext context) {
    final client = GetIt.I<Client>();
    final List<Service> listService = [];
    return Operation(
      operationRequest: GAllServiceReq(),
      client: client, // fux 1
      builder: ((BuildContext context,
          OperationResponse<GAllServiceData, GAllServiceVars>? response,
          Object? error) {
        if (response!.loading) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }

        final services = response.data?.laundry_service_service;
        for (var ser in services!) {
          Service service = Service(
              ser.service_id,
              ser.service_name,
              ser.service_price,
              ser.service_description,
              ser.min_weight,
              ser.max_weight);
          listService.add(service);
        }
        return Consumer<Order>(
          builder: (context, order, child) {
            int _selectedService = -1;

            if (order.service_id == null) {
              _selectedService = 0;
            } else {
              for (var i = 0; i < listService.length; i++) {
                if (order.service_id == listService[i].id) {
                  _selectedService = i;
                }
              }
            }
            ;
            return ListView.builder(
              itemCount: listService.length,
              itemBuilder: (context, index) => ListTile(
                selected: index == _selectedService,
                selectedTileColor: Color.fromARGB(255, 147, 174, 188),
                onTap: () => setState(
                  () {
                    // order.service_id = listService[index].id;
                    order.addService(listService[index]);
                    print(order.services);
                    _selectedService = index;
                    DefaultTabController.of(context)?.animateTo(1);
                  },
                ),
                leading: Container(
                  width: 64,
                  height: 64,
                  child: Image(
                    image: AssetImage('assets/Services/click to edit-1.png'),
                  ),
                ),
                title: Text(
                  listService[index].name,
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.black87,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                subtitle: Text(
                  listService[index].description,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(fontSize: 13, color: Colors.blueGrey),
                ),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      listService[index].price.toString(),
                      textAlign: TextAlign.center,
                    ),
                    Icon(
                      Icons.attach_money,
                      color: Colors.green,
                    ),
                  ],
                ),
              ),
            );
          },
        );
      }),
    );
  }
}
