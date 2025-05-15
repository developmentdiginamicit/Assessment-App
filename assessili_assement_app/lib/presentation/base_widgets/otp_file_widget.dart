import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class OtpFieldWidget extends StatelessWidget {
  final Function(String)? onChanged;
  const OtpFieldWidget({
    super.key,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return PinCodeTextField(
      pinTheme: PinTheme(
          shape: PinCodeFieldShape.box,
          disabledColor: Colors.white,
           borderRadius: BorderRadius.circular(10.r),
        activeColor: Colors.white,
        selectedFillColor: Colors.white,
        activeFillColor: Colors.white,
        inactiveFillColor: Colors.white,
        selectedColor: Colors.white,
        inactiveColor: Colors.white,
        errorBorderColor: Theme.of(context).colorScheme.error,),
      cursorColor: Theme.of(context).primaryColor,
      textStyle: const TextStyle(
        color: Colors.white, // Color of the digits inside the boxes
       // Adjust the size as needed
        fontWeight: FontWeight.bold,
      ),
      appContext: context,
      length: 6,
      obscureText: false,
      animationType: AnimationType.fade,
      animationDuration: const Duration(milliseconds: 300),
      hapticFeedbackTypes: HapticFeedbackTypes.light,
      useHapticFeedback: true,
      autoDismissKeyboard: true,
      keyboardType: TextInputType.number,
      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
      validator: (value) {
        if (value.toString().length < 6) {
          return "Enter 6 digit OTP";
        } else {
          return null;
        }
      },
      onChanged: onChanged,
    );
  }
}
