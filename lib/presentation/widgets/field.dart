import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class Field extends HookWidget {
  final TextEditingController? controller;
  final String? label;
  final IconData? iconData;
  final bool? obscureText;
  final String? Function(String?)? validator;
  final ValueChanged<String>? onChanged;
  final InputBorder? border;
  final TextInputType? keyboard;
  final int? max;
  final bool? read;

  const Field({
    this.read = false,
    this.max,
    this.keyboard,
    Key? key,
    this.controller,
    this.border,
    this.label,
    this.iconData,
    this.obscureText = false,
    this.validator,
    this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final hidden = useState(obscureText);
    return Material(
      borderRadius: BorderRadius.circular(8.0),
      color: Colors.blue.withOpacity(0.3),
      elevation: 0.0,
      child: Padding(
        padding: const EdgeInsets.only(left: 12.0),
        child: TextFormField(
          readOnly: read!,
          keyboardType: keyboard,
          maxLines: max,
          controller: controller,
          decoration: InputDecoration(
            border: InputBorder.none,
            errorBorder: const UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.red)),
            focusedErrorBorder: const UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.red)),
            labelText: label,
            icon: Icon(iconData),
            suffixIcon: obscureText!
                ? IconButton(
                    onPressed: () => hidden.value = !hidden.value!,
                    icon: Icon(hidden.value!
                        ? Icons.visibility_off
                        : Icons.visibility),
                  )
                : const SizedBox.shrink(),
          ),
          obscureText: hidden.value!,
          validator: validator,
          onChanged: onChanged,
        ),
      ),
    );
  }
}
