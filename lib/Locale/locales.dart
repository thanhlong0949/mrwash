import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart' show SynchronousFuture;
import 'dart:async';

import 'Languages/vietnamese.dart';
import 'Languages/english.dart';

class AppLocalizations {
  final Locale locale;

  AppLocalizations(this.locale);

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static Map<String, Map<String, String>> _localizedValues = {
    'en': english(),
    // 'vn': vietnamese(),
  };

  String? get vegetableText {
    return _localizedValues[locale.languageCode]!['vegetableText'];
  }

  String? get foodText {
    return _localizedValues[locale.languageCode]!['foodText'];
  }

  String? get meatText {
    return _localizedValues[locale.languageCode]!['meatText'];
  }

  String? get medicineText {
    return _localizedValues[locale.languageCode]!['medicineText'];
  }

  String? get petText {
    return _localizedValues[locale.languageCode]!['petText'];
  }

  String? get customText {
    return _localizedValues[locale.languageCode]!['customText'];
  }

  String? get invalidNumber {
    return _localizedValues[locale.languageCode]!['invalidNumber'];
  }

  String? get networkError {
    return _localizedValues[locale.languageCode]!['networkError'];
  }

  String? get register {
    return _localizedValues[locale.languageCode]!['register'];
  }

  String? get invalidName {
    return _localizedValues[locale.languageCode]!['invalidName'];
  }

  String? get invalidEmail {
    return _localizedValues[locale.languageCode]!['invalidEmail'];
  }

  String? get invalidNameAndEmail {
    return _localizedValues[locale.languageCode]!['invalidNameAndEmail'];
  }

  String? get fullName {
    return _localizedValues[locale.languageCode]!['fullName'];
  }

  String? get emailAddress {
    return _localizedValues[locale.languageCode]!['emailAddress'];
  }

  String? get mobileNumber {
    return _localizedValues[locale.languageCode]!['mobileNumber'];
  }

  String? get verificationText {
    return _localizedValues[locale.languageCode]!['verificationText'];
  }

  String? get verification {
    return _localizedValues[locale.languageCode]!['verification'];
  }

  String? get checkNetwork {
    return _localizedValues[locale.languageCode]!['checkNetwork'];
  }

  String? get invalidOTP {
    return _localizedValues[locale.languageCode]!['invalidOTP'];
  }

  String? get enterVerification {
    return _localizedValues[locale.languageCode]!['enterVerification'];
  }

  String? get verificationCode {
    return _localizedValues[locale.languageCode]!['verificationCode'];
  }

  String? get resend {
    return _localizedValues[locale.languageCode]!['resend'];
  }

  String? get offlineText {
    return _localizedValues[locale.languageCode]!['resend'];
  }

  String? get onlineText {
    return _localizedValues[locale.languageCode]!['resend'];
  }

  String? get goOnline {
    return _localizedValues[locale.languageCode]!['resend'];
  }

  String? get goOffline {
    return _localizedValues[locale.languageCode]!['resend'];
  }

  String? get orders {
    return _localizedValues[locale.languageCode]!['orders'];
  }

  String? get ride {
    return _localizedValues[locale.languageCode]!['ride'];
  }

  String? get earnings {
    return _localizedValues[locale.languageCode]!['earnings'];
  }

  String? get location {
    return _localizedValues[locale.languageCode]!['earnings'];
  }

  String? get grant {
    return _localizedValues[locale.languageCode]!['earnings'];
  }

  String? get homeText1 {
    return _localizedValues[locale.languageCode]!['homeText1'];
  }

  String? get homeText2 {
    return _localizedValues[locale.languageCode]!['homeText2'];
  }

  String? get bodyText1 {
    return _localizedValues[locale.languageCode]!['bodyText1'];
  }

  String? get bodyText2 {
    return _localizedValues[locale.languageCode]!['bodyText2'];
  }

  String? get mobileText {
    return _localizedValues[locale.languageCode]!['mobileText'];
  }

  String? get continueText {
    return _localizedValues[locale.languageCode]!['continueText'];
  }

  String? get homeText {
    return _localizedValues[locale.languageCode]!['homeText'];
  }

