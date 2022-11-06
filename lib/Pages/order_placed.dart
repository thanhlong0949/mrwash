import 'package:animation_wrappers/animation_wrappers.dart';
import 'package:any_wash/Components/bottom_bar.dart';
import 'package:any_wash/Locale/locales.dart';
import 'package:any_wash/Routes/routes.dart';
import 'package:any_wash/Theme/colors.dart';
import 'package:flutter/material.dart';

class OrderPlaced extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var locale = AppLocalizations.of(context)!;
    return Scaffold(
      body: FadedSlideAnimation(
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            SingleChildScrollView(
              child: Container(
                height: MediaQuery.of(context).size.height,
                child: Column(
                  children: <Widget>[
                    Spacer(
                      flex: 1,
                    ),
                    Expanded(
                      flex: 3,
                      child: FadedScaleAnimation(
                        child: Image.asset(
                          'assets/img_orderpalced.png',
                        ),
                        //durationInMilliseconds: 400,
                      ),
                    ),
                    Text(
                      AppLocalizations.of(context)!.placed!,
                      style: Theme.of(context).textTheme.bodyText1!.copyWith(
                          fontSize: 23.3, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      '\n\n' +
                          AppLocalizations.of(context)!.thanks! +
                          '\n' +
                          locale.deliveringYourNeeds! +
                          '\n\n' +
                          locale.youCanCheck! +
                          '\n' +
                          locale.inMyOrderSection!,
                      textAlign: TextAlign.center,
                      style: Theme.of(context)
                          .textTheme
                          .subtitle2!
                          .copyWith(color: kDisabledColor, fontSize: 16),
                    ),
                    Spacer(
                      flex: 2,
                    ),
                  ],
                ),
              ),
            ),
            BottomBar(
              text: AppLocalizations.of(context)!.orderText,
              onTap: () =>
                  Navigator.pushNamed(context, PageRoutes.homeOrderAccountPage),
            )
          ],
        ),
        beginOffset: Offset(0, 0.3),
        endOffset: Offset(0, 0),
        slideCurve: Curves.linearToEaseOut,
      ),
    );
  }
}
