import 'dart:ui';

import 'package:flutter/material.dart';

import '../enums/failure_type.dart';

abstract class ScreenUtil {
  bool loading = false;
  Map<FailureType, String> errorMessages = {};
  void showLoading(BuildContext context) {
    loading = true;
    showDialog(
        context: context,
        builder: (context) => WillPopScope(
            child: _loadingWidget(context: context),
            onWillPop: () => Future.value(false)),
        barrierDismissible: false);
  }

  void stopLoading(BuildContext context) {
    if (loading) {
      Navigator.pop(context);
      loading = false;
    }
  }

  void showErrorSnackMessage(BuildContext context, FailureType type,
      {double? duration}) {
    ScaffoldMessenger.of(context).showSnackBar(
        _getSnackBar(false, errorMessages[type] ?? "", duration: duration));
  }

  void showSuccessSnackMessage(BuildContext context, String message,
      {double? duration}) {
    ScaffoldMessenger.of(context)
        .showSnackBar(_getSnackBar(true, message, duration: duration));
  }

  SnackBar _getSnackBar(bool success, String message, {double? duration}) {
    return SnackBar(
      behavior: SnackBarBehavior.fixed,
      padding: const EdgeInsets.only(left: 20, top: 2, right: 2, bottom: 2),
      backgroundColor: success ? Colors.green : Colors.red,
      duration: Duration(seconds: duration?.toInt() ?? 4),
      content: ListTile(
        contentPadding: const EdgeInsets.all(2),
        title: Text(
          success ? "Success" : "Fail",
          style: const TextStyle(color: Colors.white, fontSize: 18),
        ),
        subtitle: Text(
          message,
          style: const TextStyle(color: Colors.white, fontSize: 15),
        ),
        tileColor: success ? Colors.green : Colors.red,
      ),
    );
  }

  Widget _loadingWidget({Color? color, required BuildContext context}) {
    return Container(
      constraints: const BoxConstraints.expand(),
      color: Colors.transparent,
      child: Stack(
        children: [
          BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
            child: Container(
              constraints: const BoxConstraints.expand(),
            ),
          ),
          Center(
            child: CircularProgressIndicator(
              color: color ?? Theme.of(context).primaryColor,
            ),
          ),
        ],
      ),
    );
  }
}