  String? get account {
    return _localizedValues[locale.languageCode]!['account'];
  }

  String? get orderText {
    return _localizedValues[locale.languageCode]!['orderText'];
  }

  String? get tnc {
    return _localizedValues[locale.languageCode]!['tnc'];
  }

  String? get support {
    return _localizedValues[locale.languageCode]!['support'];
  }

  String? get aboutUs {
    return _localizedValues[locale.languageCode]!['aboutUs'];
  }

  String? get login {
    return _localizedValues[locale.languageCode]!['login'];
  }

  String? get noLoginText {
    return _localizedValues[locale.languageCode]!['noLoginText'];
  }

  String? get logout {
    return _localizedValues[locale.languageCode]!['logout'];
  }

  String? get loggingOut {
    return _localizedValues[locale.languageCode]!['loggingOut'];
  }

  String? get areYouSure {
    return _localizedValues[locale.languageCode]!['areYouSure'];
  }

  String? get yes {
    return _localizedValues[locale.languageCode]!['yes'];
  }

  String? get no {
    return _localizedValues[locale.languageCode]!['no'];
  }

  String? get aboutDelivoo {
    return _localizedValues[locale.languageCode]!['aboutDelivoo'];
  }

  String? get saved {
    return _localizedValues[locale.languageCode]!['saved'];
  }

  String? get savedText {
    return _localizedValues[locale.languageCode]!['savedText'];
  }

  String? get notLogin {
    return _localizedValues[locale.languageCode]!['notLogin'];
  }

  String? get loginText {
    return _localizedValues[locale.languageCode]!['loginText'];
  }

  String? get aboutBody {
    return _localizedValues[locale.languageCode]!['aboutBody'];
  }

  String? get ourVision {
    return _localizedValues[locale.languageCode]!['ourVision'];
  }

  String? get companyPolicy {
    return _localizedValues[locale.languageCode]!['companyPolicy'];
  }

  String? get termsOfUse {
    return _localizedValues[locale.languageCode]!['termsOfUse'];
  }

  String? get message {
    return _localizedValues[locale.languageCode]!['message'];
  }

  String? get enterMessage {
    return _localizedValues[locale.languageCode]!['enterMessage'];
  }

  String? get orWrite {
    return _localizedValues[locale.languageCode]!['orWrite'];
  }

  String? get yourWords {
    return _localizedValues[locale.languageCode]!['yourWords'];
  }

  String? get online {
    return _localizedValues[locale.languageCode]!['online'];
  }

  String? get recent {
    return _localizedValues[locale.languageCode]!['recent'];
  }

  String? get vegetable {
    return _localizedValues[locale.languageCode]!['vegetable'];
  }

  String? get upload {
    return _localizedValues[locale.languageCode]!['upload'];
  }

  String? get updateInfo {
    return _localizedValues[locale.languageCode]!['updateInfo'];
  }

  String? get instruction {
    return _localizedValues[locale.languageCode]!['instruction'];
  }

  String? get cod {
    return _localizedValues[locale.languageCode]!['cod'];
  }

  String? get backToHome {
    return _localizedValues[locale.languageCode]!['backToHome'];
  }

  String? get viewEarnings {
    return _localizedValues[locale.languageCode]!['viewEarnings'];
  }

  String? get yourEarnings {
    return _localizedValues[locale.languageCode]!['yourEarnings'];
  }

  String? get youDrived {
    return _localizedValues[locale.languageCode]!['youDrived'];
  }

  String? get viewOrderInfo {
    return _localizedValues[locale.languageCode]!['viewOrderInfo'];
  }

  String? get delivered {
    return _localizedValues[locale.languageCode]!['delivered'];
  }

  String? get thankYou {
    return _localizedValues[locale.languageCode]!['thankYou'];
  }

  String? get newDeliveryTask {
    return _localizedValues[locale.languageCode]!['newDeliveryTask'];
  }

  String? get orderInfo {
    return _localizedValues[locale.languageCode]!['orderInfo'];
  }

  String? get close {
    return _localizedValues[locale.languageCode]!['close'];
  }

  String? get direction {
    return _localizedValues[locale.languageCode]!['direction'];
  }

