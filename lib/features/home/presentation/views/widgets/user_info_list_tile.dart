import 'package:ecommerce_app/constants.dart';
import 'package:flutter/material.dart';

class UserInfoListTile extends StatelessWidget {
  const UserInfoListTile({
    super.key,
    required this.username,
    required this.email,
  });

  final String username;
  final String email;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(
            16,
          ),
        ),
        color: kPrimaryColor,
        child: ListTile(
          leading: const Icon(
            Icons.person,
            size: 45,
          ),
          title: Text(
            username,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 22,
            ),
          ),
          subtitle: Text(
            email,
            style: const TextStyle(
              color: Colors.grey,
              fontSize: 18,
            ),
          ),
        ),
      ),
    );
  }
}
