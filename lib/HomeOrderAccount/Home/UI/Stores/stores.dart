import 'package:animation_wrappers/animation_wrappers.dart';
import 'package:any_wash/Components/custom_appbar.dart';
import 'package:any_wash/Locale/locales.dart';
import 'package:any_wash/Pages/items.dart';
import 'package:any_wash/Routes/routes.dart';
import 'package:any_wash/Theme/colors.dart';
import 'package:any_wash/src/vendor.dart';
import 'package:ferry/ferry.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:capstone_laundry_client/client.dart';
import 'package:ferry_flutter/ferry_flutter.dart';

class StoresPage extends StatelessWidget {
  final String pageTitle;
  List<Vendor> listVendor = [];
  StoresPage(this.pageTitle);

  @override
  Widget build(BuildContext context) {
    final client = GetIt.I<Client>();
    var locale = AppLocalizations.of(context)!;
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(126.0),
        child: CustomAppBar(
          titleWidget: Text(
            locale.nearbyLaundries!,
            style: Theme.of(context).textTheme.headline4,
          ),
          hint: AppLocalizations.of(context)!.searchLaundryStore,
        ),
      ),
      body: FadedSlideAnimation(
        child: ListView(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(left: 20.0, top: 20.0, right: 20.0),
              child: Text(
                AppLocalizations.of(context)!.storeFound!.toString(),
                style: Theme.of(context)
                    .textTheme
                    .headline6!
                    .copyWith(color: kHintColor),
              ),
            ),
            Operation(
                operationRequest: GAllVendorReq(),
                builder: ((
                  BuildContext context,
                  OperationResponse<GAllVendorData, GAllVendorVars>? response,
                  Object? error,
                ) {
                  if (response!.loading) {
                    return Center(child: CircularProgressIndicator());
                  }
                  final vendor = response.data?.laundry_service_vendor;
                  for (var ven in vendor!) {
                    var vendor = Vendor(
                        ven.city,
                        ven.district,
                        ven.email,
                        ven.vendor_id,
                        ven.vendor_name,
                        ven.phone,
                        ven.street,
                        ven.zip_code);
                    listVendor.add(vendor);
                  }
                  return ListView.builder(
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: vendor!.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: EdgeInsets.only(
                              left: 20.0, top: 25.3, right: 20.0),
                          child: GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                new MaterialPageRoute(
                                  builder: (context) => new ItemsPage(
                                    vendor: listVendor[index],
                                  ),
                                ),
                              );
                            },
                            child: Row(
                              children: <Widget>[
                                FadedScaleAnimation(
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(8),
                                    child: Image(
                                      image: AssetImage('assets/Stores/1.png'),
                                      height: 93.3,
                                    ),
                                  ),
                                  // durationInMilliseconds: 400,
                                ),
                                SizedBox(width: 13.3),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Text(vendor[index].vendor_name,
                                        style: Theme.of(context)
                                            .textTheme
                                            .subtitle2!
                                            .copyWith(
                                                color: Theme.of(context)
                                                    .secondaryHeaderColor)),
                                    SizedBox(height: 8.0),
                                    Row(
                                      children: <Widget>[
                                        Icon(
                                          Icons.location_on,
                                          color: Colors.black87,
                                          size: 16,
                                        ),
                                        SizedBox(width: 10.0),
                                        Text(
                                          vendor[index].street,
                                          style: Theme.of(context)
                                              .textTheme
                                              .caption!
                                              .copyWith(
                                                color: Theme.of(context)
                                                            .scaffoldBackgroundColor ==
                                                        Colors.black
                                                    ? Colors.white
                                                    : kMainTextColor,
                                                fontSize: 10.0,
                                                fontWeight: FontWeight.bold,
                                              ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(height: 10.3),
                                    Row(
                                      children: <Widget>[
                                        Icon(
                                          Icons.access_time,
                                          color: Colors.black87,
                                          size: 16,
                                        ),
                                        SizedBox(width: 10.0),
                                        Text(
                                          '08:00 - 20:00',
                                          style: Theme.of(context)
                                              .textTheme
                                              .caption!
                                              .copyWith(
                                                  color: Theme.of(context)
                                                              .scaffoldBackgroundColor ==
                                                          Colors.black45
                                                      ? Colors.white
                                                      : kMainTextColor,
                                                  fontSize: 10.0,
                                                  fontWeight: FontWeight.bold),
                                        ),
                                      ],
                                    ),
                                    SizedBox(height: 10.3),
                                    Row(
                                      children: <Widget>[
                                        Icon(
                                          Icons.phone,
                                          color: Colors.yellow,
                                          size: 16,
                                        ),
                                        SizedBox(width: 10.0),
                                        Text(vendor[index].phone,
                                            style: Theme.of(context)
                                                .textTheme
                                                .caption!
                                                .copyWith(
                                                    color: Theme.of(context)
                                                                .scaffoldBackgroundColor ==
                                                            Colors.black
                                                        ? Colors.white
                                                        : kMainTextColor,
                                                    fontSize: 10.0,
                                                    fontWeight:
                                                        FontWeight.bold)),
                                      ],
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        );
                      });
                }),
                client: client),
          ],
        ),
        beginOffset: Offset(0, 0.3),
        endOffset: Offset(0, 0),
        slideCurve: Curves.linearToEaseOut,
      ),
    );
  }
}