  String? get store {
    return _localizedValues[locale.languageCode]!['store'];
  }

  String? get markPicked {
    return _localizedValues[locale.languageCode]!['markPicked'];
  }

  String? get markDelivered {
    return _localizedValues[locale.languageCode]!['markDelivered'];
  }

  String? get acceptDelivery {
    return _localizedValues[locale.languageCode]!['acceptDelivery'];
  }

  String? get address {
    return _localizedValues[locale.languageCode]!['address'];
  }

  String? get storeAddress {
    return _localizedValues[locale.languageCode]!['storeAddress'];
  }

  String? get search {
    return _localizedValues[locale.languageCode]!['search'];
  }

  String? get onion {
    return _localizedValues[locale.languageCode]!['onion'];
  }

  String? get tomato {
    return _localizedValues[locale.languageCode]!['tomato'];
  }

  String? get cauliflower {
    return _localizedValues[locale.languageCode]!['cauliflower'];
  }

  String? get add {
    return _localizedValues[locale.languageCode]!['add'];
  }

  String? get viewCart {
    return _localizedValues[locale.languageCode]!['viewCart'];
  }

  String? get placed {
    return _localizedValues[locale.languageCode]!['placed'];
  }

  String? get thanks {
    return _localizedValues[locale.languageCode]!['thanks'];
  }

  String? get inMyOrderSection {
    return _localizedValues[locale.languageCode]!['inMyOrderSection'];
  }

  String? get deliveringYourNeeds {
    return _localizedValues[locale.languageCode]!['deliveringYourNeeds'];
  }

  String? get youCanCheck {
    return _localizedValues[locale.languageCode]!['youCanCheck'];
  }

  String? get confirm {
    return _localizedValues[locale.languageCode]!['confirm'];
  }

  String? get selectPayment {
    return _localizedValues[locale.languageCode]!['selectPayment'];
  }

  String? get amount {
    return _localizedValues[locale.languageCode]!['amount'];
  }

  String? get card {
    return _localizedValues[locale.languageCode]!['card'];
  }

  String? get credit {
    return _localizedValues[locale.languageCode]!['credit'];
  }

  String? get debit {
    return _localizedValues[locale.languageCode]!['debit'];
  }

  String? get cash {
    return _localizedValues[locale.languageCode]!['cash'];
  }

  String? get other {
    return _localizedValues[locale.languageCode]!['other'];
  }

  String? get paypal {
    return _localizedValues[locale.languageCode]!['paypal'];
  }

  String? get payU {
    return _localizedValues[locale.languageCode]!['payU'];
  }

  String? get stripe {
    return _localizedValues[locale.languageCode]!['stripe'];
  }

  String? get setLocation {
    return _localizedValues[locale.languageCode]!['setLocation'];
  }

  String? get enterLocation {
    return _localizedValues[locale.languageCode]!['enterLocation'];
  }

  String? get saveAddress {
    return _localizedValues[locale.languageCode]!['saveAddress'];
  }

  String? get addressLabel {
    return _localizedValues[locale.languageCode]!['addressLabel'];
  }

  String? get office {
    return _localizedValues[locale.languageCode]!['office'];
  }

  String? get addNew {
    return _localizedValues[locale.languageCode]!['addNew'];
  }

  String? get submit {
    return _localizedValues[locale.languageCode]!['submit'];
  }

  String? get change {
    return _localizedValues[locale.languageCode]!['change'];
  }

  String? get pay {
    return _localizedValues[locale.languageCode]!['pay'];
  }

  String? get deliver {
    return _localizedValues[locale.languageCode]!['deliver'];
  }

  String? get service {
    return _localizedValues[locale.languageCode]!['service'];
  }

  String? get sub {
    return _localizedValues[locale.languageCode]!['sub'];
  }

  String? get paymentInfo {
    return _localizedValues[locale.languageCode]!['paymentInfo'];
  }

  String? get pickup {
    return _localizedValues[locale.languageCode]!['pickup'];
  }

  String? get process {
    return _localizedValues[locale.languageCode]!['process'];
  }

  String? get custom {
    return _localizedValues[locale.languageCode]!['custom'];
  }

