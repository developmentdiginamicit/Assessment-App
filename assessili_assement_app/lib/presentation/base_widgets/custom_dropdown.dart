import 'package:flutter/material.dart';

class CustomDropdown<T> extends StatelessWidget {
  final List<T> items;
  final T? value;
  final Widget hint;
  final ValueChanged<T?> onChanged;
  final Widget Function(BuildContext, T) itemBuilder;
  final double? borderRadius;
  final Color? borderColor;
  final Color? fillColor;

  const CustomDropdown(
      {super.key,
      required this.items,
      this.value,
      required this.hint,
      required this.onChanged,
      required this.itemBuilder,
      this.fillColor,
      this.borderColor,
      this.borderRadius});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
      decoration: BoxDecoration(
        color: fillColor,
        // borderRadius: BorderRadius.circular(borderRadius ?? 8),
        // border: Border.all(
        //     color: borderColor ?? Theme.of(context).hintColor, width: 1),
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<T>(
          // borderRadius: BorderRadius.circular(12.r),
          value: value,
          hint: hint,
          // isExpanded: true,
          items: items.map((T item) {
            return DropdownMenuItem<T>(
              value: item,
              child: itemBuilder(context, item),
            );
          }).toList(),
          onChanged: onChanged,
        ),
      ),
    );
  }
}
