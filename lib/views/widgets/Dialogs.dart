import 'package:flutter/material.dart';
import 'package:invoice/utils/Localization/Languages/Languages.dart';

class Dialogs {
  static showAlertDialog(
    BuildContext context, {
    required String title,
    String? body,
    String? positiveTitle,
    String? negativeTitle,
    Function? positiveCallback,
    Function? negativeCallback,
  }) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        title: Text(title),
        content: body != null
            ? SingleChildScrollView(
                child: ListBody(
                  children: <Widget>[
                    Text(body),
                  ],
                ),
              )
            : null,
        actions: <Widget>[
          positiveTitle != null
              ? FlatButton(
                  shape: StadiumBorder(),
                  child: Text(positiveTitle),
                  onPressed: () {
                    Navigator.of(context).pop();
                    if (positiveCallback != null) {
                      positiveCallback();
                    }
                  },
                )
              : SizedBox(),
          FlatButton(
              shape: StadiumBorder(),
              child: Text(negativeTitle!),
              onPressed: () {
                if (negativeCallback != null) {
                  negativeCallback();
                }
                Navigator.of(context).pop();
              }),
        ],
      ),
    );
  }

  static showErrorMsg(GlobalKey<ScaffoldState> key, String msg,
      {int? duration}) {
    key.currentState!.showSnackBar(
      SnackBar(
        margin: const EdgeInsets.fromLTRB(8, 0, 8, 100),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
        behavior: SnackBarBehavior.floating,
        duration: Duration(seconds: duration ?? 5),
        content: Text(
          msg,
          style: TextStyle(
            fontSize: 16,
            color: Colors.white
          ),
          textAlign: TextAlign.center,
          overflow: TextOverflow.ellipsis,
          softWrap: true,
          maxLines: 3,
        ),
      ),
    );
  }

  static buildSnackBar(String text, GlobalKey<ScaffoldState> scaffoldKey,
      {int duration = 8}) {
    SnackBar snackBar = SnackBar(
      content: Text(text),
      duration: Duration(seconds: duration),
    );
    scaffoldKey.currentState!.showSnackBar(snackBar);
  }

  // static showFlushBar(
  //     {int duration,
  //     @required String text,
  //     Color iconColor,
  //     IconData iconData,
  //     Color backgroundColor,
  //     double margin,
  //     double borderRadius,
  //     @required BuildContext context}) async {
  //   dismiss();
  //   Flushbar(
  //     margin: EdgeInsets.all(margin ?? 5),
  //     borderRadius: borderRadius ?? 10,
  //     backgroundColor: backgroundColor ?? Colors.black87,
  //     icon: Icon(iconData ?? Icons.done, color: iconColor ?? Colors.white),
  //     flushbarStyle: FlushbarStyle.FLOATING,
  //     message: text,
  //     duration: Duration(seconds: duration ?? 8),
  //   )..show(context);
  // }
  //
  // static dismiss() async {
  //   if (!Flushbar().isDismissed()) {
  //     await Flushbar().dismiss();
  //   }
  // }
}
