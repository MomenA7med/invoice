import 'package:flutter/material.dart';

abstract class Languages {
  static Languages? of(BuildContext context) {
    return Localizations.of<Languages>(context, Languages);
  }

  String get kAppName;
  String get kName;
  String get kStartNow;
  String get kHaveAccount;
  String get kLogin;
  String get kCompanyName;
  String get kGetCreateInvoice;
  String get kCompanyEmail;
  String get kCompanyMobile;
  String get kPassword;
  String get kWelcome;
  String get kForgetPass;
  String get kCreateAccount;
  String get kRestorePass;
  String get kRegister;
  String get kHome;
  String get kInvoice;
  String get kClient;
  String get kItem;
  String get kDescription;
  String get kSalesPrice;
  String get kQuantity;
  String get kItemCost;
  String get kTaxable;
  String get kCreate;
  String get kClientName;
  String get kType;
  String get kIndividual;
  String get kCompany;
  String get kInfo;
  String get kImportContant;
  String get kAdd;
  String get kAddAndCreateInvoice;
  String get kVat;
  String get kCr;
  String get kContactPerson;
  String get kEdit;
  String get kPreview;
  String get kHistory;
  String get kInvoiceNum;
  String get kBusinessInfo;
  String get kInvoiceDate;
  String get kPaid;
  String get kDue;
  String get kProducts;
  String get kAddProducts;
  String get kChooseProduct;
  String get kProductPrice;
  String get kAmount;
  String get kDiscount;
  String get kTax;
  String get kTotal;
  String get kDuePrice;
  String get kAddPhoto;
  String get kPaymentInstruction;
  String get kSigniture;
  String get kNotes;
  String get kChooseDate;
  String get kSave;
  String get kContinue;
}
