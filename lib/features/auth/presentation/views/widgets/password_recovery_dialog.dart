// ignore_for_file: use_build_context_synchronously

import 'package:ecommerce_app/features/auth/presentation/views/widgets/custom_button.dart';
import 'package:ecommerce_app/features/auth/presentation/views/widgets/custom_text_field.dart';
import 'package:ecommerce_app/utils/loading_overlay_blured.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class PasswordRecvoeryDialog extends StatefulWidget {
  const PasswordRecvoeryDialog({
    super.key,
  });

  @override
  State<PasswordRecvoeryDialog> createState() => _PasswordRecvoeryDialogState();
}

class _PasswordRecvoeryDialogState extends State<PasswordRecvoeryDialog> {
  bool isLoading = false;
  final GlobalKey<FormState> formKey = GlobalKey();
  final TextEditingController textEditingController = TextEditingController();
  @override
  void dispose() {
    textEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: LoadingOverlayBlured(
        isLoading: isLoading,
        child: AlertDialog(
          title: const Text("Password Recovery"),
          content: Form(
            key: formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text(
                  "Enter Your Email To Send Recovery Link",
                  style: TextStyle(
                    fontSize: 18,
                  ),
                ),
                CustomTextField(
                  textEditingController: textEditingController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "This Field Cannot Be Empty";
                    }
                    final emailRegex =
                        RegExp(r'^[\w-.]+@([\w-]+\.)+[\w-]{2,4}$');
                    if (!emailRegex.hasMatch(value)) {
                      return "Please Enter A Valid Email";
                    }
                    return null;
                  },
                  labelText: "Email",
                  prefixIcon: Icons.email,
                ),
              ],
            ),
          ),
          actions: [
            CustomButton(
              onPressed: () async {
                if (formKey.currentState!.validate()) {
                  isLoading = true;
                  setState(() {});
                  try {
                    await FirebaseAuth.instance.sendPasswordResetEmail(
                      email: textEditingController.text,
                    );
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text(
                          "Email Was Sent",
                        ),
                      ),
                    );
                    Navigator.pop(context);
                  } on Exception catch (e) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(
                          e.toString(),
                        ),
                      ),
                    );
                  }
                  isLoading = false;
                  setState(() {});
                }
              },
              title: "Send",
            ),
          ],
        ),
      ),
    );
  }
}
