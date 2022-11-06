import 'package:animation_wrappers/animation_wrappers.dart';
import 'package:any_wash/Components/list_tile.dart';
import 'package:any_wash/Locale/locales.dart';
import 'package:any_wash/Routes/routes.dart';
import 'package:any_wash/Theme/colors.dart';
import 'package:flutter/material.dart';

class PaymentPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(64.0),
        child: AppBar(
          automaticallyImplyLeading: true,
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                AppLocalizations.of(context)!.selectPayment!,
                style: Theme.of(context).textTheme.headline4,
              ),
              SizedBox(
                height: 8.0,
              ),
              Text(
                AppLocalizations.of(context)!.amount! + '\$ 18.00',
                style: Theme.of(context)
                    .textTheme
                    .headline6!
                    .copyWith(color: kDisabledColor),
              ),
            ],
          ),
        ),
      ),
      body: FadedSlideAnimation(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Divider(
                color: Theme.of(context).cardColor,
                thickness: 6.7,
              ),
              // ListTile(
              //   onTap: () =>
              //       Navigator.pushNamed(context, PageRoutes.selectLocation),
              //   contentPadding:
              //       EdgeInsets.symmetric(vertical: 4.0, horizontal: 20.0),
              //   leading: FadedScaleAnimation(
              //     child: Image.asset(
              //       'assets/PaymentOptions/ic_cod.png',
              //       height: 25.3,
              //     ),
              //     //durationInMilliseconds: 600,
              //   ),
              //   title: Text(
              //     AppLocalizations.of(context)!.wallet!,
              //     style: Theme.of(context).textTheme.headline4!.copyWith(
              //         fontWeight: FontWeight.w500, letterSpacing: 0.07),
              //   ),
              //   trailing: Text(
              //     '\$ 258.50',
              //     style: Theme.of(context)
              //         .textTheme
              //         .caption!
              //         .copyWith(color: kDisabledColor),
              //   ),
              // ),
              Container(
                padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
                color: Theme.of(context).cardColor,
                child: Text(AppLocalizations.of(context)!.card!.toUpperCase(),
                    style: Theme.of(context).textTheme.caption!.copyWith(
                        color: kDisabledColor,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 0.67)),
              ),
              BuildListTile(
                onTap: () =>
                    Navigator.pushNamed(context, PageRoutes.selectLocation),
                image: 'assets/PaymentOptions/ic_card.png',
                text: AppLocalizations.of(context)!.credit,
              ),
              BuildListTile(
                onTap: () =>
                    Navigator.pushNamed(context, PageRoutes.selectLocation),
                image: 'assets/PaymentOptions/ic_card.png',
                text: AppLocalizations.of(context)!.debit,
              ),
              Container(
                padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
                color: Theme.of(context).cardColor,
                child: Text(
                  AppLocalizations.of(context)!.cash!.toUpperCase(),
                  style: Theme.of(context).textTheme.caption!.copyWith(
                      color: kDisabledColor,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 0.67),
                ),
              ),
              BuildListTile(
                image: 'assets/PaymentOptions/ic_cod.png',
                text: AppLocalizations.of(context)!.cod,
                onTap: () =>
                    Navigator.pushNamed(context, PageRoutes.selectLocation),
              ),
              Container(
                padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
                color: Theme.of(context).cardColor,
                child: Text(
                  AppLocalizations.of(context)!.other!.toUpperCase(),
                  style: Theme.of(context).textTheme.caption!.copyWith(
                      color: kDisabledColor,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 0.67),
                ),
              ),
              BuildListTile(
                onTap: () =>
                    Navigator.pushNamed(context, PageRoutes.selectLocation),
                image: 'assets/PaymentOptions/ic_paypal.png',
                text: AppLocalizations.of(context)!.paypal,
              ),

              Container(
                color: Theme.of(context).cardColor,
                height: 200,
              ),
            ],
          ),
        ),
        beginOffset: Offset(0, 0.3),
        endOffset: Offset(0, 0),
        slideCurve: Curves.linearToEaseOut,
      ),
    );
  }
}
