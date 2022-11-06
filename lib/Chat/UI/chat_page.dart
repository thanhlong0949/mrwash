import 'package:animation_wrappers/animation_wrappers.dart';
import 'package:any_wash/Components/custom_appbar.dart';
import 'package:any_wash/Components/entry_field.dart';
import 'package:any_wash/Locale/locales.dart';
import 'package:any_wash/Theme/colors.dart';
import 'package:any_wash/Theme/styles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ChatPage extends StatelessWidget {
  final String orderId = 'orderId-1';
  @override
  Widget build(BuildContext context) {
    return ChatWidget();
  }
}

class ChatWidget extends StatefulWidget {
  @override
  _ChatWidgetState createState() => _ChatWidgetState();
}

class _ChatWidgetState extends State<ChatWidget> {
  TextEditingController _messageController = TextEditingController();
  //ChatBloc _chatBloc;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _messageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var locale = AppLocalizations.of(context)!;
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(120.0),
          child: CustomAppBar(
            leading: IconButton(
              icon: Hero(
                tag: 'arrow',
                child: Icon(Icons.keyboard_arrow_down),
              ),
              onPressed: () => Navigator.pop(context),
            ),
            bottom: PreferredSize(
              preferredSize: Size.fromHeight(0.0),
              child: Hero(
                tag: 'Shipper',
                child: Container(
                  color: Theme.of(context).scaffoldBackgroundColor,
                  padding: EdgeInsets.symmetric(vertical: 12.0),
                  child: ListTile(
                    leading: CircleAvatar(
                      radius: 22.0,
                      backgroundImage: AssetImage('assets/img_profile.png'),
                    ),
                    title: Text(
                      'Nguyễn minh long',
                      style: Theme.of(context).textTheme.headline4!.copyWith(
                            fontWeight: FontWeight.w500,
                          ),
                    ),
                    subtitle: Text(
                      locale.deliveryPartner!,
                      style: Theme.of(context).textTheme.headline6!.copyWith(
                          fontSize: 11.7,
                          color: Color(0xffc2c2c2),
                          fontWeight: FontWeight.w500),
                    ),
                    trailing: IconButton(
                      icon: Icon(Icons.phone, color: kMainColor),
                      onPressed: () {
                        /*.........*/
                      },
                    ),
                  ),
                ),
              ),
            ),
          )),
      body: FadedSlideAnimation(
        child: DecoratedBox(
          position: DecorationPosition.background,
          decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage(
                  'assets/chatBg.png',
                ),
                fit: BoxFit.fill),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              MessageStream(),
              Container(
                color: Theme.of(context).scaffoldBackgroundColor,
                padding: EdgeInsets.symmetric(horizontal: 12.0),
                child: EntryField(
                  controller: _messageController,
                  hint: AppLocalizations.of(context)!.enterMessage,
                  suffixIcon: IconButton(
                    icon: Icon(
                      Icons.send,
                      color: kMainColor,
                    ),
                    onPressed: () {
                      _messageController.clear();
                    },
                  ),
                  border: InputBorder.none,
                ),
              ),
            ],
          ),
        ),
        beginOffset: Offset(0, 0.3),
        endOffset: Offset(0, 0),
        slideCurve: Curves.linearToEaseOut,
      ),
    );
  }
}

class MessageStream extends StatelessWidget {
  final List<MessageBubble> messageBubbles = [
    MessageBubble(
      sender: 'delivery_partner',
      text: 'Ay yo?' + '\n' + 'mất bao lâu?',
      time: '11:59 am',
      isDelivered: false,
      isMe: true,
    ),
    MessageBubble(
      sender: 'user',
      text: 'Tôi sắp tới.' + '\n' + 'tầm 10 phút.',
      time: '11:58 am',
      isDelivered: false,
      isMe: false,
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView(
        padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
        children: messageBubbles,
      ),
    );
  }
}

class MessageBubble extends StatelessWidget {
  final bool? isMe;
  final String? text;
  final String? sender;
  final String? time;
  final bool? isDelivered;

  MessageBubble(
      {this.sender, this.text, this.time, this.isMe, this.isDelivered});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10.0),
      child: Column(
        crossAxisAlignment:
            isMe! ? CrossAxisAlignment.end : CrossAxisAlignment.start,
        children: <Widget>[
          Material(
            elevation: 4.0,
            color:
                isMe! ? kMainColor : Theme.of(context).scaffoldBackgroundColor,
            borderRadius: BorderRadius.circular(6.0),
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 12.0),
              child: Column(
                crossAxisAlignment:
                    isMe! ? CrossAxisAlignment.end : CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    text!,
                    style: isMe!
                        ? bottomBarTextStyle
                        : Theme.of(context)
                            .textTheme
                            .caption!
                            .copyWith(fontSize: 14.0),
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Text(
                        time! + ' ',
                        style: TextStyle(
                          fontSize: 10.0,
                          color: isMe!
                              ? kWhiteColor.withOpacity(0.75)
                              : kLightTextColor,
                        ),
                      ),
                      isMe!
                          ? Icon(
                              Icons.check_circle,
                              color:
                                  isDelivered! ? Colors.blue : kDisabledColor,
                              size: 12.0,
                            )
                          : SizedBox.shrink(),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
