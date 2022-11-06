import 'package:any_wash/Chat/UI/animated_bottom_bar.dart';
import 'package:any_wash/Locale/locales.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import 'Account/UI/account_page.dart';
import 'Home/UI/home.dart';
import 'Order/UI/order_page.dart';

class HomeOrderAccount extends StatefulWidget {
  @override
  _HomeOrderAccountState createState() => _HomeOrderAccountState();
}

class _HomeOrderAccountState extends State<HomeOrderAccount> {
  int _currentIndex = 0;

  @override
  void initState() {
    super.initState();
  }

  void onTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  static String bottomIconHome = 'assets/FooterMenu/ic_home.png';

  static String bottomIconOrder = 'assets/FooterMenu/ic_orders.png';

  static String bottomIconAccount = 'assets/FooterMenu/ic_profile.png';

  @override
  Widget build(BuildContext context) {
    var appLocalization = AppLocalizations.of(context)!;
    final List<BarItem> barItems = [
      BarItem(
        text: appLocalization.homeText,
        image: bottomIconHome,
      ),
      BarItem(
        text: appLocalization.orderText,
        image: bottomIconOrder,
      ),
      BarItem(
        text: appLocalization.account,
        image: bottomIconAccount,
      ),
    ];

    final List<Widget> _children = [
      HomePage(),
      OrderPage(),
      AccountPage(),
    ];
    return Scaffold(
      body: _children[_currentIndex],
      bottomNavigationBar: AnimatedBottomBar(
          barItems: barItems,
          onBarTap: (index) {
            setState(() {
              _currentIndex = index;
            });
          }),
    );
  }
}
