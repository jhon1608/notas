import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/diagnostics.dart';
import 'package:notas/app/theme/theme.dart';

class AppGlobalWidget {
  static AppBar appBar({required String title}) {
    return AppBar(
      elevation: 1,
      backgroundColor: AppTheme.instance.colorAppBar,
      title: Center(
        child: Text(
          title,
          style: TextStyle(
            color: AppTheme.instance.colorText,
          ),
        ),
      ),
    );
  }
}
