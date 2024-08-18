import 'package:flutter/material.dart';
import 'package:prueba_tecnica_dismac/app/utils/utils.dart';

import '../../utils/custom_colors.dart';

class DefaultButton extends StatelessWidget {
  const DefaultButton({
    super.key,
    this.callback,
    required this.label,
  });
  final void Function()? callback;
  final String label;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: callback,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: primary,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              label,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: white,
              ),
            )
          ].divide(const SizedBox(
            width: 8,
          )),
        ),
      ),
    );
  }
}
