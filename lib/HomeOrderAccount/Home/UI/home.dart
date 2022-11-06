import 'dart:io';

import 'package:animation_wrappers/animation_wrappers.dart';
import 'package:any_wash/Components/card_content.dart';
import 'package:any_wash/Components/custom_appbar.dart';
import 'package:any_wash/Components/reusable_card.dart';
import 'package:any_wash/Locale/locales.dart';
import 'package:any_wash/Routes/routes.dart';
import 'package:any_wash/Theme/colors.dart';
import 'package:any_wash/Theme/styles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Home();
  }
}

class DetailsOfStore {
  final String name;
  final String address;
  final String rating;
  final String image;

  DetailsOfStore(this.name, this.address, this.rating, this.image);
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  // static final AdRequest request = AdRequest(
  //   keywords: <String>['foo', 'bar'],
  //   contentUrl: 'http://foo.com/bar.html',
  //   nonPersonalizedAds: true,
  // );
  //
  // BannerAd? _anchoredBanner;
  bool _loadingAnchoredBanner = false;

  // Future<void> _createAnchoredBanner(BuildContext context) async {
  //   final AnchoredAdaptiveBannerAdSize? size =
  //       await AdSize.getAnchoredAdaptiveBannerAdSize(
  //     Orientation.portrait,
  //     MediaQuery.of(context).size.width.truncate(),
  //   );
  //
  //   if (size == null) {
  //     print('Unable to get height of anchored banner.');
  //     return;
  //   }
  //
  //   // final BannerAd banner = BannerAd(
  //   //   size: size,
  //   //   request: request,
  //   //   adUnitId: Platform.isAndroid
  //   //       ? 'ca-app-pub-3940256099942544/6300978111'
  //   //       : 'ca-app-pub-3940256099942544/2934735716',
  //   //   listener: BannerAdListener(
  //   //     onAdLoaded: (Ad ad) {
  //   //       print('$BannerAd loaded.');
  //   //       setState(() {
  //   //         _anchoredBanner = ad as BannerAd?;
  //   //       });
  //   //     },
  //   //     onAdFailedToLoad: (Ad ad, LoadAdError error) {
  //   //       print('$BannerAd failedToLoad: $error');
  //   //       ad.dispose();
  //   //     },
  //   //     onAdOpened: (Ad ad) => print('$BannerAd onAdOpened.'),
  //   //     onAdClosed: (Ad ad) => print('$BannerAd onAdClosed.'),
  //   //   ),
  //   // );
  //   // return banner.load();
  // }

