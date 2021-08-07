import "package:flutter/material.dart";
import "package:melon/routes/home/BioMetricsPage.dart";
import "package:melon/routes/home/HelpPage.dart";
import "package:melon/routes/home/LanguagePage.dart";
import "package:melon/routes/home/Legal.dart";
import 'package:melon/routes/payment/FundPage.dart';
import "package:melon/routes/payment/MenuPaymentPage.dart";
import "package:melon/routes/payment/PaymentHistory.dart";
import "package:melon/routes/payment/QRScanner.dart";
import "package:melon/routes/payment/Rewards.dart";
import "package:melon/routes/user/ChangeAddress.dart";
import "package:melon/routes/user/ChangeEmail.dart";
import "package:melon/routes/user/ChangeNumber.dart";
import "package:melon/routes/user/EditName.dart";
import "package:melon/routes/user/NextofKin.dart";
import "package:melon/routes/user/Profile.dart";
import "package:melon/routes/user/UploadDocuments.dart";
import "package:melon/routes/user/auth/LoginPage.dart";
import "package:melon/utils/GlobalWidgets.dart";

List records = [
  {
    "type": "scan",
    "description": "Pay for food. Ketu",
    "amount": "NGN3,000,000.43",
    "date": "12 Jan 2021"
  },
  {
    "type": "scan",
    "description": "Pay for Dentist. Lekki",
    "amount": "NGN3,000,000.43",
    "date": "12 Jan 2021"
  },
  {
    "type": "transfer",
    "description": "Pay for food. Ketu",
    "amount": "NGN3,000,000.43",
    "date": "12 Jan 2021"
  },
  {
    "type": "scan",
    "description": "Pay for Dentist. Lekki",
    "amount": "NGN3,000,000.43",
    "date": "12 Jan 2021"
  },
  {
    "type": "scan",
    "description": "Pay for Dentist. Lekki",
    "amount": "NGN3,000,000.43",
    "date": "12 Jan 2021"
  }
];

List<Map<String, Widget>> menu = <Map<String, Widget>>[
  {
    "name": const Text(
      "Account Settings",
      style: TextStyle(color: AppColors.primaryColor),
    ),
    "icon": const Icon(Icons.person, color: AppColors.primaryColor)
  },
  {
    "name": const Text(
      "Transaction Historys",
      style: TextStyle(color: AppColors.buttonColor),
    ),
    "icon": const Icon(Icons.wallet_membership, color: AppColors.primaryColor)
  },
  {
    "name": const Text(
      "Rewards",
      style: TextStyle(color: AppColors.buttonColor),
    ),
    "icon": const Icon(Icons.card_giftcard, color: AppColors.primaryColor)
  },
  {
    "name": const Text(
      "Security",
      style: TextStyle(color: AppColors.buttonColor),
    ),
    "icon": const Icon(Icons.enhanced_encryption_rounded,
        color: AppColors.primaryColor)
  },
  {
    "name": const Text(
      "Help",
      style: TextStyle(color: AppColors.buttonColor),
    ),
    "icon": const Icon(Icons.question_answer, color: AppColors.primaryColor)
  },
  {
    "name": const Text(
      "Biometric",
      style: TextStyle(color: AppColors.buttonColor),
    ),
    "icon": const Icon(Icons.fingerprint_rounded, color: AppColors.primaryColor)
  },
  {
    "name": const Text(
      "Language",
      style: TextStyle(color: AppColors.buttonColor),
    ),
    "icon": const Icon(Icons.chat_bubble, color: AppColors.primaryColor)
  },
  {
    "name": const Text("Legal",
        style: TextStyle(
          color: AppColors.buttonColor,
        )),
    "icon": const Icon(Icons.post_add, color: AppColors.primaryColor)
  },
  {
    "name": const Text("Sign Out"),
    "icon": const Icon(Icons.door_back_outlined, color: AppColors.primaryColor)
  }
];

final List<Widget> menuPageRoute = <Widget>[
  AccountProfile(),
  const PaymentsHistory(),
  const Rewards(),
  Container(),
  const HelpPage(),
  const BioMetrics(),
  LanguagePage(),
  LegalPage(),
  const LoginPage()
];

final List<Widget> profilePageRoutes = <Widget>[
  const EditName(),
  const ChangeAddress(),
  const UpdateNumber(),
  const UpdateEmail(),
  const UploadDocuments(),
  const NextOfKin(),
];

List<IconData> acountPageIcons = <IconData>[
  Icons.person,
  Icons.location_on,
  Icons.phone,
  Icons.message,
  Icons.post_add,
  Icons.send_and_archive
];

List<Widget> acountPageRoute = <Widget>[];

List<String> menuItems = <String>["Scan", "Payment", "Fund", "Save"];

List<IconData> menuIcon = <IconData>[
  Icons.qr_code_2_rounded,
  Icons.credit_card,
  Icons.account_balance_wallet_outlined,
  Icons.savings_rounded
];

List<Widget> menuRoute = <Widget>[
  const QRScanner(),
  MenuPaymentPage(),
  FundPage(),
  Container()
];
List<Map<String, dynamic>> bankTransferData = <Map<String, dynamic>>[
  {"bank": "Zenith Bank", "name": "Kola Alapomeji..."},
  {"bank": "Zenith Bank", "name": "Rafiu Malik..."},
  {"bank": "Zenith Bank", "name": "Kola Alapomeji..."},
  {"bank": "Zenith Bank", "name": "Kola Alapomeji..."}
];

List<Map<String, dynamic>> airtimeData = <Map<String, dynamic>>[
  {"network": "airtel", "number": "08134859030"},
  {"network": "airtel", "number": "08134859030"},
  {"network": "airtel", "number": "08134859030"},
  {"network": "airtel", "number": "08134859030"},
];

List<Map<String, dynamic>> tvData = <Map<String, dynamic>>[
  {"provider": "dstv", "number": "08134859030"},
  {"provider": "dstv", "number": "08134859030"},
  {"provider": "dstv", "number": "08134859030"},
  {"provider": "dstv", "number": "08134859030"},
];

List<String> states = [
  "Abia",
  "Adamawa",
  "Akwa Ibom",
  "Anambra",
  "Bauchi",
  "Bayelsa",
  "Benue",
  "Borno",
  "Cross River",
  "Delta",
  "Ebonyi",
  "Edo",
  "Ekiti",
  "Enugu",
  "FCT - Abuja",
  "Gombe",
  "Imo",
  "Jigawa",
  "Kaduna",
  "Kano",
  "Katsina",
  "Kebbi",
  "Kogi",
  "Kwara",
  "Lagos",
  "Nasarawa",
  "Niger",
  "Ogun",
  "Ondo",
  "Osun",
  "Oyo",
  "Plateau",
  "Rivers",
  "Sokoto",
  "Taraba",
  "Yobe",
  "Zamfara"
];