  String? get storeFound {
    return _localizedValues[locale.languageCode]!['storeFound'];
  }

  String? get send {
    return _localizedValues[locale.languageCode]!['send'];
  }

  String? get pickupText {
    return _localizedValues[locale.languageCode]!['pickupText'];
  }

  String? get pickupAddress {
    return _localizedValues[locale.languageCode]!['pickupAddress'];
  }

  String? get dropText {
    return _localizedValues[locale.languageCode]!['dropText'];
  }

  String? get drop {
    return _localizedValues[locale.languageCode]!['drop'];
  }

  String? get packageText {
    return _localizedValues[locale.languageCode]!['packageText'];
  }

  String? get package {
    return _localizedValues[locale.languageCode]!['package'];
  }

  String? get deliveryCharge {
    return _localizedValues[locale.languageCode]!['deliveryCharge'];
  }

  String? get done {
    return _localizedValues[locale.languageCode]!['done'];
  }

  String? get vegetables {
    return _localizedValues[locale.languageCode]!['vegetables'];
  }

  String? get fruits {
    return _localizedValues[locale.languageCode]!['fruits'];
  }

  String? get herbs {
    return _localizedValues[locale.languageCode]!['herbs'];
  }

  String? get dairy {
    return _localizedValues[locale.languageCode]!['dairy'];
  }

  String? get paperDocuments {
    return _localizedValues[locale.languageCode]!['paperDocuments'];
  }

  String? get flowersChocolates {
    return _localizedValues[locale.languageCode]!['flowersChocolates'];
  }

  String? get sports {
    return _localizedValues[locale.languageCode]!['sports'];
  }

  String? get clothes {
    return _localizedValues[locale.languageCode]!['clothes'];
  }

  String? get electronic {
    return _localizedValues[locale.languageCode]!['electronic'];
  }

  String? get household {
    return _localizedValues[locale.languageCode]!['household'];
  }

  String? get glass {
    return _localizedValues[locale.languageCode]!['glass'];
  }

  String? get or {
    return _localizedValues[locale.languageCode]!['or'];
  }

  String? get continueWith {
    return _localizedValues[locale.languageCode]!['continueWith'];
  }

  String? get facebook {
    return _localizedValues[locale.languageCode]!['facebook'];
  }

  String? get google {
    return _localizedValues[locale.languageCode]!['google'];
  }

  String? get apple {
    return _localizedValues[locale.languageCode]!['apple'];
  }

  String? get wallet {
    return _localizedValues[locale.languageCode]!['wallet'];
  }

  String? get settings {
    return _localizedValues[locale.languageCode]!['settings'];
  }

  String? get availableBalance {
    return _localizedValues[locale.languageCode]!['availableBalance'];
  }

  String? get addMoney {
    return _localizedValues[locale.languageCode]!['addMoney'];
  }

  String? get accountHolderName {
    return _localizedValues[locale.languageCode]!['accountHolderName'];
  }

  String? get bankName {
    return _localizedValues[locale.languageCode]!['bankName'];
  }

  String? get branchCode {
    return _localizedValues[locale.languageCode]!['branchCode'];
  }

  String? get accountNumber {
    return _localizedValues[locale.languageCode]!['accountNumber'];
  }

  String? get enterAmountToTransfer {
    return _localizedValues[locale.languageCode]!['enterAmountToTransfer'];
  }

  String? get bankInfo {
    return _localizedValues[locale.languageCode]!['bankInfo'];
  }

  String? get display {
    return _localizedValues[locale.languageCode]!['display'];
  }

  String? get darkMode {
    return _localizedValues[locale.languageCode]!['darkMode'];
  }

  String? get darkText {
    return _localizedValues[locale.languageCode]!['darkText'];
  }

  String? get selectLanguage {
    return _localizedValues[locale.languageCode]!['language'];
  }

  String? get name1 {
    return _localizedValues[locale.languageCode]!['name1'];
  }

  String? get name2 {
    return _localizedValues[locale.languageCode]!['name2'];
  }

  String? get content1 {
    return _localizedValues[locale.languageCode]!['content1'];
  }