  @override
  // void dispose() {
  //   super.dispose();
  //   _anchoredBanner?.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    List<DetailsOfStore> detailsOfStore = [
      DetailsOfStore('MR Wash Gò Vấp', ' 6.4 km | Phan Văn Trị', '4.2',
          'assets/Stores/1.png'),
      DetailsOfStore('MR Wash Quận 3', ' 6.4 km | Phạm Ngọc Thạch', '4.8',
          'assets/Stores/1.png'),
      DetailsOfStore('MR Wash Quận 9', ' 6.4 km | Lê Văn Việt', '4.5',
          'assets/Stores/1.png'),
      DetailsOfStore('MR Wash Quận 7', ' 6.4 km | Nguyễn Duy Trinh', '3.9',
          'assets/Stores/1.png'),
      DetailsOfStore('MR Wash Quận 12', ' 6.4 km | Nguyễn Ảnh Thủ', '4.5',
          'assets/Stores/1.png'),
      DetailsOfStore('MR Wash Gò Vấp', ' 6.4 km | Phan Văn Trị', '4.2',
          'assets/Stores/1.png'),
      DetailsOfStore('MR Wash Quận 3', ' 6.4 km | Phạm Ngọc Thạch', '4.2',
          'assets/Stores/1.png'),
    ];
    var appLocalization = AppLocalizations.of(context)!;
    String? value = appLocalization.homeText;
    return Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(126.0),
          child: CustomAppBar(
            leading: Padding(
              padding: const EdgeInsets.only(left: 20.0),
              child: FadedScaleAnimation(
                child: Icon(
                  Icons.location_on,
                  color: kMainColor,
                ),
                // //durationInMilliseconds: 400,
              ),
            ),
            titleWidget: DropdownButton(
              isDense: true,
              value: value,
              // isExpanded: true,
              icon: Icon(
                Icons.keyboard_arrow_down,
                color: kMainColor,
              ),
              iconSize: 24.0,
              elevation: 16,
              style: inputTextStyle.copyWith(
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).secondaryHeaderColor),
              underline: Container(
                height: 0,
              ),
              onChanged: (String? newValue) {
                setState(() {
                  value = newValue;
                });
                if (value == appLocalization.setLocation) {
                  Navigator.pushNamed(context, PageRoutes.locationPage);
                }
              },
              items: <String?>[
                appLocalization.homeText,
                appLocalization.office,
                appLocalization.other,
                appLocalization.setLocation
              ].map<DropdownMenuItem<String>>((address) {
                return DropdownMenuItem<String>(
                  value: address,
                  child: Text(
                    address!,
                    overflow: TextOverflow.ellipsis,
                  ),
                );
              }).toList(),
            ),
            actions: <Widget>[
              Padding(
                padding: const EdgeInsets.only(right: 6.0),
                child: FadedScaleAnimation(
                  child: IconButton(
                    icon: Icon(
                      Icons.shopping_cart_outlined,
                      color: kMainTextColor,
                    ),
                    onPressed: () =>
                        Navigator.pushNamed(context, PageRoutes.viewCart),
                  ),
                  // //durationInMilliseconds: 400,
                ),
              ),
            ],
            hint: AppLocalizations.of(context)!.searchLaundryStore,
          ),
        ),
        body: Builder(
          builder: (BuildContext context) {
            if (!_loadingAnchoredBanner) {
              _loadingAnchoredBanner = true;
              // _createAnchoredBanner(context);
            }
            return Stack(
              children: [
                ListView(
                  children: <Widget>[
                    Padding(
                      padding:
                          EdgeInsets.only(top: 16.0, left: 24.0, right: 24.0),
                      child: Row(
                        children: <Widget>[
                          FadedScaleAnimation(
                            child: Text(
                              AppLocalizations.of(context)!.laundry!,
                              style: Theme.of(context)
                                  .textTheme
                                  .headline4!
                                  .copyWith(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w700),
                            ),
                            //durationInMilliseconds: 400,
                          ),
                          SizedBox(
                            width: 5.0,
                          ),
                          FadedScaleAnimation(
                            child: Text(
                              AppLocalizations.of(context)!.services!,
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyText1!
                                  .copyWith(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 16),
                            ),
                            // //durationInMilliseconds: 400,
                          ),
                        ],
                      ),
                    ),
                    buildGrid(),
                    Padding(
                      padding: EdgeInsets.only(left: 24.0, right: 24.0),
                      child: Row(
                        children: <Widget>[
                          Text(
                            AppLocalizations.of(context)!.laundry!,
                            style: Theme.of(context)
                                .textTheme
                                .headline4!
                                .copyWith(
                                    fontSize: 20, fontWeight: FontWeight.w500),
                          ),
                          SizedBox(
                            width: 5.0,
                          ),
                          Text(
                            appLocalization.nearYou!,
                            style: Theme.of(context)
                                .textTheme
                                .bodyText1!
                                .copyWith(
                                    fontWeight: FontWeight.w500, fontSize: 16),
                          ),
                          Spacer(),
                          GestureDetector(
                            onTap: () {
                              Navigator.pushNamed(
                                  context, PageRoutes.storesPage);
                            },
                            child: Text(
                              'View all',
                              style: Theme.of(context)
                                  .textTheme
                                  .headline4!
                                  .copyWith(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w700,
                                      color: kMainColor),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      height: 100,
                      child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          shrinkWrap: true,
                          itemCount: detailsOfStore.length,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: EdgeInsets.only(
                                  left: 20.0, top: 25.3, right: 20.0),
                              child: GestureDetector(
                                onTap: () {
                                  Navigator.pushNamed(
                                      context, PageRoutes.items);
                                },
                                child: Row(
                                  children: <Widget>[
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(8),
                                      child: FadedScaleAnimation(
                                        child: Image(
                                          image: AssetImage(
                                              detailsOfStore[index].image),
                                          height: 80,
                                        ),
                                        //durationInMilliseconds: 400,
                                      ),
                                    ),
                                    SizedBox(width: 13.3),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: <Widget>[
                                        Text(detailsOfStore[index].name,
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
                                            SizedBox(width: 5.0),
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
                                            FadedScaleAnimation(
                                              child: Icon(
                                                Icons.star,
                                                color: Colors.yellow,
                                                size: 10,
                                              ),
                                              //durationInMilliseconds: 400,
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
                                                        fontWeight:
                                                            FontWeight.bold)),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            );
                          }),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                          top: 16.0, left: 24.0, right: 24.0, bottom: 8),
                      child: Row(
                        children: <Widget>[
                          Text(
                            appLocalization.bestRated!,
                            style: Theme.of(context)
                                .textTheme
                                .headline4!
                                .copyWith(
                                    fontSize: 20, fontWeight: FontWeight.w500),
                          ),
                          SizedBox(
                            width: 5.0,
                          ),
                          Text(
                            appLocalization.laundries!,
                            style: Theme.of(context)
                                .textTheme
                                .bodyText1!
                                .copyWith(
                                    fontWeight: FontWeight.w500, fontSize: 16),
                          ),
                          Spacer(),
                          GestureDetector(
                            onTap: () {
                              Navigator.pushNamed(
                                  context, PageRoutes.storesPage);
                            },
                            child: Text(
                              appLocalization.viewAll!,
                              style: Theme.of(context)
                                  .textTheme
                                  .headline4!
                                  .copyWith(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w700,
                                      color: kMainColor),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      height: 100,
                      child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          shrinkWrap: true,
                          itemCount: detailsOfStore.length,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: EdgeInsets.only(
                                left: 20.0,
                                top: 25.3,
                                right: 20.0,
                              ),
                              child: GestureDetector(
                                onTap: () {
                                  Navigator.pushNamed(
                                      context, PageRoutes.items);
                                },
                                child: Row(
                                  children: <Widget>[
                                    ClipRRect(
                                      child: FadedScaleAnimation(
                                        child: Image(
                                          image: AssetImage(
                                              detailsOfStore[index].image),
                                          height: 80,
                                        ),
                                        //durationInMilliseconds: 400,
                                      ),
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    SizedBox(width: 13.3),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: <Widget>[
                                        Text(detailsOfStore[index].name,
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
                                            SizedBox(width: 5.0),
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
                                                        fontWeight:
                                                            FontWeight.bold)),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            );
                          }),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                  ],
                ),
                // if (_anchoredBanner != null)
                //   Align(
                //     alignment: Alignment.bottomCenter,
                //     child: Container(
                //       width: _anchoredBanner!.size.width.toDouble(),
                //       height: _anchoredBanner!.size.height.toDouble(),
                //       child: AdWidget(ad: _anchoredBanner!),
                //     ),
                //   ),
              ],
            );
          },
        ));
  }

  buildGrid() {
    var appLocalization = AppLocalizations.of(context)!;
    return Container(
      margin: EdgeInsets.all(20.0),
      child: GridView.count(
        crossAxisCount: 2,
        crossAxisSpacing: 20.0,
        mainAxisSpacing: 20.0,
        // controller: ScrollController(keepScrollOffset: false),
        shrinkWrap: true,
        // scrollDirection: Axis.vertical,
        physics: NeverScrollableScrollPhysics(),
        children: <Widget>[
          FadedScaleAnimation(
            child: ReusableCard(
                cardChild: CardContent(
                  image: AssetImage('assets/Services/click to edit-3.png'),
                  text: appLocalization.washAnd!.toUpperCase() +
                      '\n' +
                      appLocalization.fold!.toUpperCase(),
                ),
                onPress: () {
                  Navigator.pushNamed(context, PageRoutes.storesPage);
                }),
            //durationInMilliseconds: 400,
          ),
          FadedScaleAnimation(
            child: ReusableCard(
                cardChild: CardContent(
                  image: AssetImage('assets/Services/click to edit-2.png'),
                  text: appLocalization.ironAnd!.toUpperCase() +
                      '\n' +
                      appLocalization.fold!.toUpperCase(),
                ),
                onPress: () {
                  Navigator.pushNamed(context, PageRoutes.storesPage);
                }),
            //durationInMilliseconds: 400,
          ),
          FadedScaleAnimation(
            child: ReusableCard(
                cardChild: CardContent(
                  image: AssetImage('assets/Services/click to edit-1.png'),
                  text: appLocalization.dry!.toUpperCase() +
                      '\n' +
                      appLocalization.clean!.toUpperCase(),
                ),
                onPress: () {
                  Navigator.pushNamed(context, PageRoutes.storesPage);
                }),
            //durationInMilliseconds: 400,
          ),
          FadedScaleAnimation(
            child: ReusableCard(
                cardChild: CardContent(
                  image: AssetImage('assets/Services/click to edit.png'),
                  text: appLocalization.household!.toUpperCase() +
                      '\n' +
                      appLocalization.clean!.toUpperCase(),
                ),
                onPress: () {
                  Navigator.pushNamed(context, PageRoutes.storesPage);
                }),
            //durationInMilliseconds: 400,
          ),
        ],
      ),
    );
  }
}
