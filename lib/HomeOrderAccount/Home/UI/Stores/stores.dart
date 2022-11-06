import 'package:animation_wrappers/animation_wrappers.dart';
import 'package:any_wash/Components/custom_appbar.dart';
import 'package:any_wash/Locale/locales.dart';
import 'package:any_wash/Routes/routes.dart';
import 'package:any_wash/Theme/colors.dart';
import 'package:flutter/material.dart';

class DetailsOfStore {
  final String? name;
  final String address;
  final String rating;
  final String image;
  final String time;

  DetailsOfStore(this.name, this.address, this.rating, this.image, this.time);
}

class StoresPage extends StatelessWidget {
  final String pageTitle;

  StoresPage(this.pageTitle);

  final int noOfStores = 28;

  @override
  Widget build(BuildContext context) {
    var locale = AppLocalizations.of(context)!;
    List<DetailsOfStore> detailsOfStore = [
      DetailsOfStore(locale.quickWasher, ' 6.4 km | Phan văn trị', '4.2',
          'assets/Stores/1.png', '08.00 - 20.00'),
      DetailsOfStore('MR Wash Quận 3', ' 6.4 km | Phạm Ngọc Thạch', '4.8',
          'assets/Stores/1.png', '08.00 - 20.00'),
      DetailsOfStore('MR Wash Quận 9', ' 6.4 km | Lê Văn Việt', '4.5',
          'assets/Stores/1.png', '08.00 - 20.00'),
      DetailsOfStore('MR Wash Quận 7', ' 6.4 km | Nguyễn Văn Linh', '3.9',
          'assets/Stores/1.png', '08.00 - 20.00'),
      DetailsOfStore('MR Wash Quận 12', ' 6.4 km | Nguyễn Ảnh Thủ ', '4.5',
          'assets/Stores/1.png', '08.00 - 20.00'),
      DetailsOfStore('Mr Wash Quận 1', ' 6.4 km | NGuyễn Thị Minh Khai', '4.2',
          'assets/Stores/1.png', '08.00 - 20.00'),
      DetailsOfStore('MR Wash Quận 3', ' 6.4 km | Phạm Ngọc Thạch', '4.2',
          'assets/Stores/1.png', '08.00 - 20.00'),
    ];
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(126.0),
        child: CustomAppBar(
          titleWidget: Text(
            locale.nearbyLaundries!,
            style: Theme.of(context).textTheme.headline4,
          ),
          hint: AppLocalizations.of(context)!.searchLaundryStore,
        ),
      ),
      body: FadedSlideAnimation(
        child: ListView(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(left: 20.0, top: 20.0, right: 20.0),
              child: Text(
                '$noOfStores ' + AppLocalizations.of(context)!.storeFound!,
                style: Theme.of(context)
                    .textTheme
                    .headline6!
                    .copyWith(color: kHintColor),
              ),
            ),
            ListView.builder(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: 7,
                itemBuilder: (context, index) {
                  return Padding(
                    padding:
                        EdgeInsets.only(left: 20.0, top: 25.3, right: 20.0),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, PageRoutes.items);
                      },
                      child: Row(
                        children: <Widget>[
                          FadedScaleAnimation(
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(8),
                              child: Image(
                                image: AssetImage(detailsOfStore[index].image),
                                height: 93.3,
                              ),
                            ),
                            // durationInMilliseconds: 400,
                          ),
                          SizedBox(width: 13.3),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(detailsOfStore[index].name!,
                                  style: Theme.of(context)
                                      .textTheme
                                      .subtitle2!
                                      .copyWith(
                                          color: Theme.of(context)
                                              .secondaryHeaderColor)),
                              SizedBox(height: 8.0),
                              Row(
                                children: <Widget>[
                                  Icon(
                                    Icons.location_on,
                                    color: kIconColor,
                                    size: 10,
                                  ),
                                  SizedBox(width: 10.0),
                                  Text(detailsOfStore[index].address,
                                      style: Theme.of(context)
                                          .textTheme
                                          .caption!
                                          .copyWith(
                                              color: kLightTextColor,
                                              fontSize: 10.0)),
                                ],
                              ),
                              SizedBox(height: 10.3),
                              Row(
                                children: <Widget>[
                                  Icon(
                                    Icons.access_time,
                                    color: kIconColor,
                                    size: 10,
                                  ),
                                  SizedBox(width: 10.0),
                                  Text(detailsOfStore[index].time,
                                      style: Theme.of(context)
                                          .textTheme
                                          .caption!
                                          .copyWith(
                                              color: kLightTextColor,
                                              fontSize: 10.0)),
                                ],
                              ),
                              SizedBox(height: 10.3),
                              Row(
                                children: <Widget>[
                                  Icon(
                                    Icons.star,
                                    color: Colors.yellow,
                                    size: 10,
                                  ),
                                  SizedBox(width: 10.0),
                                  Text(detailsOfStore[index].rating,
                                      style: Theme.of(context)
                                          .textTheme
                                          .caption!
                                          .copyWith(
                                              color: Theme.of(context)
                                                          .scaffoldBackgroundColor ==
                                                      Colors.black
                                                  ? Colors.white
                                                  : kMainTextColor,
                                              fontSize: 10.0,
                                              fontWeight: FontWeight.bold)),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  );
                }),
          ],
        ),
        beginOffset: Offset(0, 0.3),
        endOffset: Offset(0, 0),
        slideCurve: Curves.linearToEaseOut,
      ),
    );
  }
}
