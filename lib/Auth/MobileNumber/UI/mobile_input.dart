import 'package:any_wash/Auth/MobileNumber/UI/phone_number.dart';
import 'package:any_wash/Auth/login_navigator.dart';
import 'package:any_wash/Components/entry_field.dart';
import 'package:any_wash/Locale/locales.dart';
import 'package:any_wash/Theme/colors.dart';
import 'package:country_code_picker/country_code_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MobileInput extends StatefulWidget {
  static String verify = "";
  @override
  _MobileInputState createState() => _MobileInputState();
}

class _MobileInputState extends State<MobileInput> {
  final TextEditingController _controller = TextEditingController();
  String? isoCode;
  String? isoNum;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: kWhiteColor,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Row(
          children: <Widget>[
            CountryCodePicker(
              onChanged: (value) {
                isoCode = value.dialCode;
              },
              builder: (value) => buildButton(value),
              initialSelection: 'US',
              textStyle: Theme.of(context)
                  .textTheme
                  .caption!
                  .copyWith(fontWeight: FontWeight.bold),
              showFlag: false,
              showFlagDialog: true,
              favorite: ['+84', 'VN'],
            ),
            SizedBox(
              width: 10.0,
            ),
            //takes phone number as input
            Expanded(
              child: EntryField(
                controller: _controller,
                keyboardType: TextInputType.number,
                readOnly: false,
                hint: AppLocalizations.of(context)!.mobileText,
                maxLength: 10,
                border: InputBorder.none,
              ),
            ),

            //if phone number is valid, button gets enabled and takes to register screen
            TextButton(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 12.0, vertical: 0.0),
                child: Text(
                  AppLocalizations.of(context)!.continueText!,
                  style: Theme.of(context).textTheme.button,
                ),
              ),
              style: TextButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                  backgroundColor: Theme.of(context).primaryColor,
                  elevation: 2),
              onPressed: () async {
                await FirebaseAuth.instance.verifyPhoneNumber(
                    phoneNumber: '${isoCode.toString() + _controller.text}',
                    // phoneNumber: "+840844400046",
                    verificationCompleted:
                        (PhoneAuthCredential phoneAuthCredential) {},
                    verificationFailed: (FirebaseAuthException e) {},
                    codeSent: (String verificationId, int? resendToken) {
                      MobileInput.verify = verificationId;
                      Navigator.pushNamed(context, LoginRoutes.verification);
                    },
                    codeAutoRetrievalTimeout: (String verificationId) {});
              },
            ),
          ],
        ),
      ),
    );
  }

  buildButton(CountryCode? isoCode) {
    return Row(
      children: <Widget>[
        Text(
          '$isoCode',
          style: Theme.of(context)
              .textTheme
              .caption!
              .copyWith(fontWeight: FontWeight.w700),
        ),
      ],
    );
  }
}
