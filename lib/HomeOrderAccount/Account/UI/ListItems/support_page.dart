import 'package:animation_wrappers/animation_wrappers.dart';
import 'package:any_wash/Components/bottom_bar.dart';
import 'package:any_wash/Components/entry_field.dart';
import 'package:any_wash/Locale/locales.dart';
import 'package:flutter/material.dart';

class SupportPage extends StatefulWidget {
  static const String id = 'support_page';
  final String? number;

  SupportPage({this.number});

  @override
  _SupportPageState createState() => _SupportPageState();
}

class _SupportPageState extends State<SupportPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        titleSpacing: 0.0,
        title: Text(AppLocalizations.of(context)!.support!,
            style: Theme.of(context).textTheme.headline4),
      ),
      body: FadedSlideAnimation(
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            SingleChildScrollView(
              child: Container(
                height: MediaQuery.of(context).size.height + 150,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    Container(
                      padding: EdgeInsets.symmetric(vertical: 48.0),
                      color: Theme.of(context).cardColor,
                      child: FadedScaleAnimation(
                        child: Image.asset(
                          'assets/logo_user.png',
                          height: 130.0,
                          width: 99.7,
                        ),
                        // durationInMilliseconds: 400,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                          vertical: 24.0, horizontal: 16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Padding(
                            padding: EdgeInsets.only(left: 8.0, top: 16.0),
                            child: Text(
                              AppLocalizations.of(context)!.orWrite!,
                              style: Theme.of(context)
                                  .textTheme
                                  .headline4!
                                  .copyWith(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w700),
                            ),
                          ),
                          SizedBox(height: 10.0),
                          Padding(
                            padding: EdgeInsets.only(left: 8.0, bottom: 16.0),
                            child: Text(
                              AppLocalizations.of(context)!.willGetBack!,
                              style: Theme.of(context).textTheme.caption,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 12.0, vertical: 12),
                            child: EntryField(
                              label: AppLocalizations.of(context)!
                                  .mobileNumber!
                                  .toUpperCase(),
                              image: 'assets/Icons/ic_phone.png',
                              keyboardType: TextInputType.number,
                              initialValue: '\n' + '+1 987 654 3210',
                              isCollapsed: true,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 12.0, vertical: 12),
                            child: EntryField(
                              textCapitalization: TextCapitalization.none,
                              //controller: _emailController,
                              label: AppLocalizations.of(context)!
                                  .yourMessage!
                                  .toUpperCase(),
                              image: 'assets/Icons/ic_mail.png',
                              keyboardType: TextInputType.emailAddress,
                              initialValue: '\n' +
                                  AppLocalizations.of(context)!
                                      .enterYourMessage!,
                              isCollapsed: true,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            BottomBar(
              text: AppLocalizations.of(context)!.submit,
              onTap: () {
                /*............*/
              },
            ),
          ],
        ),
        beginOffset: Offset(0, 0.3),
        endOffset: Offset(0, 0),
        slideCurve: Curves.linearToEaseOut,
      ),
    );
  }
}
