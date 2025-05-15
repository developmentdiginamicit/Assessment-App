// import 'dart:async';

// import 'package:get/get.dart';

// class CountdownTimer extends GetxController{
//   late Timer _timer;
//   int _remainingSeconds;

//   CountdownTimer(String timeInSeconds) 
//       : _remainingSeconds = int.parse(timeInSeconds.replaceAll('s', ''));

//   String getFormattedTime() {
//     int minutes = _remainingSeconds ~/ 60;
//     int seconds = _remainingSeconds % 60;
//     return '${minutes.toString().padLeft(2, '0')}:${seconds.toString().padLeft(2, '0')}';
//   }

//   void start(Function(String) onTick, Function onComplete) {
//     // Call the callback immediately with the initial time
//     onTick(getFormattedTime());
    
//     _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
//       if (_remainingSeconds > 0) {
//         _remainingSeconds--;
//         onTick(getFormattedTime()); // Send updated time to callback
//       } else {
//         _timer.cancel();
//         onComplete(); // Notify when the countdown is complete
//       }
//     });
//   }

//   void stop() {
//     if (_timer.isActive) {

//       _timer.cancel();
//     }
//   }
// }
