import 'package:animation_wrappers/animation_wrappers.dart';
import 'package:any_wash/Locale/locales.dart';
import 'package:any_wash/Theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Review {
  final String? title;
  final double rating;
  final String date;
  final String? content;

  Review(this.title, this.rating, this.date, this.content);
}

class ReviewPage extends StatefulWidget {
  @override
  _ReviewPageState createState() => _ReviewPageState();
}

class _ReviewPageState extends State<ReviewPage> {
  @override
  Widget build(BuildContext context) {
    var appLocalization = AppLocalizations.of(context)!;
    final List<Review> listOfReviews = [
      Review(
          appLocalization.name1, 4.0, '5 April, 20', appLocalization.content1),
      Review(
          appLocalization.name2, 5.0, '23 Feb, 20', appLocalization.content2),
      Review('Jackson Demmy', 4.0, '23 Feb, 20', appLocalization.content2),
      Review('Opera Taylor', 4.5, '23 Feb, 20', appLocalization.content2),
      Review('Gelinia Hopeson', 5.0, '23 Feb, 20', appLocalization.content2),
      Review(
          appLocalization.name2, 5.0, '23 Feb, 20', appLocalization.content2),
      Review(
          appLocalization.name1, 5.0, '23 Feb, 20', appLocalization.content2),
      Review(
          appLocalization.name2, 5.0, '23 Feb, 20', appLocalization.content2),
    ];
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(90.0),
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 12.0),
          child: AppBar(
            title: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                SizedBox(
                  height: 30,
                ),
                Text(AppLocalizations.of(context)!.quickWasher!,
                    style: Theme.of(context).textTheme.headline4!.copyWith(
                        color: Theme.of(context).secondaryHeaderColor,
                        fontWeight: FontWeight.w600)),
                SizedBox(
                  height: 10.0,
                ),
                Row(
                  children: [
                    Icon(
                      Icons.star,
                      color: Colors.yellow,
                      size: 14,
                    ),
                    SizedBox(width: 8.0),
                    Text('4.2',
                        style: Theme.of(context).textTheme.overline!.copyWith(
                            color: kMainTextColor,
                            fontWeight: FontWeight.w500)),
                    SizedBox(width: 8.0),
                    Text('148 reviews',
                        style: Theme.of(context).textTheme.overline),
                  ],
                ),
                SizedBox(
                  height: 10.0,
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: 8.0,
                  color: Theme.of(context).cardColor,
                ),
              ],
            ),
          ),
        ),
      ),
      body: FadedSlideAnimation(
        child:Column(
          children: [
            Divider(
              color: Theme.of(context).cardColor,
              thickness: 8.0,
            ),
            Expanded(
              child: ListView.builder(
                  itemCount: listOfReviews.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: 20.0, vertical: 10.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            listOfReviews[index].title!,
                            style: Theme.of(context)
                                .textTheme
                                .headline4!
                                .copyWith(
                                    fontSize: 15.0,
                                    fontWeight: FontWeight.w700),
                          ),
                          Row(
                            children: [
                              Icon(
                                Icons.star,
                                color: Colors.yellow,
                                size: 14,
                              ),
                              SizedBox(width: 8.0),
                              Text(listOfReviews[index].rating.toString(),
                                  style: Theme.of(context)
                                      .textTheme
                                      .caption!
                                      .copyWith(
                                          color: kMainTextColor, fontSize: 13)),
                              Spacer(),
                              Text(
                                listOfReviews[index].date,
                                style: Theme.of(context)
                                    .textTheme
                                    .caption!
                                    .copyWith(
                                        fontSize: 11.7,
                                        color: Color(0xffd7d7d7)),
                              ),
                            ],
                          ),
                          Text(
                            listOfReviews[index].content!,
                            textAlign: TextAlign.justify,
                            style: Theme.of(context)
                                .textTheme
                                .caption!
                                .copyWith(color: Color(0xff6a6c74)),
                          )
                        ],
                      ),
                    );
                  }),
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
