import 'package:animation_wrappers/animation_wrappers.dart';
import 'package:any_wash/Components/custom_appbar.dart';
import 'package:any_wash/Locale/locales.dart';
import 'package:any_wash/Routes/routes.dart';
import 'package:any_wash/Theme/colors.dart';
import 'package:any_wash/src/list_equipment.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import '../src/list_equipment.dart';

class ItemsInfo {
  final String? name;
  final String price;
  final String image;

  ItemsInfo(this.name, this.price, this.image);
}

List<String> list = ['Wash Only', 'Iron Only', 'Wash & Iron', 'Dry Clean'];
List<String> list1 = ['\$ 3.00', '\$ 2.00', '\$ 3.50', '\$ 2.50'];

class ItemsPage extends StatefulWidget {
  @override
  _ItemsPageState createState() => _ItemsPageState();
}

class _ItemsPageState extends State<ItemsPage> {
  int itemCount = 0;
  int itemCount1 = 0;
  int itemCount2 = 0;

  @override
  Widget build(BuildContext context) {
    var locale = AppLocalizations.of(context)!;

    List<ItemsInfo> itemsInfo = [
      ItemsInfo(locale.tshirts, '3.00', 'assets/Items/item_tshirts.png'),
      ItemsInfo(locale.shirts, '4.50', 'assets/Items/item_shirts.png'),
      ItemsInfo(locale.jeans, '2.50', 'assets/Items/item_jeans.png'),
      ItemsInfo(locale.jackets, '3.50', 'assets/Items/item_jacket.png'),
      ItemsInfo(locale.shorts, '4.00', 'assets/Items/item_shorts.png'),
      ItemsInfo(locale.tshirts, '3.00', 'assets/Items/item_tshirts.png'),
    ];
    final List<Tab> tabs = <Tab>[
      Tab(text: locale.man!.toUpperCase()),
      // Tab(text: locale.woman!.toUpperCase()),
      // Tab(text: locale.kids!.toUpperCase()),
      // Tab(text: locale.others!.toUpperCase()),
    ];
    return Stack(
      children: <Widget>[
        DefaultTabController(
          length: tabs.length,
          child: Scaffold(
            appBar: PreferredSize(
              preferredSize: Size.fromHeight(176.0),
              child: CustomAppBar(
                actions: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.0),
                    child: Icon(Icons.search),
                  )
                ],
                bottom: PreferredSize(
                  preferredSize: Size.fromHeight(0.0),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: GestureDetector(
                      onTap: () =>
                          Navigator.pushNamed(context, PageRoutes.review),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(locale.quickWasher!,
                              style: Theme.of(context)
                                  .textTheme
                                  .headline4!
                                  .copyWith(
                                      color: Theme.of(context)
                                          .secondaryHeaderColor)),
                          SizedBox(
                            height: 10.0,
                          ),
                          Row(
                            children: <Widget>[
                              Icon(
                                Icons.location_on,
                                color: kIconColor,
                                size: 12,
                              ),
                              SizedBox(width: 10.0),
                              Text('6.4 km ',
                                  style: Theme.of(context).textTheme.overline),
                              Text('| ',
                                  style: Theme.of(context)
                                      .textTheme
                                      .overline!
                                      .copyWith(color: kMainColor)),
                              Text(AppLocalizations.of(context)!.storeAddress!,
                                  style: Theme.of(context).textTheme.overline),
                            ],
                          ),
                          SizedBox(
                            height: 10.0,
                          ),
                          Row(
                            children: [
                              Icon(
                                Icons.access_time,
                                color: kIconColor,
                                size: 10,
                              ),
                              SizedBox(width: 10.0),
                              Text('08:00 - 20:00',
                                  style: Theme.of(context).textTheme.overline),
                              Spacer(),
                              Icon(
                                Icons.star,
                                color: Colors.yellow,
                                size: 10,
                              ),
                              SizedBox(width: 8.0),
                              Text('4.2',
                                  style: Theme.of(context)
                                      .textTheme
                                      .overline!
                                      .copyWith(
                                        color: Theme.of(context)
                                                    .scaffoldBackgroundColor ==
                                                Colors.black
                                            ? Colors.white
                                            : kMainTextColor,
                                      )),
                              SizedBox(width: 8.0),
                              Text('58 reviews',
                                  style: Theme.of(context)
                                      .textTheme
                                      .overline!
                                      .copyWith(
                                        fontWeight: FontWeight.w500,
                                      )),
                              SizedBox(width: 8.0),
                              Icon(
                                Icons.arrow_forward_ios,
                                color: kIconColor,
                                size: 12,
                              ),
                            ],
                          ),
                          TabBar(
                            tabs: tabs,
                            isScrollable: true,
                            labelColor: kMainColor,
                            unselectedLabelColor: kLightTextColor,
                            indicatorSize: TabBarIndicatorSize.tab,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
            body: FadedSlideAnimation(
              child:
                  // TabBarView(
                  //   children: tabs.map((Tab tab) {
                  //     return ListView(
                  //       children: [
                  //         Divider(
                  //           color: Theme.of(context).cardColor,
                  //           thickness: 8.0,
                  //         ),
                  //         ListView.builder(
                  //             physics: NeverScrollableScrollPhysics(),
                  //             itemCount: itemsInfo.length,
                  //             shrinkWrap: true,
                  //             itemBuilder: (context, index) {
                  //               return Column(
                  //                 mainAxisAlignment: MainAxisAlignment.start,
                  //                 children: [
                  //                   Padding(
                  //                     padding: EdgeInsets.symmetric(
                  //                         horizontal: 12.0, vertical: 12),
                  //                     child: Row(
                  //                       mainAxisSize: MainAxisSize.max,
                  //                       children: <Widget>[
                  //                         FadedScaleAnimation(
                  //                           child: Image.asset(
                  //                             itemsInfo[index].image,
                  //                             scale: 2.5,
                  //                           ),
                  //                           //durationInMilliseconds: 400,
                  //                         ),
                  //                         Padding(
                  //                           padding: EdgeInsets.symmetric(
                  //                               horizontal: 16.0),
                  //                           child: Column(
                  //                             crossAxisAlignment:
                  //                                 CrossAxisAlignment.start,
                  //                             children: <Widget>[
                  //                               SizedBox(height: 8.0),
                  //                               Text(itemsInfo[index].name!,
                  //                                   style: Theme.of(context)
                  //                                       .textTheme
                  //                                       .headline2!
                  //                                       .copyWith(
                  //                                           fontSize: 15,
                  //                                           fontWeight:
                  //                                               FontWeight.w700)),
                  //                               SizedBox(height: 8.0),
                  //                               Text(
                  //                                   ' \$ ' + itemsInfo[index].price,
                  //                                   style: Theme.of(context)
                  //                                       .textTheme
                  //                                       .caption!
                  //                                       .copyWith(
                  //                                         fontSize: 14,
                  //                                       )),
                  //                               SizedBox(height: 20.0),
                  //                               InkWell(
                  //                                 onTap: () {
                  //                                   showModalBottomSheet(
                  //                                     context: context,
                  //                                     builder: (context) {
                  //                                       return Container(
                  //                                           height: 320,
                  //                                           child:
                  //                                               BottomSheetWidget());
                  //                                     },
                  //                                   );
                  //                                 },
                  //                                 child: Row(
                  //                                   children: [
                  //                                     Container(
                  //                                       height: 30.0,
                  //                                       padding:
                  //                                           EdgeInsets.symmetric(
                  //                                               horizontal: 12.0),
                  //                                       decoration: BoxDecoration(
                  //                                         color: Theme.of(context)
                  //                                             .cardColor,
                  //                                         borderRadius:
                  //                                             BorderRadius.circular(
                  //                                                 30.0),
                  //                                       ),
                  //                                       child: Row(
                  //                                         mainAxisSize:
                  //                                             MainAxisSize.min,
                  //                                         // children: <Widget>[
                  //                                         //   // Text(
                  //                                         //   //   locale.washOnly!,
                  //                                         //   //   style:
                  //                                         //   //       Theme.of(context)
                  //                                         //   //           .textTheme
                  //                                         //   //           .caption,
                  //                                         //   // ),
                  //                                         //   SizedBox(
                  //                                         //     width: 4.0,
                  //                                         //   ),
                  //                                         //   Icon(
                  //                                         //     Icons
                  //                                         //         .keyboard_arrow_down,
                  //                                         //     color: kMainColor,
                  //                                         //   ),
                  //                                         // ],
                  //                                       ),
                  //                                     ),
                  //                                   ],
                  //                                 ),
                  //                               ),
                  //                             ],
                  //                           ),
                  //                         ),
                  //                         Spacer(),
                  //                         itemCount == 0
                  //                             ? Expanded(
                  //                                 flex: 4,
                  //                                 child: Column(
                  //                                   children: [
                  //                                     SizedBox(
                  //                                       height: 80,
                  //                                     ),
                  //                                     GestureDetector(
                  //                                       onTap: () {
                  //                                         setState(() {
                  //                                           itemCount++;
                  //                                         });
                  //                                       },
                  //                                       child: TextButton(
                  //                                         child: Padding(
                  //                                           padding:
                  //                                               const EdgeInsets
                  //                                                       .symmetric(
                  //                                                   horizontal:
                  //                                                       15.0,
                  //                                                   vertical: 0.0),
                  //                                           child: Text(
                  //                                             AppLocalizations.of(
                  //                                                     context)!
                  //                                                 .addtoOrder!,
                  //                                             style:
                  //                                                 Theme.of(context)
                  //                                                     .textTheme
                  //                                                     .button,
                  //                                           ),
                  //                                         ),
                  //                                         style:
                  //                                             TextButton.styleFrom(
                  //                                                 shape:
                  //                                                     RoundedRectangleBorder(
                  //                                                   borderRadius:
                  //                                                       BorderRadius
                  //                                                           .circular(
                  //                                                               10),
                  //                                                 ),
                  //                                                 backgroundColor:
                  //                                                     Theme.of(
                  //                                                             context)
                  //                                                         .primaryColor,
                  //                                                 elevation: 2),
                  //                                         onPressed: () {
                  //                                           // Navigator.pushNamed(context, LoginRoutes.signUp);
                  //                                         },
                  //                                       ),
                  //                                     ),
                  //                                   ],
                  //                                 ),
                  //                               )
                  //                             : Expanded(
                  //                                 flex: 7,
                  //                                 child: Column(
                  //                                   children: [
                  //                                     SizedBox(
                  //                                       height: 80,
                  //                                     ),
                  //                                     Container(
                  //                                       height: 30.0,
                  //                                       padding:
                  //                                           EdgeInsets.symmetric(
                  //                                               horizontal: 6.0),
                  //                                       decoration: BoxDecoration(
                  //                                         border: Border.all(
                  //                                             color: kMainColor),
                  //                                         borderRadius:
                  //                                             BorderRadius.circular(
                  //                                                 30.0),
                  //                                       ),

                  //                                       child: Icon(
                  //                                         Icons.add,
                  //                                         color: kMainColor,
                  //                                         size: 20.0,
                  //                                       ),
                  //                                       //     ),
                  //                                       //   ],
                  //                                       // ),
                  //                                     ),
                  //                                   ],
                  //                                 ),
                  //                               ),
                  //                       ],
                  //                     ),
                  //                   ),
                  //                   SizedBox(
                  //                     height: 8.0,
                  //                   ),
                  //                 ],
                  //               );
                  //             }),
                  //         SizedBox(
                  //           height: 50,
                  //         ),
                  //       ],
                  //     );
                  //   }).toList(),
                  // ),
                  EquipmentList(),
              beginOffset: Offset(0.2, 0.2),
              endOffset: Offset(0, 0),
              slideCurve: Curves.linearToEaseOut,
            ),
          ),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 20.0),
            child: Row(
              children: <Widget>[
                Image.asset(
                  'assets/Icons/ic_cart wt.png',
                  height: 19.0,
                  width: 18.3,
                ),
                SizedBox(width: 20.7),
                Text(
                  'Items: 2 | \$ 7.50',
                  style: Theme.of(context)
                      .textTheme
                      .subtitle1!
                      .copyWith(color: Colors.white),
                ),
                Spacer(),
                TextButton(
                  style: TextButton.styleFrom(
                    backgroundColor: Colors.white,
                  ),
                  onPressed: () =>
                      Navigator.pushNamed(context, PageRoutes.viewCart),
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 8.0),
                    child: Text(
                      AppLocalizations.of(context)!.viewCart!,
                      style: Theme.of(context).textTheme.caption!.copyWith(
                          color: kMainColor, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ],
            ),
            color: kMainColor,
            height: 60.0,
          ),
        ),
      ],
    );
  }
}

class BottomSheetWidget extends StatefulWidget {
  @override
  _BottomSheetWidgetState createState() => _BottomSheetWidgetState();
}

class _BottomSheetWidgetState extends State<BottomSheetWidget> {
  String selectedItem = 'Wash Only';

  @override
  Widget build(BuildContext context) {
    var locale = AppLocalizations.of(context)!;
    return FadedSlideAnimation(
      child: ListView(
        children: <Widget>[
          Container(
            height: 90.7,
            color: Theme.of(context).cardColor,
            padding: EdgeInsets.all(15.0),
            child: ListTile(
              title: Text(locale.tshirts!,
                  style: Theme.of(context)
                      .textTheme
                      .caption!
                      .copyWith(fontSize: 15, fontWeight: FontWeight.w500)),
              subtitle: Text(locale.selectTasks!,
                  style: Theme.of(context)
                      .textTheme
                      .caption!
                      .copyWith(fontSize: 15, color: kIconColor)),
              trailing: FadedScaleAnimation(
                child: TextButton(
                  style: TextButton.styleFrom(
                    backgroundColor: kMainColor,
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text(
                    AppLocalizations.of(context)!.add!,
                    style: Theme.of(context).textTheme.caption!.copyWith(
                        color: kWhiteColor, fontWeight: FontWeight.bold),
                  ),
                ),
                //durationInMilliseconds: 600,
              ),
            ),
          ),
          ListView.builder(
            shrinkWrap: true,
            itemCount: list.length,
            itemBuilder: (context, index) {
              return RadioListTile(
                  title: Text(list[index]),
                  value: list[index],
                  groupValue: selectedItem,
                  onChanged: (dynamic value) {
                    setState(() {
                      selectedItem = list[index];
                    });
                  });
            },
          ),
        ],
      ),
      beginOffset: Offset(0, 0.3),
      endOffset: Offset(0, 0),
      slideCurve: Curves.linearToEaseOut,
    );
  }
}
