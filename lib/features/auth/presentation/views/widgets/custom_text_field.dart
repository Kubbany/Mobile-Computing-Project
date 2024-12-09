import 'package:flutter/material.dart';

class CustomTextField extends StatefulWidget {
  const CustomTextField({
    super.key,
    required this.labelText,
    required this.prefixIcon,
    this.isPasswordField = false,
    this.keyboardType,
    this.textEditingController,
  });
  final IconData prefixIcon;
  final String labelText;
  final bool isPasswordField;
  final TextEditingController? textEditingController;
  final TextInputType? keyboardType;
  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  bool isVisible = false;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        top: 25,
      ),
      child: TextFormField(
        controller: widget.textEditingController,
        validator: (value) {
          if (value == null || value.isEmpty) {
            return "This Filed Cannot Be Empty";
          }
          return null;
        },
        keyboardType: widget.keyboardType,
        obscureText: widget.isPasswordField ? !isVisible : false,
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.symmetric(
            vertical: 22,
          ),
          enabledBorder: buildBorder(),
          errorBorder: buildBorder(color: Colors.red),
          focusedBorder: buildBorder(
            color: Colors.blue,
          ),
          focusedErrorBorder: buildBorder(
            color: Colors.red,
          ),
          prefixIcon: Padding(
            padding: const EdgeInsets.only(
              left: 15,
              right: 10,
            ),
            child: Icon(
              widget.prefixIcon,
            ),
          ),
          labelText: widget.labelText,
          labelStyle: const TextStyle(
            fontSize: 20,
            color: Colors.white,
          ),
          suffixIcon: widget.isPasswordField == false
              ? const SizedBox()
              : IconButton(
                  onPressed: () {
                    isVisible = !isVisible;
                    setState(() {});
                  },
                  icon: Icon(
                    isVisible != true ? Icons.visibility_off : Icons.visibility,
                  ),
                ),
        ),
      ),
    );
  }

  OutlineInputBorder buildBorder({Color? color}) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: BorderSide(
        color: color ?? Colors.grey,
      ),
    );
  }
}
