import 'package:animation_wrappers/animation_wrappers.dart';
import 'package:any_wash/Locale/locales.dart';
import 'package:any_wash/Routes/routes.dart';
import 'package:any_wash/Theme/colors.dart';
import 'package:any_wash/Theme/styles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class WalletItems {
  final String? title;
  final String subtitle;
  final String money;
  final String numberOfItems;

  WalletItems(this.title, this.subtitle, this.money, this.numberOfItems);
}

class WalletPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.wallet!,
            style: Theme.of(context)
                .textTheme
                .headline4!
                .copyWith(fontWeight: FontWeight.w500)),
        titleSpacing: 0.0,
        actions: [
          IconButton(
            icon: Icon(Icons.more_vert),
            onPressed: () {/*......*/},
          ),
        ],
      ),
      body: FadedSlideAnimation(
        child: Wallet(),
        beginOffset: Offset(0, 0.3),
        endOffset: Offset(0, 0),
        slideCurve: Curves.linearToEaseOut,
      ),
    );
  }
}

class Wallet extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var locale = AppLocalizations.of(context)!;
    List<WalletItems> _walletItems = [
      WalletItems(locale.quickWasher, '30 Jun, 2020, 11:59 am', '21.00',
          '3 ' + locale.items!),
      WalletItems(locale.laundry! + ' 24*7', '30 Jun, 2020, 11:59 am', '15.50',
          '2 ' + locale.items!),
      WalletItems(locale.moneyAdded, '30 Jun, 2020, 11:59 am', '     -\$100.00',
          '  ' + locale.sentToBank!),
      WalletItems(
          locale.quickWasher, '30 Jun, 2020, 11:59 am', '10.50', '1 item'),
      WalletItems(locale.whiteWash, '30 Jun, 2020, 11:59 am', '24.00',
          '3 ' + locale.items!),
      WalletItems('Jackson ' + locale.laundry!, '30 Jun, 2020, 11:59 am',
          '13.00', '3 ' + locale.items!),
      WalletItems(locale.laundrySpot, '30 Jun, 2020, 11:59 am', '28.50',
          '3 ' + locale.items!),
    ];
    return SingleChildScrollView(
      physics: BouncingScrollPhysics(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Container(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 12.0),
              child: ListTile(
                title: Text(
                  AppLocalizations.of(context)!.availableBalance!.toUpperCase(),
                  style: Theme.of(context).textTheme.headline6!.copyWith(
                      letterSpacing: 0.67,
                      color: kHintColor,
                      fontWeight: FontWeight.w500),
                ),
                subtitle: Text(
                  '\$ 258.50',
                  style: listTitleTextStyle.copyWith(
                      fontSize: 35.0, color: kMainColor, letterSpacing: 0.18),
                ),
              ),
            ),
          ),
          Stack(
            clipBehavior: Clip.none,
            children: [
              Container(
                height: 40.0,
                width: double.infinity,
                padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
                color: Theme.of(context).cardColor,
                child: Text(
                  AppLocalizations.of(context)!.recent!,
                  style: Theme.of(context).textTheme.subtitle2!.copyWith(
                      color: kTextColor,
                      fontWeight: FontWeight.w500,
                      letterSpacing: 0.08),
                ),
              ),
              Positioned.directional(
                textDirection: Directionality.of(context),
                bottom: 20.0,
                end: 20.0,
                child: Container(
                  height: 46.0,
                  width: 134.0,
                  color: kMainColor,
                  child: FadedScaleAnimation(
                    child: TextButton(
                      style: TextButton.styleFrom(
                        backgroundColor: kMainColor,
                      ),
                      onPressed: () =>
                          Navigator.pushNamed(context, PageRoutes.addMoney),
                      child: Text(
                        AppLocalizations.of(context)!.addMoney!,
                        style: bottomBarTextStyle.copyWith(
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                    // durationInMilliseconds: 400,
                  ),
                ),
              ),
            ],
          ),
          ListView.builder(
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: _walletItems.length,
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    ListTile(
                      title: Text(_walletItems[index].title!,
                          style: Theme.of(context)
                              .textTheme
                              .caption!
                              .copyWith(fontWeight: FontWeight.bold)),
                      subtitle: Text(_walletItems[index].subtitle,
                          style: Theme.of(context)
                              .textTheme
                              .headline6!
                              .copyWith(color: kTextColor, fontSize: 11.7)),
                      trailing: Column(
                        children: [
                          index == 2
                              ? Text(
                                  _walletItems[index].money,
                                  style: Theme.of(context)
                                      .textTheme
                                      .caption!
                                      .copyWith(
                                          fontWeight: FontWeight.w500,
                                          color: Colors.green),
                                )
                              : Text(
                                  '\$' + _walletItems[index].money,
                                  style: Theme.of(context)
                                      .textTheme
                                      .caption!
                                      .copyWith(
                                          fontWeight: FontWeight.w500,
                                          color: Color(0xffe32a2a)),
                                ),
                          SizedBox(height: 10.0),
                          Text(_walletItems[index].numberOfItems,
                              style: Theme.of(context)
                                  .textTheme
                                  .headline6!
                                  .copyWith(color: kTextColor, fontSize: 11.7)),
                        ],
                      ),
                    ),
                    Divider(
                      color: Theme.of(context).cardColor,
                      thickness: 3.0,
                    ),
                  ],
                );
              }),
        ],
      ),
    );
  }
}
