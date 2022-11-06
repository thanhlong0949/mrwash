import 'package:animation_wrappers/animation_wrappers.dart';
import 'package:any_wash/Components/bottom_bar.dart';
import 'package:any_wash/Components/entry_field.dart';
import 'package:any_wash/Locale/locales.dart';
import 'package:any_wash/Theme/colors.dart';
import 'package:any_wash/Theme/styles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class AddMoney extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.addMoney!,
            style: Theme.of(context)
                .textTheme
                .headline4!
                .copyWith(fontWeight: FontWeight.w500)),
        titleSpacing: 0.0,
      ),
      body: FadedSlideAnimation(
        child: Add(),
        beginOffset: Offset(0, 0.3),
        endOffset: Offset(0, 0),
        slideCurve: Curves.linearToEaseOut,
      ),
    );
  }
}

class Add extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        ListView(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.all(20.0),
              child: Row(
                children: <Widget>[
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.only(bottom: 8.0),
                        child: Text(
                          AppLocalizations.of(context)!
                              .availableBalance!
                              .toUpperCase(),
                          style: Theme.of(context).textTheme.headline6!.copyWith(
                              letterSpacing: 0.67,
                              color: kHintColor,
                              fontWeight: FontWeight.w500),
                        ),
                      ),
                      Text(
                        '\$ 258.50',
                        style: listTitleTextStyle.copyWith(
                            fontSize: 35.0,
                            color: kMainColor,
                            letterSpacing: 0.18),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Divider(
              color: Theme.of(context).cardColor,
              thickness: 8.0,
            ),
            Padding(
              padding: EdgeInsets.only(left: 12.0),
              child: Column(
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(top: 20.0, bottom: 10.0, left: 8),
                    child: Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        AppLocalizations.of(context)!.bankInfo!.toUpperCase(),
                        style: Theme.of(context).textTheme.headline6!.copyWith(
                            fontWeight: FontWeight.w500,
                            letterSpacing: 0.67,
                            color: kHintColor),
                      ),
                    ),
                  ),
                  EntryField(
                    textCapitalization: TextCapitalization.words,
                    label: AppLocalizations.of(context)!
                        .accountHolderName!
                        .toUpperCase(),
                    initialValue: 'Samantha Smith',
                  ),
                  EntryField(
                    textCapitalization: TextCapitalization.words,
                    label: AppLocalizations.of(context)!.bankName!.toUpperCase(),
                    initialValue: 'HBNC Bank of New York',
                  ),
                  EntryField(
                    textCapitalization: TextCapitalization.none,
                    label:
                        AppLocalizations.of(context)!.branchCode!.toUpperCase(),
                    initialValue: '+1 987 654 3210',
                  ),
                  EntryField(
                    textCapitalization: TextCapitalization.none,
                    label: AppLocalizations.of(context)!
                        .accountNumber!
                        .toUpperCase(),
                    initialValue: '4321 4567 6789 8901',
                  ),
                ],
              ),
            ),
            Divider(
              color: Theme.of(context).cardColor,
              thickness: 8.0,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 12.0),
              child: EntryField(
                textCapitalization: TextCapitalization.words,
                label: AppLocalizations.of(context)!
                    .enterAmountToTransfer!
                    .toUpperCase(),
                initialValue: '\$ 500',
              ),
            ),
          ],
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: BottomBar(
            text: AppLocalizations.of(context)!.addMoney,
            onTap: () => Navigator.pop(context),
          ),
        )
      ],
    );
  }
}
