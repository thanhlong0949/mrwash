import 'package:any_wash/Components/list_tile.dart';
import 'package:any_wash/Locale/locales.dart';
import 'package:any_wash/Routes/routes.dart';
import 'package:any_wash/Theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';

class AccountPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.account!,
            style:
                Theme.of(context).textTheme.headline4!.copyWith(fontSize: 20)),
        centerTitle: true,
      ),
      body: Account(),
    );
  }
}

class Account extends StatefulWidget {
  @override
  _AccountState createState() => _AccountState();
}

class _AccountState extends State<Account> {
  String? number;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        UserDetails(),
        Divider(
          color: Theme.of(context).cardColor,
          thickness: 8.0,
        ),
        AddressTile(),
        // BuildListTile(
        //   image: 'assets/Account/ic_wallet.png',
        //   text: AppLocalizations.of(context)!.wallet,
        //   onTap: () => Navigator.pushNamed(context, PageRoutes.wallet),
        // ),
        BuildListTile(
            image: 'assets/Account/ic_menu_tnc.png',
            text: AppLocalizations.of(context)!.tnc,
            onTap: () => Navigator.pushNamed(context, PageRoutes.tncPage)),
        BuildListTile(
            image: 'assets/Account/ic_menu_support.png',
            text: AppLocalizations.of(context)!.support,
            onTap: () => Navigator.pushNamed(context, PageRoutes.supportPage,
                arguments: number)),
        BuildListTile(
          image: 'assets/Account/ic_setting.png',
          text: AppLocalizations.of(context)!.settings,
          onTap: () => Navigator.pushNamed(context, PageRoutes.settings),
        ),
        LogoutTile(),
      ],
    );
  }
}

class AddressTile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BuildListTile(
        image: 'assets/Account/ic_menu_address.png',
        text: AppLocalizations.of(context)!.saved,
        onTap: () {
          Navigator.pushNamed(context, PageRoutes.savedAddressesPage);
        });
  }
}

class LogoutTile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BuildListTile(
      image: 'assets/Account/ic_menu_logout.png',
      text: AppLocalizations.of(context)!.logout,
      onTap: () {
        showDialog(
            context: context,
            barrierDismissible: false,
            builder: (BuildContext context) {
              return AlertDialog(
                title: Text(AppLocalizations.of(context)!.loggingOut!),
                content: Text(AppLocalizations.of(context)!.areYouSure!),
                actions: <Widget>[
                  TextButton(
                    child: Text(
                      AppLocalizations.of(context)!.no!,
                      style: TextStyle(
                        color: kMainColor,
                      ),
                    ),
                    style: TextButton.styleFrom(
                      shape: RoundedRectangleBorder(
                          side: BorderSide(color: kTransparentColor)),
                    ),
                    onPressed: () => Navigator.pop(context),
                  ),
                  TextButton(
                      child: Text(
                        AppLocalizations.of(context)!.yes!,
                        style: TextStyle(
                          color: kMainColor,
                        ),
                      ),
                      style: TextButton.styleFrom(
                        shape: RoundedRectangleBorder(
                            side: BorderSide(color: kTransparentColor)),
                      ),
                      onPressed: () {
                        Phoenix.rebirth(context);
                      })
                ],
              );
            });
      },
    );
  }
}

class UserDetails extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text('\n' + 'Mr A',
              style: Theme.of(context)
                  .textTheme
                  .headline4!
                  .copyWith(fontSize: 20, fontWeight: FontWeight.w600)),
          SizedBox(
            height: 10.0,
          ),
          Text('+84 987 654 3210',
              style: Theme.of(context)
                  .textTheme
                  .subtitle2!
                  .copyWith(color: Color(0xff9a9a9a))),
          SizedBox(
            height: 3.0,
          ),
          Text('MrA@mail.com',
              style: Theme.of(context)
                  .textTheme
                  .subtitle2!
                  .copyWith(color: Color(0xff9a9a9a))),
        ],
      ),
    );
  }
}
