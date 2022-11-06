import 'package:animation_wrappers/animation_wrappers.dart';
import 'package:any_wash/Components/bottom_bar.dart';
import 'package:any_wash/Components/entry_field.dart';
import 'package:any_wash/Locale/locales.dart';
import 'package:any_wash/Routes/routes.dart';
import 'package:any_wash/Theme/colors.dart';
import 'package:flutter/material.dart';

class SelectLocationAndTime extends StatefulWidget {
  @override
  _SelectLocationAndTimeState createState() => _SelectLocationAndTimeState();
}

class _SelectLocationAndTimeState extends State<SelectLocationAndTime> {
  @override
  Widget build(BuildContext context) {
    var locale = AppLocalizations.of(context)!;
    var theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          locale.selectLocation!,
          style: theme.textTheme.headline4,
        ),
      ),
      body: FadedSlideAnimation(
        child:Stack(
          alignment: Alignment.bottomCenter,
          children: [
            SingleChildScrollView(
              child: Column(
                children: [
                  Stack(
                    children: [
                      FadedScaleAnimation(
                        child: Image.asset(
                          'assets/img_pickupinfo.png',
                          fit: BoxFit.fitWidth,
                        ),
                        //durationInMilliseconds: 400,
                      ),
                      PositionedDirectional(
                          start: 65,
                          bottom: 20,
                          child: Text(
                            locale.pickupInfo!,
                            style: theme.textTheme.bodyText1!.copyWith(
                              fontWeight: FontWeight.w600,
                              fontSize: 16,
                            ),
                          )),
                    ],
                  ),
                  Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 12.0, vertical: 12),
                    child: EntryField(
                      textCapitalization: TextCapitalization.words,
                      // controller: _nameController,
                      label: AppLocalizations.of(context)!
                          .pickupAddress!
                          .toUpperCase(),
                      image: 'assets/Icons/ic_pickuppoint.png',
                      initialValue: '\n' + '1024, Hemilton Park, New York.',
                      isCollapsed: true,
                      suffixIcon: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            locale.home!.toUpperCase(),
                            style: theme.textTheme.subtitle2!.copyWith(
                              color: kMainColor,
                              fontSize: 12,
                            ),
                          ),
                          SizedBox(
                            width: 8,
                          ),
                          Icon(
                            Icons.keyboard_arrow_down_sharp,
                            color: kMainColor,
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 12.0, vertical: 12),
                    child: EntryField(
                      textCapitalization: TextCapitalization.words,
                      // controller: _nameController,
                      label: locale.pickup!.toUpperCase(),
                      image: 'assets/Icons/ic_picuptime.png',
                      initialValue: '\n' + 'Tommorow, 10:00 - 11:00',
                      isCollapsed: true,
                      suffixIcon: Icon(
                        Icons.keyboard_arrow_down_sharp,
                        color: kMainColor,
                      ),
                    ),
                  ),
                  Stack(
                    children: [
                      FadedScaleAnimation(
                        child:Image.asset('assets/img_dropinfo.png'),
                        //durationInMilliseconds: 400,
                      ),
                      PositionedDirectional(
                          end: 70,
                          bottom: 20,
                          child: Text(
                            locale.dropInfo!,
                            style: theme.textTheme.bodyText1!.copyWith(
                              fontWeight: FontWeight.w600,
                              fontSize: 16,
                            ),
                          )),
                    ],
                  ),
                  Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 12.0, vertical: 12),
                    child: EntryField(
                      textCapitalization: TextCapitalization.words,
                      // controller: _nameController,
                      label: AppLocalizations.of(context)!.drop!.toUpperCase(),
                      image: 'assets/Icons/ic_droppoint.png',
                      initialValue: '\n' + '1056, Central Residency, New York',
                      isCollapsed: true,
                      suffixIcon: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            locale.home!.toUpperCase(),
                            style: theme.textTheme.subtitle2!.copyWith(
                              color: kMainColor,
                              fontSize: 12,
                            ),
                          ),
                          SizedBox(
                            width: 8,
                          ),
                          Icon(
                            Icons.keyboard_arrow_down_sharp,
                            color: kMainColor,
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 12.0, vertical: 12),
                    child: EntryField(
                      textCapitalization: TextCapitalization.words,
                      // controller: _nameController,
                      label: locale.drop!.toUpperCase(),
                      image: 'assets/Icons/ic_droptime.png',
                      initialValue: '\n' + '24 June, 10:00 - 11:00',
                      isCollapsed: true,
                      suffixIcon: Icon(
                        Icons.keyboard_arrow_down_sharp,
                        color: kMainColor,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 150,
                  ),
                ],
              ),
            ),
            BottomBar(
                onTap: () =>
                    Navigator.pushNamed(context, PageRoutes.orderPlaced),
                text: locale.continueText),
          ],
        ),
        beginOffset: Offset(0, 0.3),
        endOffset: Offset(0, 0),
        slideCurve: Curves.linearToEaseOut,
      ),
    );
  }
}
