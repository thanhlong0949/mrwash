import 'package:animation_wrappers/animation_wrappers.dart';
import 'package:any_wash/Components/bottom_bar.dart';
import 'package:any_wash/Components/entry_field.dart';
import 'package:any_wash/Locale/locales.dart';
import 'package:any_wash/Routes/routes.dart';
import 'package:any_wash/Theme/colors.dart';
import 'package:flutter/material.dart';

class RateNow extends StatefulWidget {
  @override
  _RateNowState createState() => _RateNowState();
}

class _RateNowState extends State<RateNow> {
  TextEditingController _controller = TextEditingController();
  double? rating;

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(100.0),
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 15.0),
          child: AppBar(
            centerTitle: true,
            title: Text(AppLocalizations.of(context)!.rate!,
                style: Theme.of(context)
                    .textTheme
                    .headline4!
                    .copyWith(color: kMainTextColor)),
          ),
        ),
      ),
      body: FadedSlideAnimation(
        child:Stack(
          children: [
            ListView(
              children: [
                Text(
                  AppLocalizations.of(context)!.how!,
                  textAlign: TextAlign.center,
                  style: Theme.of(context)
                      .textTheme
                      .headline4!
                      .copyWith(fontWeight: FontWeight.w500),
                ),
                Text(
                  AppLocalizations.of(context)!.withR!,
                  textAlign: TextAlign.center,
                  style: Theme.of(context)
                      .textTheme
                      .headline4!
                      .copyWith(fontWeight: FontWeight.w500),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 24.0),
                  child: FadedScaleAnimation(
                    child: Image.asset(
                      'assets/Stores/1.png',
                      height: 83.3,
                      width: 83.3,
                    ),
                    //durationInMilliseconds: 400,
                  ),
                ),
                Text(
                  'Quickdeliveries',
                  textAlign: TextAlign.center,
                  style: Theme.of(context)
                      .textTheme
                      .headline4!
                      .copyWith(fontWeight: FontWeight.w400, fontSize: 15.0),
                ),
                SizedBox(
                  height: 8.0,
                ),
                Text(
                  'Food & Meals',
                  textAlign: TextAlign.center,
                  style: Theme.of(context)
                      .textTheme
                      .caption!
                      .copyWith(fontSize: 12.0, color: Color(0xff888888)),
                ),
                // Padding(
                //   padding: const EdgeInsets.symmetric(vertical: 44.0),
                //   child: Center(
                //     child: RatingBar(
                //       minRating: 1,
                //       itemCount: 5,
                //       glowColor: kTransparentColor,
                //       unratedColor: Color(0xffe6e6e6),
                //       onRatingUpdate: (value) {
                //         rating = value;
                //       },
                //       itemBuilder: (context, _) => Icon(
                //         Icons.star,
                //         color: kMainColor,
                //       ), ratingWidget: null,
                //     ),
                //   ),
                // ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 24.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      SizedBox(
                        width: 20,
                      ),
                      Icon(
                        Icons.star,
                        size: 34,
                        color: kIconColor,
                      ),
                      Icon(
                        Icons.star,
                        size: 34,
                        color: kIconColor,
                      ),
                      Icon(
                        Icons.star,
                        size: 34,
                        color: kIconColor,
                      ),
                      Icon(
                        Icons.star,
                        size: 34,
                        color: kIconColor,
                      ),
                      Icon(
                        Icons.star,
                        size: 34,
                        color: kIconColor,
                      ),
                      SizedBox(
                        width: 20,
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 44.0),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      AppLocalizations.of(context)!.addReview!.toUpperCase(),
                      style: Theme.of(context).textTheme.caption!.copyWith(
                          fontWeight: FontWeight.w400,
                          fontSize: 12.0,
                          color: Color(0xff838383),
                          letterSpacing: 0.5),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 36.0),
                  child: EntryField(
                    controller: _controller,
                    label: AppLocalizations.of(context)!.writeReview,
                  ),
                ),
              ],
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: BottomBar(
                  onTap: () => Navigator.pushNamed(
                      context, PageRoutes.homeOrderAccountPage),
                  text: AppLocalizations.of(context)!.feedback),
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
