import 'package:dio/dio.dart';
import 'package:fluttertoast/fluttertoast.dart';

class CustomToast {
  static void showToast({
    required String msg,
    Toast toastLength = Toast.LENGTH_SHORT,
  }) {
    Fluttertoast.showToast(
      msg: msg,
      toastLength:
          toastLength == Toast.LENGTH_SHORT || toastLength == Toast.LENGTH_LONG
              ? toastLength
              : Toast.LENGTH_SHORT,
    );
  }

  static void showDioErrMessage(Response response) {
    final responseData = response.data;
    {
      if (responseData['message'] is Map) {
        final error = responseData['message']['error'];
        if (error is Map) {
          final errorMessage = error['errorMessage'] ?? '';
          if (errorMessage is String && errorMessage.isNotEmpty) {
            Fluttertoast.showToast(
                msg: errorMessage, toastLength: Toast.LENGTH_LONG);
            return;
          }
        }
      }
      final message = responseData['message'] ?? responseData['detail'] ?? '';
      if (message is String && message.isNotEmpty) {
        Fluttertoast.showToast(msg: message, toastLength: Toast.LENGTH_SHORT);
      } else {
        Fluttertoast.showToast(
          msg: "Something went wrong",
          toastLength: Toast.LENGTH_SHORT,
        );
      }
    }
  }
}
