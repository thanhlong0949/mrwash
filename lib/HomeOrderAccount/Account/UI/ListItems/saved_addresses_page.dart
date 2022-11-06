import 'package:animation_wrappers/animation_wrappers.dart';
import 'package:any_wash/Components/bottom_bar.dart';
import 'package:any_wash/Locale/locales.dart';
import 'package:any_wash/Routes/routes.dart';
import 'package:any_wash/Theme/colors.dart';
import 'package:any_wash/Theme/styles.dart';
import 'package:flutter/material.dart';

class Address {
  final String icon;
  final String? addressType;
  final String address;

  Address(this.icon, this.addressType, this.address);
}

class SavedAddressesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Theme.of(context).cardColor,
        appBar: AppBar(
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          titleSpacing: 0.0,
          title: Text(
            AppLocalizations.of(context)!.saved!,
            style: Theme.of(context).textTheme.bodyText1,
          ),
        ),
        body: FadedSlideAnimation(
          child: SavedAddresses(),
          beginOffset: Offset(0, 0.3),
          endOffset: Offset(0, 0),
          slideCurve: Curves.linearToEaseOut,
        ));
  }
}

class SavedAddresses extends StatefulWidget {
  @override
  _SavedAddressesState createState() => _SavedAddressesState();
}

class _SavedAddressesState extends State<SavedAddresses> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final List<Address> listOfAddressTypes = [
      Address(
          'assets/address/ic_homeadd.png',
          AppLocalizations.of(context)!.homeText,
          'Flat Num 114, First Floor, Central Residency\n1024, Central Residency, Hemilton Park,\nNew York, USA'),
      Address(
          'assets/address/ic_office.png',
          AppLocalizations.of(context)!.office,
          'Flat Num 114, First Floor, Central Residency\n1024, Central Residency, Hemilton Park,\nNew York, USA'),
      Address('assets/address/ic_other.png', AppLocalizations.of(context)!.other,
          'Flat Num 114, First Floor, Central Residency\n1024, Central Residency, Hemilton Park,\nNew York, USA'),
    ];
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Expanded(
            child: ListView.builder(
                itemCount: 3,
                itemBuilder: (BuildContext context, int index) {
                  return Column(
                    children: <Widget>[
                      SizedBox(
                        height: 6.7,
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(
                            vertical: 20.0, horizontal: 6.0),
                        color: Theme.of(context).scaffoldBackgroundColor,
                        child: ListTile(
                          leading: FadedScaleAnimation(
                            child: CircleAvatar(
                              radius: 30,
                              backgroundColor: Theme.of(context).cardColor,
                              child: Image.asset(
                                listOfAddressTypes[index].icon,
                                scale: 3,
                              ),
                            ),
                            //durationInMilliseconds: 400,
                          ),
                          title: Padding(
                            padding: EdgeInsets.only(left: 8.0, bottom: 8.0),
                            child: Text(
                              listOfAddressTypes[index].addressType!,
                              style: listTitleTextStyle,
                            ),
                          ),
                          subtitle: Padding(
                            padding: EdgeInsets.only(left: 8.0),
                            child: Text(
                              listOfAddressTypes[index].address,
                              style: Theme.of(context)
                                  .textTheme
                                  .caption!
                                  .copyWith(fontSize: 11.7),
                            ),
                          ),
                        ),
                      ),
                    ],
                  );
                })),
        BottomBar(
          color: Theme.of(context).scaffoldBackgroundColor,
          text: '+ ' + AppLocalizations.of(context)!.addNew!,
          textColor: kMainColor,
          onTap: () {
            Navigator.pushNamed(context, PageRoutes.locationPage);
          },
        ),
      ],
    );
  }
}
