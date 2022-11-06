import 'package:animation_wrappers/animation_wrappers.dart';
import 'package:any_wash/Auth/login_navigator.dart';
import 'package:any_wash/Components/bottom_bar.dart';
import 'package:any_wash/Components/entry_field.dart';
import 'package:any_wash/Locale/locales.dart';
import 'package:flutter/material.dart';

class SocialLogIn extends StatefulWidget {
  @override
  _SocialLogInState createState() => _SocialLogInState();
}

class _SocialLogInState extends State<SocialLogIn> {
  final TextEditingController _controller = TextEditingController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var locale = AppLocalizations.of(context)!;
    return Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(100),
          child: AppBar(
            automaticallyImplyLeading: true,
          ),
        ),
        body: FadedSlideAnimation(
          child: Stack(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Hey Mr A,',
                      style: Theme.of(context).textTheme.headline4!.copyWith(
                          fontSize: 26.0, fontWeight: FontWeight.w600),
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    Text(
                      locale.youAreAlmostIn! + '\n' + locale.pleaseProvide!,
                      style: Theme.of(context).textTheme.headline4!.copyWith(
                          fontSize: 16.0, fontWeight: FontWeight.w600),
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                          top: 12, bottom: 12, left: 0, right: 12),
                      child: EntryField(
                        label: locale.phoneNumber!.toUpperCase(),
                        image: 'assets/Icons/ic_phone.png',
                        keyboardType: TextInputType.number,
                        initialValue: '\n' + '+84 987 654 3210',
                        isCollapsed: true,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 58.0),
                      child: Text(
                        AppLocalizations.of(context)!.verificationText!,
                        style: Theme.of(context).textTheme.headline6!.copyWith(
                            fontSize: 10, fontWeight: FontWeight.w500),
                      ),
                    ),
                  ],
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: BottomBar(
                    text: AppLocalizations.of(context)!.continueText,
                    onTap: () {
                      Navigator.pushNamed(context, LoginRoutes.verification);
                    }),
              )
            ],
          ),
          beginOffset: Offset(0, 0.3),
          endOffset: Offset(0, 0),
          slideCurve: Curves.linearToEaseOut,
        ));
  }
}
