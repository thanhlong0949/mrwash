import 'package:animation_wrappers/animation_wrappers.dart';
import 'package:any_wash/Locale/locales.dart';
import 'package:flutter/material.dart';

class TncPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        titleSpacing: 0.0,
        title: Text(AppLocalizations.of(context)!.tnc!,
            style: Theme.of(context).textTheme.headline4),
      ),
      body: FadedSlideAnimation(
        child: SingleChildScrollView(
          child: Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Container(
                  padding: EdgeInsets.all(48.0),
                  color: Theme.of(context).cardColor,
                  child: FadedScaleAnimation(
                    child: Image(
                      image: AssetImage("assets/logo_user.png"), //delivoo logo
                      height: 130.0,
                      width: 99.7,
                    ),
                    // durationInMilliseconds: 400,
                  ),
                ),
                Padding(
                  padding:
                      EdgeInsets.symmetric(vertical: 28.0, horizontal: 20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        AppLocalizations.of(context)!.termsOfUse!,
                        style: Theme.of(context).textTheme.headline4,
                      ),
                      Text(
                        '\nLorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.\n\n',
                        style: Theme.of(context).textTheme.caption,
                      ),
                      Text(
                        AppLocalizations.of(context)!.companyPolicy!,
                        style: Theme.of(context).textTheme.headline4,
                      ),
                      Text(
                        '\nLorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. ',
                        style: Theme.of(context).textTheme.caption,
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
        beginOffset: Offset(0, 0.3),
        endOffset: Offset(0, 0),
        slideCurve: Curves.linearToEaseOut,
      ),
    );
  }
}
