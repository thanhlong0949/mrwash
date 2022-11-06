import 'package:animation_wrappers/animation_wrappers.dart';
import 'package:any_wash/Components/bottom_bar.dart';
import 'package:any_wash/Locale/locales.dart';
import 'package:any_wash/Routes/routes.dart';
import 'package:any_wash/Theme/colors.dart';
import 'package:flutter/material.dart';

List<DropdownMenuItem<String>> listDrop = [];
int? selected;
int? selected1;

void loadData() {
  listDrop = [];
  listDrop.add(DropdownMenuItem(
    child: Text('Wash only'),
    value: 'A',
  ));
  listDrop.add(DropdownMenuItem(
    child: Text('Wash & Iron'),
    value: 'B',
  ));
  listDrop.add(DropdownMenuItem(
    child: Text('Dry Clean'),
    value: 'C',
  ));
}

class ViewCart extends StatefulWidget {
  @override
  _ViewCartState createState() => _ViewCartState();
}

class _ViewCartState extends State<ViewCart> {
  int _itemCount = 0;
  // int _itemCount1 = 0;
  // int _itemCount2 = 0;

  @override
  Widget build(BuildContext context) {
    loadData();
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.confirm!,
            style: Theme.of(context).textTheme.headline4),
      ),
      body: FadedSlideAnimation(
        child: ListView(
          children: <Widget>[
            Container(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: GestureDetector(
                  onTap: () => Navigator.pushNamed(context, PageRoutes.review),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(AppLocalizations.of(context)!.quickWasher!,
                          style: Theme.of(context)
                              .textTheme
                              .headline4!
                              .copyWith(
                                  color:
                                      Theme.of(context).secondaryHeaderColor)),
                      SizedBox(
                        height: 10.0,
                      ),
                      Row(
                        children: <Widget>[
                          Icon(
                            Icons.location_on,
                            color: kIconColor,
                            size: 12,
                          ),
                          SizedBox(width: 10.0),
                          Text('6.4 km ',
                              style: Theme.of(context).textTheme.overline),
                          Text('| ',
                              style: Theme.of(context)
                                  .textTheme
                                  .overline!
                                  .copyWith(color: kMainColor)),
                          Text(AppLocalizations.of(context)!.storeAddress!,
                              style: Theme.of(context).textTheme.overline),
                        ],
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      Row(
                        children: [
                          Icon(
                            Icons.access_time,
                            color: kIconColor,
                            size: 10,
                          ),
                          SizedBox(width: 10.0),
                          Text('08:00 - 20:00',
                              style: Theme.of(context).textTheme.overline),
                          Spacer(),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
            // Divider(
            //   color: Theme.of(context).cardColor,
            //   thickness: 1.0,
            // ),
            Container(
              padding: EdgeInsets.all(30.0),
              color: Theme.of(context).cardColor,
            ),
            cartOrderItemListTile(
                context,
                AppLocalizations.of(context)!.shirts!,
                '3.00',
                _itemCount,
                () => setState(() => _itemCount--),
                () => setState(() => _itemCount++)),
            Divider(
              color: Theme.of(context).cardColor,
              thickness: 1.0,
            ),
            // cartOrderItemListTile(
            //     context,
            //     AppLocalizations.of(context)!.shirts!,
            //     '4.50',

            //     _itemCount1,
            //     () => setState(() => _itemCount1--),
            //     () => setState(() => _itemCount1++)),
            Divider(
              color: Theme.of(context).cardColor,
              thickness: 1.0,
            ),
            // cartOrderItemListTile(
            //     context,
            //     AppLocalizations.of(context)!.jackets!,
            //     '2.50',
            //     _itemCount2,
            //     () => setState(() => _itemCount2--),
            //     () => setState(() => _itemCount2++)),
            Divider(
              color: Theme.of(context).cardColor,
              thickness: 6.7,
            ),
            Container(
              height: 53.3,
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              color: Theme.of(context).scaffoldBackgroundColor,
              child: Row(
                children: <Widget>[
                  Image.asset(
                    'assets/Icons/ic_instruction.png',
                    color: kDisabledColor,
                    height: 16.0,
                    width: 16.7,
                  ),
                  SizedBox(
                    width: 17.3,
                  ),
                  Expanded(
                    child: Text(AppLocalizations.of(context)!.anyInstruction!,
                        style: Theme.of(context).textTheme.caption!.copyWith(
                            fontSize: 11.7, color: Color(0xffb2b2b2))),
                  )
                ],
              ),
            ),
            Container(
              height: 100.0,
              color: Theme.of(context).cardColor,
            ),
            Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 20.0),
              child: Text(
                  AppLocalizations.of(context)!.paymentInfo!.toUpperCase(),
                  style: Theme.of(context)
                      .textTheme
                      .headline6!
                      .copyWith(color: kDisabledColor)),
              color: Theme.of(context).scaffoldBackgroundColor,
            ),
            Container(
              color: Theme.of(context).scaffoldBackgroundColor,
              padding: EdgeInsets.symmetric(vertical: 4.0, horizontal: 20.0),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      AppLocalizations.of(context)!.sub!,
                      style: Theme.of(context).textTheme.caption,
                    ),
                    Text(
                      '\$ 15.00',
                      style: Theme.of(context).textTheme.caption,
                    ),
                  ]),
            ),
            Divider(
              color: Theme.of(context).cardColor,
              thickness: 1.0,
            ),
            Container(
              color: Theme.of(context).scaffoldBackgroundColor,
              padding: EdgeInsets.symmetric(vertical: 4.0, horizontal: 20.0),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      AppLocalizations.of(context)!.service!,
                      style: Theme.of(context).textTheme.caption,
                    ),
                    Text(
                      '\$ 3.00',
                      style: Theme.of(context).textTheme.caption,
                    ),
                  ]),
            ),
            Divider(
              color: Theme.of(context).cardColor,
              thickness: 1.0,
            ),
            Container(
              color: Theme.of(context).scaffoldBackgroundColor,
              padding: EdgeInsets.symmetric(vertical: 4.0, horizontal: 20.0),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      AppLocalizations.of(context)!.amount!,
                      style: Theme.of(context)
                          .textTheme
                          .caption!
                          .copyWith(fontWeight: FontWeight.bold),
                    ),
                    Text(
                      '\$ 18.00',
                      style: Theme.of(context).textTheme.caption!.copyWith(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                    ),
                  ]),
            ),
            SizedBox(
              height: 10.0,
            ),
            BottomBar(
              text: " " + AppLocalizations.of(context)!.continueText!,
              onTap: () =>
                  Navigator.pushNamed(context, PageRoutes.paymentMethod),
            ),
          ],
        ),
        beginOffset: Offset(0, 0.3),
        endOffset: Offset(0, 0),
        slideCurve: Curves.linearToEaseOut,
      ),
    );
  }

  Column cartOrderItemListTile(
    BuildContext context,
    String title,
    String price,
    int itemCount,
    Function onPressedMinus,
    Function onPressedPlus,
  ) {
    return Column(
      children: <Widget>[
        ListTile(
          title: Text(
            title,
            style: Theme.of(context)
                .textTheme
                .subtitle2!
                .copyWith(color: Theme.of(context).secondaryHeaderColor),
          ),
          subtitle: Padding(
            padding: EdgeInsets.only(top: 8.0),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Spacer(
                    flex: 2,
                  ),
                  Spacer(),
                  Text(
                    '\$ $price',
                    style: Theme.of(context).textTheme.caption,
                  ),
                ]),
          ),
        )
      ],
    );
  }
}
