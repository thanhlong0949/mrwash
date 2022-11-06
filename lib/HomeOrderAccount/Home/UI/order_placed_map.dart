import 'package:animation_wrappers/animation_wrappers.dart';
import 'package:any_wash/HomeOrderAccount/Home/UI/slide_up_panel.dart';
import 'package:any_wash/Locale/locales.dart';
import 'package:any_wash/Routes/routes.dart';
import 'package:any_wash/Theme/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class OrderMapPage extends StatelessWidget {
  final String? instruction;
  final String? pageTitle;

  OrderMapPage({this.instruction, this.pageTitle});

  @override
  Widget build(BuildContext context) {
    return OrderMap(pageTitle);
  }
}

class BookingStatus {
  String? title;
  String? subtitle;
  String image;

  BookingStatus(this.title, this.subtitle, this.image);
}

class OrderMap extends StatefulWidget {
  final String? pageTitle;

  OrderMap(this.pageTitle);

  @override
  _OrderMapState createState() => _OrderMapState();
}

class _OrderMapState extends State<OrderMap> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    var locale = AppLocalizations.of(context)!;
    List<BookingStatus> _bookingStatus = [
      BookingStatus(locale.orderConfirmed, locale.confirmedOn,
          'assets/TrackingIcons/Vector Smart Object-4.png'),
      BookingStatus(locale.pickupArranged, locale.makeYour,
          'assets/TrackingIcons/Vector Smart Object-3.png'),
      BookingStatus(locale.laundryInProcess, locale.yourLaundryTask,
          'assets/TrackingIcons/Vector Smart Object-2.png'),
      BookingStatus(locale.outForDelivery, locale.yourLaundryIsOut,
          'assets/TrackingIcons/Vector Smart Object-1.png'),
      BookingStatus(locale.delivered, locale.yourLaundryHasBeenDelivered,
          'assets/TrackingIcons/Vector Smart Object.png'),
    ];
    List<String?> itemName = [
      locale.shirts,
      locale.tshirts,
      locale.jackets,
    ];
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(120.0),
        child: AppBar(
          titleSpacing: 0.0,
          title: null,
          bottom: PreferredSize(
            preferredSize: Size.fromHeight(0.0),
            child: Column(
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(left: 16.3),
                      child: FadedScaleAnimation(
                        child: Image.asset(
                          'assets/Stores/1.png',
                          height: 42.3,
                          width: 33.7,
                        ),
                        //durationInMilliseconds: 400,
                      ),
                    ),
                    Expanded(
                      child: ListTile(
                          title: Text(
                            locale.quickWasher!,
                            style: Theme.of(context).textTheme.caption!.copyWith(
                                letterSpacing: 0.07,
                                fontWeight: FontWeight.bold),
                          ),
                          subtitle: Text(
                            '20 June, 11:35am',
                            style: Theme.of(context)
                                .textTheme
                                .headline6!
                                .copyWith(
                                    fontSize: 11.7,
                                    letterSpacing: 0.06,
                                    color: Color(0xffc1c1c1)),
                          ),
                          trailing: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              FadedScaleAnimation(
                                child: Icon(
                                  Icons.message,
                                  color: kMainColor,
                                ),
                                //durationInMilliseconds: 400,
                              ),
                              SizedBox(
                                width: 20,
                              ),
                              FadedScaleAnimation(
                                child: Icon(
                                  Icons.call,
                                  color: kMainColor,
                                ),
                                //durationInMilliseconds: 400,
                              ),
                            ],
                          )),
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: Stack(
              children: <Widget>[
                SingleChildScrollView(
                  physics: BouncingScrollPhysics(),
                  child: Container(
                    color: Theme.of(context).cardColor,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(
                              top: 12, left: 12, right: 12),
                          child: Text(
                            locale.orderStatus!,
                            // textAlign: TextAlign.left,
                            style: TextStyle(
                                color: kIconColor,
                                fontWeight: FontWeight.w500,
                                fontSize: 14,
                                letterSpacing: 0),
                          ),
                        ),
                        Stack(
                          children: [
                            ListView.builder(
                              // padding: EdgeInsets.only(bottom: 200),
                              shrinkWrap: true,
                              physics: NeverScrollableScrollPhysics(),
                              itemCount: _bookingStatus.length,
                              itemBuilder: (context, index) {
                                return Stack(
                                  children: [
                                    Container(
                                      height: 80,
                                      margin:
                                          EdgeInsets.only(bottom: 10, left: 70),
                                      decoration: BoxDecoration(
                                          gradient: LinearGradient(
                                        begin: Alignment.centerLeft,
                                        end: Alignment.centerRight,
                                        colors: [
                                          Theme.of(context).cardColor,
                                          index == 1
                                              ? kWhiteColor
                                              : theme.cardColor,
                                        ],
                                      )),
                                      child: ListTile(
                                        onTap: () {
                                          Navigator.pushNamed(
                                              context, PageRoutes.rate);
                                        },
                                        contentPadding: EdgeInsets.symmetric(
                                            horizontal: 12, vertical: 16),
                                        leading: Icon(
                                          Icons.check_circle,
                                          color: index == 0 || index == 1
                                              ? Colors.lightGreen
                                              : Colors.grey,
                                        ),
                                        title: Text(
                                          _bookingStatus[index].title!,
                                          style: theme.textTheme.bodyText1!
                                              .copyWith(
                                                  fontWeight: FontWeight.w600,
                                                  fontSize: 14),
                                        ),
                                        subtitle: Text(
                                          _bookingStatus[index].subtitle!,
                                          style: theme.textTheme.bodyText1!
                                              .copyWith(
                                                  color: kIconColor,
                                                  fontSize: 12),
                                        ),
                                      ),
                                    ),
                                    PositionedDirectional(
                                      start: 16,
                                      bottom: 16,
                                      child: FadedScaleAnimation(
                                        child: Image.asset(
                                          _bookingStatus[index].image,
                                          scale: 3,
                                        ),
                                        //durationInMilliseconds: 400,
                                      ),
                                    ),
                                  ],
                                );
                              },
                            ),
                            PositionedDirectional(
                                top: 65,
                                start: 80,
                                child: RotatedBox(
                                  quarterTurns: 3,
                                  child: FadedScaleAnimation(
                                    child:Text(
                                      '.    .    .    .' +
                                          '          ' +
                                          '.    .    .    .'.padLeft(22) +
                                          '        ' +
                                          '.    .    .    .'.padLeft(22) +
                                          '        ' +
                                          '.    .    .    .'.padLeft(22),
                                      style: Theme.of(context)
                                          .textTheme
                                          .headline6!
                                          .copyWith(
                                              color: Colors.grey,
                                              fontWeight: FontWeight.bold),
                                    ),
                                    //durationInMilliseconds: 400,
                                  ),
                                )),
                          ],
                        ),
                        SizedBox(
                          height: 100,
                        ),
                      ],
                    ),
                  ),
                ),
                FadedSlideAnimation(
                  child:SlideUpPanel(itemName),
                  beginOffset: Offset(0, 0.3),
                  endOffset: Offset(0, 0),
                  slideCurve: Curves.linearToEaseOut,
                ),
              ],
            ),
          ),
          Container(
            height: 60.0,
            color: Theme.of(context).cardColor,
            padding: EdgeInsets.symmetric(horizontal: 20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  '\$ 17.00 | COD',
                  style: Theme.of(context)
                      .textTheme
                      .caption!
                      .copyWith(fontWeight: FontWeight.w500, fontSize: 15),
                ),
                Spacer(),
                FadedScaleAnimation(
                  child:TextButton(
                    style: TextButton.styleFrom(
                      backgroundColor: kMainColor,
                    ),
                    onPressed: () =>
                        Navigator.pushNamed(context, PageRoutes.viewCart),
                    child: Row(
                      children: [
                        Text(
                          locale.viewOrder!,
                          style: Theme.of(context).textTheme.caption!.copyWith(
                              color: kWhiteColor, fontWeight: FontWeight.bold),
                        ),
                        Icon(
                          Icons.keyboard_arrow_up,
                          color: kWhiteColor,
                        ),
                      ],
                    ),
                  ),
                  //durationInMilliseconds: 400,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
