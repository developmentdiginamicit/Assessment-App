import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NoDataFoundWidget extends StatelessWidget {
  final VoidCallback onRefresh;
  final String errorMessage;
  final bool? isInternetConnected, refreshButtonShowing;

  const NoDataFoundWidget(
      {super.key,
      required this.onRefresh,
      this.refreshButtonShowing = false,
      required this.errorMessage,
      this.isInternetConnected = true});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: EdgeInsets.only(left: 23.w, right: 23.w),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              isInternetConnected == false
                  ? "Please connect your internet"
                  : errorMessage,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
                color: Colors.grey,
              ),
            ),
            const SizedBox(height: 20.0),
            isInternetConnected == false
                ? const SizedBox.shrink()
                : refreshButtonShowing == false
                    ? const SizedBox.shrink()
                    : ElevatedButton.icon(
                        onPressed: onRefresh,
                        icon: Icon(
                          Icons.refresh,
                          color: Theme.of(context).primaryColorLight,
                        ),
                        label: Text(
                          'Refresh',
                          style: TextStyle(
                            color: Theme.of(context).primaryColorLight,
                          ),
                        ),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Theme.of(context).primaryColor,
                          textStyle: const TextStyle(fontSize: 16.0),
                        ),
                      ),
          ],
        ),
      ),
    );
  }
}