  String? get content2 {
    return _localizedValues[locale.languageCode]!['content2'];
  }

  String? get past {
    return _localizedValues[locale.languageCode]!['past'];
  }

  String? get rate {
    return _localizedValues[locale.languageCode]!['rate'];
  }

  String? get deliv {
    return _localizedValues[locale.languageCode]!['deliv'];
  }

  String? get how {
    return _localizedValues[locale.languageCode]!['how'];
  }

  String? get withR {
    return _localizedValues[locale.languageCode]!['withR'];
  }

  String? get addReview {
    return _localizedValues[locale.languageCode]!['addReview'];
  }

  String? get writeReview {
    return _localizedValues[locale.languageCode]!['writeReview'];
  }

  String? get feedback {
    return _localizedValues[locale.languageCode]!['feedback'];
  }

  String? get hey {
    return _localizedValues[locale.languageCode]!['hey'];
  }

  String? get searchLocation {
    return _localizedValues[locale.languageCode]!['searchLocation'];
  }

  String? get washAnd {
    return _localizedValues[locale.languageCode]!['washAnd'];
  }

  String? get fold {
    return _localizedValues[locale.languageCode]!['fold'];
  }

  String? get ironAnd {
    return _localizedValues[locale.languageCode]!['ironAnd'];
  }

  String? get clean {
    return _localizedValues[locale.languageCode]!['clean'];
  }

  String? get dry {
    return _localizedValues[locale.languageCode]!['dry'];
  }

  String? get searchLaundryStore {
    return _localizedValues[locale.languageCode]!['searchLaundryStore'];
  }

  String? get lightText {
    return _localizedValues[locale.languageCode]!['lightText'];
  }

  String? get lightMode {
    return _localizedValues[locale.languageCode]!['lightMode'];
  }

  String? get setDeliveryLocation {
    return _localizedValues[locale.languageCode]!['setDeliveryLocation'];
  }

  String? get laundry {
    return _localizedValues[locale.languageCode]!['laundry'];
  }

  String? get services {
    return _localizedValues[locale.languageCode]!['services'];
  }

  String? get enterYourMessage {
    return _localizedValues[locale.languageCode]!['enterYourMessage'];
  }

  String? get yourMessage {
    return _localizedValues[locale.languageCode]!['yourMessage'];
  }

  String? get willGetBack {
    return _localizedValues[locale.languageCode]!['willGetBack'];
  }

  String? get youAreAlmostIn {
    return _localizedValues[locale.languageCode]!['youAreAlmostIn'];
  }

  String? get pleaseProvide {
    return _localizedValues[locale.languageCode]!['pleaseProvide'];
  }

  String? get phoneNumber {
    return _localizedValues[locale.languageCode]!['phoneNumber'];
  }

  String? get deliveryPartner {
    return _localizedValues[locale.languageCode]!['deliveryPartner'];
  }

  String? get heyThere {
    return _localizedValues[locale.languageCode]!['heyThere'];
  }

  String? get englishh {
    return _localizedValues[locale.languageCode]!['englishh'];
  }

  String? get vietnamese {
    return _localizedValues[locale.languageCode]!['vietnamese'];
  }

  String? get quickWasher {
    return _localizedValues[locale.languageCode]!['quickWasher'];
  }

  String? get items {
    return _localizedValues[locale.languageCode]!['items'];
  }

  String? get moneyAdded {
    return _localizedValues[locale.languageCode]!['moneyAdded'];
  }

  String? get sentToBank {
    return _localizedValues[locale.languageCode]!['sentToBank'];
  }

  String? get whiteWash {
    return _localizedValues[locale.languageCode]!['whiteWash'];
  }

  String? get laundrySpot {
    return _localizedValues[locale.languageCode]!['laundrySpot'];
  }

  String? get nearbyLaundries {
    return _localizedValues[locale.languageCode]!['nearbyLaundries'];
  }

  String? get nearYou {
    return _localizedValues[locale.languageCode]!['nearYou'];
  }

  String? get bestRated {
    return _localizedValues[locale.languageCode]!['bestRated'];
  }

  String? get laundries {
    return _localizedValues[locale.languageCode]!['laundries'];
  }

