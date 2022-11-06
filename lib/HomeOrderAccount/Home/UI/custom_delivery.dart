import 'package:any_wash/Components/bottom_bar.dart';
import 'package:any_wash/Components/entry_field.dart';
import 'package:any_wash/Locale/locales.dart';
import 'package:any_wash/Routes/routes.dart';
import 'package:any_wash/Theme/colors.dart';
import 'package:flutter/material.dart';

class CustomDeliveryPage extends StatelessWidget {
  final String pageTitle;

  CustomDeliveryPage(this.pageTitle);

  @override
  Widget build(BuildContext context) {
    return CustomDelivery(pageTitle);
  }
}

class CustomDelivery extends StatefulWidget {
  final String pageTitle;

  CustomDelivery(this.pageTitle);

  @override
  _CustomDeliveryState createState() => _CustomDeliveryState();
}

class _CustomDeliveryState extends State<CustomDelivery> {
  // CustomDeliveryBloc _deliveryBloc;
  TextEditingController pickUpController = TextEditingController();
  TextEditingController dropController = TextEditingController();
  TextEditingController valuesController = TextEditingController();
  TextEditingController instructionController = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    pickUpController.dispose();
    dropController.dispose();
    valuesController.dispose();
    instructionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kCardBackgroundColor,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(AppLocalizations.of(context)!.send!),
        titleSpacing: 0.0,
      ),
      body: Column(
        children: <Widget>[
          Divider(
            thickness: 6.7,
            color: kCardBackgroundColor,
          ),
          Container(
            color: Colors.white,
            width: MediaQuery.of(context).size.width,
            padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
            child: Column(
              children: <Widget>[
                EntryField(
                  controller: pickUpController,
                  image: 'images/custom/ic_pickup_pointact.png',
                  label: AppLocalizations.of(context)!.pickupAddress,
                  hint: AppLocalizations.of(context)!.pickupText,
                  onTap: () {
                    /*...........*/
                  },
                  readOnly: true,
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 8.0),
                  child: EntryField(
                    controller: dropController,
                    image: 'images/custom/ic_droppointact.png',
                    label: AppLocalizations.of(context)!.drop,
                    hint: AppLocalizations.of(context)!.dropText,
                    readOnly: true,
                    onTap: () {
                      /*.......*/
                    },
                  ),
                ),
              ],
            ),
          ),
          Divider(
            thickness: 6.7,
            color: kCardBackgroundColor,
          ),
          Container(
            color: Colors.white,
            width: MediaQuery.of(context).size.width,
            padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
            child: Padding(
              padding: EdgeInsets.only(bottom: 8.0),
              child: EntryField(
                controller: valuesController,
                image: 'images/custom/ic_packageact.png',
                label: AppLocalizations.of(context)!.package,
                hint: AppLocalizations.of(context)!.packageText,
                readOnly: true,
                suffixIcon: Icon(
                  Icons.keyboard_arrow_down,
                  color: kMainColor,
                ),
                onTap: () {
                  showModalBottomSheet(
                    context: context,
                    builder: (context) {
                      return ModalBottomWidget();
                    },
                  );
                },
              ),
            ),
          ),
          Divider(
            thickness: 6.7,
            color: kCardBackgroundColor,
          ),
          Container(
            color: Colors.white,
            width: MediaQuery.of(context).size.width,
            padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
            child: EntryField(
              hint: AppLocalizations.of(context)!.instruction,
              image: 'images/custom/ic_instruction.png',
              imageColor: kLightTextColor,
              border: InputBorder.none,
            ),
          ),
          Spacer(),
          Container(
            width: MediaQuery.of(context).size.width,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding:
                      EdgeInsets.symmetric(vertical: 16.0, horizontal: 20.0),
                  child: Text(AppLocalizations.of(context)!.paymentInfo!,
                      style: Theme.of(context)
                          .textTheme
                          .headline6!
                          .copyWith(color: kDisabledColor)),
                ),
                Padding(
                  padding:
                      EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          AppLocalizations.of(context)!.deliveryCharge!,
                          style: Theme.of(context).textTheme.caption,
                        ),
                        Text(
                          '\$ 0.00',
                          style: Theme.of(context).textTheme.caption,
                        ),
                      ]),
                ),
                Divider(
                  color: kCardBackgroundColor,
                  thickness: 1.0,
                ),
                Padding(
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
                          '\$ 0.00',
                          style: Theme.of(context).textTheme.caption,
                        ),
                      ]),
                ),
                Divider(
                  color: kCardBackgroundColor,
                  thickness: 1.0,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 20.0, vertical: 12.0),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          AppLocalizations.of(context)!.amount!,
                          style: Theme.of(context)
                              .textTheme
                              .caption!
                              .copyWith(fontWeight: FontWeight.bold),
                        ),
                        Text(
                          '\$ 0.00',
                          style: Theme.of(context).textTheme.caption,
                        ),
                      ]),
                ),
              ],
            ),
            color: Colors.white,
          ),
          BottomBar(
            text: AppLocalizations.of(context)!.continueText,
            onTap: () {
              Navigator.pushNamed(context, PageRoutes.paymentMethod);
            },
          ),
        ],
      ),
    );
  }
}

//bottom sheets that pops up on select package type field
class ModalBottomWidget extends StatefulWidget {
  @override
  _ModalBottomWidgetState createState() => _ModalBottomWidgetState();
}

class _ModalBottomWidgetState extends State<ModalBottomWidget> {
  List<String?> _selectedList = [];

  @override
  Widget build(BuildContext context) {
    var appLocalization = AppLocalizations.of(context)!;
    final List<String?> list = <String?>[
      appLocalization.paperDocuments,
      appLocalization.flowersChocolates,
      appLocalization.sports,
      appLocalization.clothes,
      appLocalization.electronic,
      appLocalization.household,
      appLocalization.glass,
    ];
    return ListView(
      children: <Widget>[
        Container(
          color: kCardBackgroundColor,
          padding: EdgeInsets.symmetric(vertical: 12.0, horizontal: 24.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                AppLocalizations.of(context)!.packageText!,
                style: Theme.of(context).textTheme.headline4,
              ),
              TextButton(
                child: Text(AppLocalizations.of(context)!.done!),
                onPressed: () {
                  Navigator.pop(context);
                },
                style: TextButton.styleFrom(
                  shape: RoundedRectangleBorder(
                      side: BorderSide(color: kTransparentColor),
                      borderRadius: BorderRadius.circular(30.0)),
                ),
              ),
            ],
          ),
        ),
        ListView.builder(
          shrinkWrap: true,
          itemCount: list.length,
          itemBuilder: (context, index) => CheckboxListTile(
            title: Text(list[index]!),
            value: _selectedList.contains(list[index]),
            onChanged: (value) {
              if (value!) {
                _selectedList.add(list[index]);
              } else {
                _selectedList.remove(list[index]);
              }
              setState(() {});
            },
          ),
        ),
      ],
    );
  }
}
