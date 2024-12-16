// ignore_for_file: use_build_context_synchronously

import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce_app/features/admin/presentation/views/widgets/custom_admin_product_item.dart';
import 'package:ecommerce_app/features/products/data/models/product_model.dart';
import 'package:flutter/material.dart';
import 'package:speech_to_text/speech_to_text.dart' as stt;

class CustomAdminSearchDelegate extends SearchDelegate {
  final stt.SpeechToText speechToText = stt.SpeechToText();
  Future<List<ProductModel>> fetchProducts() async {
    final snapshot =
        await FirebaseFirestore.instance.collection('products').get();
    return snapshot.docs.map((e) => ProductModel.fromFirestoreDoc(e)).toList();
  }

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        onPressed: () {
          log("Started");
        },
        icon: const Icon(
          Icons.mic_none,
          size: 30,
        ),
      ),
      IconButton(
        onPressed: () {},
        icon: const Icon(
          Icons.camera_alt_outlined,
          size: 30,
        ),
      ),
      IconButton(
        icon: const Icon(Icons.clear),
        onPressed: () {
          query = '';
          // When pressed here the query will be cleared from the search bar.
        },
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.arrow_back),
      onPressed: () => Navigator.of(context).pop(),
      // Exit from the search screen.
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    // Filter products based on query
    return FutureBuilder<List<ProductModel>>(
      future: fetchProducts(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return const Center(child: Text('No products found'));
        } else {
          final results = snapshot.data!
              .where((product) => product.title
                  .toString()
                  .toLowerCase()
                  .contains(query.toLowerCase()))
              .toList();

          return Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 12,
            ),
            child: ListView.builder(
              itemCount: results.length,
              itemBuilder: (context, index) {
                final product = results[index];
                return CustomAdminProductItem(item: product);
              },
            ),
          );
        }
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return buildResults(context);
  }
}
