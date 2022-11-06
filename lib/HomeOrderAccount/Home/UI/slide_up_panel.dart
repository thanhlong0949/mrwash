import 'package:any_wash/Locale/locales.dart';
import 'package:any_wash/Routes/routes.dart';
import 'package:any_wash/Theme/colors.dart';
import 'package:flutter/material.dart';

class SlideUpPanel extends StatefulWidget {
  final List<String?> itemName;

  SlideUpPanel(this.itemName);

  @override
  _SlideUpPanelState createState() => _SlideUpPanelState();
}

class _SlideUpPanelState extends State<SlideUpPanel> {
  List<double> prices = [
    3.00,
    9.00,
    3.50,
  ];

  double sum() {
    double total = 0.00;
    for (int i = 0; i < prices.length; i++) {
      total += prices[i];
    }
    return total;
  }

  @override
  Widget build(BuildContext context) {
    var locale = AppLocalizations.of(context)!;
    List<String> weight = [
      locale.washOnly! + ' x 1',
      locale.washAndIron! + ' x 1',
      locale.dryClean! + ' x 1',
    ];
    return DraggableScrollableSheet(
      minChildSize: 0.15,
      initialChildSize: 0.15,
      maxChildSize: 0.995,
      builder: (context, controller) {
        return Container(
          padding: EdgeInsets.only(left: 4.0),
          color: Theme.of(context).cardColor,
          child: SingleChildScrollView(
            controller: controller,
            child: Container(
              height: MediaQuery.of(context).size.height,
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: <Widget>[
                  Container(
                    color: Theme.of(context).scaffoldBackgroundColor,
                    child: Stack(
                      children: <Widget>[
                        Hero(
                          tag: 'Shipper',
                          child: Padding(
                            padding: EdgeInsets.only(bottom: 10.0, top: 14.0),
                            child: ListTile(
                              leading: CircleAvatar(
                                radius: 22.0,
                                backgroundImage:
                                    AssetImage('assets/img_profile.png'),
                              ),
                              title: Text(
                                'nguyễn minh long',
                                style: Theme.of(context)
                                    .textTheme
                                    .headline4!
                                    .copyWith(
                                      fontWeight: FontWeight.w500,
                                    ),
                              ),
                              subtitle: Text(
                                locale.deliveryPartner!,
                                style: Theme.of(context)
                                    .textTheme
                                    .headline6!
                                    .copyWith(
                                        fontSize: 11.7,
                                        fontWeight: FontWeight.w500,
                                        color: Color(0xffc2c2c2)),
                              ),
                              trailing: FittedBox(
                                fit: BoxFit.fill,
                                child: Row(
                                  children: <Widget>[
                                    IconButton(
                                      icon: Icon(Icons.message,
                                          color: kMainColor),
                                      onPressed: () {
                                        Navigator.pushNamed(
                                            context, PageRoutes.chatPage);
                                      },
                                    ),
                                    IconButton(
                                      icon:
                                          Icon(Icons.phone, color: kMainColor),
                                      onPressed: () {
                                        /*.......*/
                                      },
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                        Center(
                          child: Hero(
                            tag: 'arrow',
                            child: Icon(
                              Icons.keyboard_arrow_up,
                              color: kMainColor,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 6.0),
                  Expanded(
                    child: ListView.builder(
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: widget.itemName.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Container(
                          color: Theme.of(context).scaffoldBackgroundColor,
                          child: ListTile(
                            title: Text(
                              widget.itemName[index]!,
                              style: Theme.of(context)
                                  .textTheme
                                  .headline4!
                                  .copyWith(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 15.0),
                            ),
                            subtitle: Text(
                              weight[index],
                              style: Theme.of(context)
                                  .textTheme
                                  .caption!
                                  .copyWith(fontSize: 13.3),
                            ),
                            trailing: Text(
                              '\$ ${prices[index]}',
                              style: Theme.of(context)
                                  .textTheme
                                  .caption!
                                  .copyWith(fontSize: 13.3),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  SizedBox(height: 6.0),
                  Container(
                    height: 50.0,
                    padding: EdgeInsets.symmetric(horizontal: 8.0),
                    color: Theme.of(context).scaffoldBackgroundColor,
                    child: Row(
                      children: [
                        SizedBox(
                          width: 20,
                        ),
                        ImageIcon(
                          AssetImage('assets/Icons/ic_instruction.png'),
                          color: kLightTextColor,
                          size: 20.0,
                        ),
                        SizedBox(
                          width: 10.0,
                        ),
                        Text(
                          locale.washWhiteClothes!,
                          style: Theme.of(context)
                              .textTheme
                              .caption!
                              .copyWith(color: kMainTextColor, fontSize: 11),
                        ),
                      ],
                    ),

//                    EntryField(
//                      image: 'images/custom/ic_instruction.png',
//                      imageColor: kLightTextColor,
//                      initialValue: AppLocalizations.of(context).instruction,
//                      readOnly: true,
//                      border: InputBorder.none,
//                    ),
                  ),
                  SizedBox(height: 6.0),
                  Container(
                    width: double.infinity,
                    padding:
                        EdgeInsets.symmetric(vertical: 8.0, horizontal: 20.0),
                    child: Text(
                        AppLocalizations.of(context)!
                            .paymentInfo!
                            .toUpperCase(),
                        style: Theme.of(context).textTheme.headline4!.copyWith(
                            color: kDisabledColor,
                            fontSize: 13.3,
                            letterSpacing: 0.67)),
                    color: Theme.of(context).scaffoldBackgroundColor,
                  ),
                  Container(
                    color: Theme.of(context).scaffoldBackgroundColor,
                    padding:
                        EdgeInsets.symmetric(vertical: 8.0, horizontal: 20.0),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text(
                            AppLocalizations.of(context)!.sub!,
                            style: Theme.of(context).textTheme.caption,
                          ),
                          Text(
                            '\$ ${sum()}',
                            style: Theme.of(context).textTheme.caption,
                          ),
                        ]),
                  ),
                  Container(
                    color: Theme.of(context).scaffoldBackgroundColor,
                    padding:
                        EdgeInsets.symmetric(vertical: 8.0, horizontal: 20.0),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text(
                            AppLocalizations.of(context)!.service!,
                            style: Theme.of(context).textTheme.caption,
                          ),
                          Text(
                            '\$ 1.50',
                            style: Theme.of(context).textTheme.caption,
                          ),
                        ]),
                  ),
                  Container(
                    color: Theme.of(context).scaffoldBackgroundColor,
                    padding:
                        EdgeInsets.symmetric(vertical: 8.0, horizontal: 20.0),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text(
                            AppLocalizations.of(context)!.cod!,
                            style:
                                Theme.of(context).textTheme.headline4!.copyWith(
                                      fontSize: 12,
                                    ),
                          ),
                          Text(
                            '\$ 11.50',
                            style: Theme.of(context).textTheme.caption,
                          ),
                        ]),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
