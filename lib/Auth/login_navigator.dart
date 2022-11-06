import 'package:any_wash/Auth/social.dart';
import 'package:any_wash/Routes/routes.dart';
import 'package:flutter/material.dart';

import 'MobileNumber/UI/phone_number.dart';
import 'Registration/UI/register_page.dart';
import 'Verification/UI/verification_page.dart';

GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

class LoginRoutes {
  static const String signInRoot = 'signIn/';
  static const String signUp = 'login/signUp';
  static const String verification = 'login/verification';
  static const String socialLogin = 'login/social_login';
}

class LoginNavigator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        var canPop = navigatorKey.currentState!.canPop();
        if (canPop) {
          navigatorKey.currentState!.pop();
        }
        return !canPop;
      },
      child: Navigator(
        key: navigatorKey,
        initialRoute: LoginRoutes.signInRoot,
        onGenerateRoute: (RouteSettings settings) {
          late WidgetBuilder builder;
          switch (settings.name) {
            case LoginRoutes.signInRoot:
              builder = (BuildContext _) => PhoneNumber();
              break;
            case LoginRoutes.signUp:
              builder = (BuildContext _) => RegisterPage();
              break;
            case LoginRoutes.verification:
              builder = (BuildContext _) => VerificationPage(() {
                    Navigator.popAndPushNamed(
                        context, PageRoutes.homeOrderAccountPage);
                  });
              break;
            case LoginRoutes.socialLogin:
              builder = (BuildContext _) => SocialLogIn();
              break;
          }
          return MaterialPageRoute(builder: builder, settings: settings);
        },
        onPopPage: (Route<dynamic> route, dynamic result) {
          return route.didPop(result);
        },
      ),
    );
  }
}
