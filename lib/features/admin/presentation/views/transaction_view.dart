import 'package:ecommerce_app/features/admin/presentation/views/widgets/transaction_view_body.dart';
import 'package:flutter/material.dart';

class TransactionView extends StatelessWidget {
  const TransactionView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: TransactionViewBody(),
    );
  }
}
