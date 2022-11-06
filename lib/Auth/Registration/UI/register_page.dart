import 'package:animation_wrappers/animation_wrappers.dart';
import 'package:any_wash/Components/bottom_bar.dart';
import 'package:any_wash/Components/entry_field.dart';
import 'package:any_wash/Locale/locales.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../../login_navigator.dart';

//register page for registration of a new user
class RegisterPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        title: Text(
          AppLocalizations.of(context)!.register!,
          style: Theme.of(context)
              .textTheme
              .caption!
              .copyWith(fontSize: 16.7, fontWeight: FontWeight.w600),
        ),
      ),

      //this column contains 3 textFields and a bottom bar
      body: FadedSlideAnimation(
        child: RegisterForm(),
        beginOffset: Offset(0, 0.3),
        endOffset: Offset(0, 0),
        slideCurve: Curves.linearToEaseOut,
      ),
    );
  }
}

class RegisterForm extends StatefulWidget {
  @override
  _RegisterFormState createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();

  // RegisterBloc _registerBloc;

  @override
  void initState() {
    super.initState();
    // _registerBloc = BlocProvider.of<RegisterBloc>(context);
  }

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        SingleChildScrollView(
          child: Container(
            height: MediaQuery.of(context).size.height,
            child: Column(
              children: <Widget>[
                Divider(
                  color: Theme.of(context).cardColor,
                  thickness: 8.0,
                ),
                //name textField
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 12.0, vertical: 12),
                  child: EntryField(
                    textCapitalization: TextCapitalization.words,
                    // controller: _nameController,
                    label:
                        AppLocalizations.of(context)!.fullName!.toUpperCase(),
                    image: 'assets/Icons/ic_name.png',
                    initialValue: '\n' + 'Mr A',
                    isCollapsed: true,
                  ),
                ),
                //email textField
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 12.0, vertical: 12),
                  child: EntryField(
                    textCapitalization: TextCapitalization.none,
                    //controller: _emailController,
                    label: AppLocalizations.of(context)!
                        .emailAddress!
                        .toUpperCase(),
                    image: 'assets/Icons/ic_mail.png',
                    keyboardType: TextInputType.emailAddress,
                    initialValue: '\n' + 'MrA@mail.com',
                    isCollapsed: true,
                  ),
                ),

                //phone textField
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 12.0, vertical: 12),
                  child: EntryField(
                    label: AppLocalizations.of(context)!
                        .mobileNumber!
                        .toUpperCase(),
                    image: 'assets/Icons/ic_phone.png',
                    keyboardType: TextInputType.number,
                    initialValue: '\n' + '+84 987 654 3210',
                    isCollapsed: true,
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.only(left: 20.0),
                  child: Text(
                    AppLocalizations.of(context)!.verificationText!,
                    style: Theme.of(context)
                        .textTheme
                        .headline6!
                        .copyWith(fontSize: 11),
                  ),
                ),
              ],
            ),
          ),
        ),
        BottomBar(
            text: AppLocalizations.of(context)!.continueText,
            onTap: () {
              Navigator.pushNamed(context, LoginRoutes.verification);
            })
      ],
    );
  }
}