  String? get viewAll {
    return _localizedValues[locale.languageCode]!['viewAll'];
  }

  String? get orderConfirmed {
    return _localizedValues[locale.languageCode]!['orderConfirmed'];
  }

  String? get confirmedOn {
    return _localizedValues[locale.languageCode]!['confirmedOn'];
  }

  String? get pickupArranged {
    return _localizedValues[locale.languageCode]!['pickupArranged'];
  }

  String? get makeYour {
    return _localizedValues[locale.languageCode]!['makeYour'];
  }

  String? get laundryInProcess {
    return _localizedValues[locale.languageCode]!['laundryInProcess'];
  }

  String? get yourLaundryTask {
    return _localizedValues[locale.languageCode]!['yourLaundryTask'];
  }

  String? get outForDelivery {
    return _localizedValues[locale.languageCode]!['outForDelivery'];
  }

  String? get yourLaundryIsOut {
    return _localizedValues[locale.languageCode]!['yourLaundryIsOut'];
  }

  String? get yourLaundryHasBeenDelivered {
    return _localizedValues[locale.languageCode]![
        'yourLaundryHasBeenDelivered'];
  }

  String? get shirts {
    return _localizedValues[locale.languageCode]!['shirts'];
  }

  String? get tshirts {
    return _localizedValues[locale.languageCode]!['tshirts'];
  }

  String? get jackets {
    return _localizedValues[locale.languageCode]!['jackets'];
  }

  String? get orderStatus {
    return _localizedValues[locale.languageCode]!['orderStatus'];
  }

  String? get viewOrder {
    return _localizedValues[locale.languageCode]!['viewOrder'];
  }

  String? get washOnly {
    return _localizedValues[locale.languageCode]!['washOnly'];
  }

  String? get washAndIron {
    return _localizedValues[locale.languageCode]!['washAndIron'];
  }

  String? get dryClean {
    return _localizedValues[locale.languageCode]!['dryClean'];
  }

  String? get washWhiteClothes {
    return _localizedValues[locale.languageCode]!['washWhiteClothes'];
  }

  String? get laundryPoint {
    return _localizedValues[locale.languageCode]!['laundryPoint'];
  }

  String? get pastProcess {
    return _localizedValues[locale.languageCode]!['pastProcess'];
  }

  String? get rateNow {
    return _localizedValues[locale.languageCode]!['rateNow'];
  }

  String? get selectLocation {
    return _localizedValues[locale.languageCode]!['selectLocation'];
  }

  String? get pickupInfo {
    return _localizedValues[locale.languageCode]!['pickupInfo'];
  }

  String? get home {
    return _localizedValues[locale.languageCode]!['home'];
  }

  String? get dropInfo {
    return _localizedValues[locale.languageCode]!['dropInfo'];
  }

  String? get anyInstruction {
    return _localizedValues[locale.languageCode]!['anyInstruction'];
  }

  String? get jeans {
    return _localizedValues[locale.languageCode]!['jeans'];
  }

  String? get shorts {
    return _localizedValues[locale.languageCode]!['shorts'];
  }

  String? get man {
    return _localizedValues[locale.languageCode]!['man'];
  }

  String? get woman {
    return _localizedValues[locale.languageCode]!['woman'];
  }

  String? get kids {
    return _localizedValues[locale.languageCode]!['kids'];
  }

  String? get others {
    return _localizedValues[locale.languageCode]!['others'];
  }

  String? get selectTasks {
    return _localizedValues[locale.languageCode]!['selectTasks'];
  }

  String? get addtoOrder {
    return _localizedValues[locale.languageCode]!['addto'];
  }
}

class AppLocalizationsDelegate extends LocalizationsDelegate<AppLocalizations> {
  const AppLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) => ['en', 'vn'].contains(locale.languageCode);

  @override
  Future<AppLocalizations> load(Locale locale) {
    // Returning a SynchronousFuture here because an async "load" operation
    // isn't needed to produce an instance of AppLocalizations.
    return SynchronousFuture<AppLocalizations>(AppLocalizations(locale));
  }

  @override
  bool shouldReload(AppLocalizationsDelegate old) => false;
}
