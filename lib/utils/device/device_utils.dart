import 'package:flutter/services.dart';

class DeviceUtils {
  static copyToClipboard(String content) {
    Clipboard.setData(new ClipboardData(text: content));
  }
}
