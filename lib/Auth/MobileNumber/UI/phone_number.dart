import 'package:animation_wrappers/animation_wrappers.dart';
import 'package:any_wash/Auth/MobileNumber/UI/mobile_input.dart';
import 'package:any_wash/Locale/locales.dart';
import 'package:any_wash/Theme/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../login_navigator.dart';

//first page that takes phone number as input for verification
class PhoneNumber extends StatefulWidget {
  static const String id = 'phone_number';

  @override
  _PhoneNumberState createState() => _PhoneNumberState();
}

class _PhoneNumberState extends State<PhoneNumber>
    with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffEBF3F9),
      body: FadedSlideAnimation(
        child: SingleChildScrollView(
          child: Container(
            height: MediaQuery.of(context).size.height,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Spacer(
                  flex: 2,
                ),
                Expanded(
                  flex: 5,
                  child: Image.asset(
                    "assets/logo_user.png",
                    // scale: 3,
                  ),
                ),
                Spacer(
                  flex: 3,
                ),
                Expanded(
                  flex: 8,
                  child: FadedScaleAnimation(
                    child: Image.asset(
                      "assets/signIn.png",
                    ),
                    //durationInMilliseconds: 400,
                  ),
                ),
                MobileInput(),
                Expanded(
                  flex: 3,
                  child: Center(
                    child: Text(
                      AppLocalizations.of(context)!.or!,
                      style: Theme.of(context)
                          .textTheme
                          .bodyText2!
                          .copyWith(color: kMainTextColor),
                    ),
                  ),
                ),
                InkWell(
                  onTap: () =>
                      Navigator.pushNamed(context, LoginRoutes.socialLogin),
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: 50.0,
                    color: Color(0xff3a559f),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          'assets/Icons/ic_login_facebook.png',
                          height: 19.0,
                          width: 19.7,
                        ),
                        SizedBox(
                          width: 34.0,
                        ),
                        Text(AppLocalizations.of(context)!.continueWith!,
                            style: Theme.of(context)
                                .textTheme
                                .caption!
                                .copyWith(color: kWhiteColor)),
                        Text(AppLocalizations.of(context)!.facebook!,
                            style: Theme.of(context)
                                .textTheme
                                .caption!
                                .copyWith(
                                    color: kWhiteColor,
                                    fontWeight: FontWeight.bold)),
                      ],
                    ),
                  ),
                ),
                InkWell(
                  onTap: () =>
                      Navigator.pushNamed(context, LoginRoutes.socialLogin),
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: 50.0,
                    color: kWhiteColor,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset('assets/Icons/ic_login_google.png',
                            height: 19.0, width: 19.7),
                        SizedBox(
                          width: 34.0,
                        ),
                        Text(
                          AppLocalizations.of(context)!.continueWith!,
                          style: Theme.of(context)
                              .textTheme
                              .caption!
                              .copyWith(color: kMainTextColor),
                        ),
                        Text(AppLocalizations.of(context)!.google!,
                            style: Theme.of(context)
                                .textTheme
                                .caption!
                                .copyWith(
                                    fontWeight: FontWeight.bold,
                                    color: kMainTextColor)),
                      ],
                    ),
                  ),
                ),
                // InkWell(
                //   onTap: () =>
                //       Navigator.pushNamed(context, LoginRoutes.socialLogin),
                //   child: Container(
                //     width: MediaQuery.of(context).size.width,
                //     height: 50.0,
                //     color: Color(0xff000000),
                //     child: Row(
                //       mainAxisAlignment: MainAxisAlignment.center,
                //       children: [
                //         Image.asset('assets/Icons/ic_login_apple.png',
                //             height: 19.0, width: 19.7),
                //         SizedBox(
                //           width: 34.0,
                //         ),
                //         Text(AppLocalizations.of(context)!.continueWith!,
                //             style: Theme.of(context)
                //                 .textTheme
                //                 .caption!
                //                 .copyWith(color: kWhiteColor)),
                //         Text(AppLocalizations.of(context)!.apple!,
                //             style: Theme.of(context)
                //                 .textTheme
                //                 .caption!
                //                 .copyWith(
                //                     color: kWhiteColor,
                //                     fontWeight: FontWeight.bold)),
                //       ],
                //     ),
                //   ),
                // ),
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
