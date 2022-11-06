import 'dart:async';

import 'package:animation_wrappers/animation_wrappers.dart';
import 'package:any_wash/Components/bottom_bar.dart';
import 'package:any_wash/Components/custom_appbar.dart';
import 'package:any_wash/Components/entry_field.dart';
import 'package:any_wash/Locale/locales.dart';
import 'package:any_wash/Maps/Components/address_type_button.dart';
import 'package:any_wash/OrderMapBloc/order_map_bloc.dart';
import 'package:any_wash/OrderMapBloc/order_map_state.dart';
import 'package:any_wash/Routes/routes.dart';
import 'package:any_wash/Theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../map_utils.dart';

TextEditingController _addressController = TextEditingController();

class LocationPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<OrderMapBloc>(
      create: (context) => OrderMapBloc()..loadMap(),
      child: SetLocation(),
    );
  }
}

class SetLocation extends StatefulWidget {
  @override
  _SetLocationState createState() => _SetLocationState();
}

class _SetLocationState extends State<SetLocation> {
  bool isCard = false;
  Completer<GoogleMapController> _mapController = Completer();
  GoogleMapController? mapStyleController;
  Set<Marker> _markers = {};

  @override
  void initState() {
    rootBundle.loadString('assets/map_style.txt').then((string) {
      mapStyle = string;
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
//          extendBodyBehindAppBar: true,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(120.0),
        child: FadedScaleAnimation(
          child:CustomAppBar(
            titleWidget: Text(
              AppLocalizations.of(context)!.setDeliveryLocation!,
              style: TextStyle(fontSize: 16.7),
            ),
            onTap: null,
            hint: AppLocalizations.of(context)!.searchLocation,
          ),
          //durationInMilliseconds: 400,
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          SizedBox(
            height: 8.0,
          ),
          Expanded(
            child: BlocBuilder<OrderMapBloc, OrderMapState>(
                builder: (context, state) {
                  print('polyyyy' + state.polylines.toString());
                  return GoogleMap(
                    // polylines: state.polylines,
                    mapType: MapType.normal,
                    initialCameraPosition: kGooglePlex,
                    markers: _markers,
                    onMapCreated: (GoogleMapController controller) async {
                      _mapController.complete(controller);
                      mapStyleController = controller;
                      mapStyleController!.setMapStyle(mapStyle);
                      setState(() {
                        _markers.add(
                          Marker(
                            markerId: MarkerId('mark1'),
                            position:
                            LatLng(37.42796133580664, -122.085749655962),
                            icon: markerss.first,
                          ),
                        );
                        _markers.add(
                          Marker(
                            markerId: MarkerId('mark2'),
                            position:
                            LatLng(37.42496133180663, -122.081743655960),
                            icon: markerss[1],
                          ),
                        );
                        _markers.add(
                          Marker(
                            markerId: MarkerId('mark3'),
                            position:
                            LatLng(37.42196183580660, -122.089743655967),
                            icon: markerss[2],
                          ),
                        );
                      });
                    },
                  );
                }),
          ),
          Container(
            color: Theme.of(context).cardColor,
            padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
            child: Row(
              children: <Widget>[
                FadedScaleAnimation(
                  child:Image.asset(
                    'assets/Icons/map_pin.png',
                    scale: 2.5,
                  ),
                  //durationInMilliseconds: 600,
                ),
                SizedBox(
                  width: 16.0,
                ),
                Expanded(
                  child: Text(
                    '1024, Central Residency, Hemilton Park, New York, USA',
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).textTheme.caption!.copyWith(
                          fontSize: 11,
                        ),
                  ),
                ),
              ],
            ),
          ),
          isCard ? SaveAddressCard() : Container(),
          BottomBar(
              text: AppLocalizations.of(context)!.continueText,
              onTap: () {
                if (isCard == false) {
                  setState(() {
                    isCard = true;
                  });
                } else {
                  Navigator.popAndPushNamed(
                      context, PageRoutes.homeOrderAccountPage);
                }
              }),
        ],
      ),
    );
  }
}

enum AddressType {
  Home,
  Office,
  Other,
}
AddressType selectedAddress = AddressType.Other;

class SaveAddressCard extends StatefulWidget {
  @override
  _SaveAddressCardState createState() => _SaveAddressCardState();
}

class _SaveAddressCardState extends State<SaveAddressCard> {
  @override
  Widget build(BuildContext context) {
    return FadedSlideAnimation(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.0),
            child: EntryField(
              controller: _addressController,
              label: AppLocalizations.of(context)!.addressLabel,
              //initialValue: 'Flat num 114, First Floor, Central Residency',
              //isCollapsed: true,
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
            child: Text(
              AppLocalizations.of(context)!.saveAddress!.toUpperCase(),
              style: Theme.of(context).textTheme.subtitle2!.copyWith(
                    fontSize: 11,
                  ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(bottom: 16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                FadedScaleAnimation(
                  child: AddressTypeButton(
                    label: AppLocalizations.of(context)!.homeText,
                    image: 'assets/address/ic_homeblk.png',
                    onPressed: () {
                      setState(() {
                        selectedAddress = AddressType.Home;
                      });
                    },
                    isSelected: selectedAddress == AddressType.Home,
                  ),
                  //durationInMilliseconds: 400,
                ),
                FadedScaleAnimation(
                  child: AddressTypeButton(
                    label: AppLocalizations.of(context)!.office,
                    image: 'assets/address/ic_officeblk.png',
                    onPressed: () {
                      setState(() {
                        selectedAddress = AddressType.Office;
                      });
                    },
                    isSelected: selectedAddress == AddressType.Office,
                  ),
                  //durationInMilliseconds: 400,
                ),
                FadedScaleAnimation(
                  child:AddressTypeButton(
                    label: AppLocalizations.of(context)!.other,
                    image: 'assets/address/ic_otherblk.png',
                    onPressed: () {
                      setState(() {
                        selectedAddress = AddressType.Other;
                      });
                    },
                    isSelected: selectedAddress == AddressType.Other,
                  ),
                  //durationInMilliseconds: 400,
                ),
              ],
            ),
          )
        ],
      ),
      beginOffset: Offset(0, 0.3),
      endOffset: Offset(0, 0),
      slideCurve: Curves.linearToEaseOut,
    );
  }
}
