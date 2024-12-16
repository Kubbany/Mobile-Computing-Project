// ignore_for_file: use_build_context_synchronously
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce_app/features/admin/data/repos/products_repo.dart';
import 'package:ecommerce_app/features/admin/presentation/manager/cubits/edit_product_cubit/edit_product_cubit.dart';
import 'package:ecommerce_app/features/admin/presentation/views/widgets/custom_admin_product_item.dart';
import 'package:ecommerce_app/features/products/data/models/product_model.dart';
import 'package:ecommerce_app/utils/get_it_setup.dart';
import 'package:ecommerce_app/utils/scan_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:speech_to_text/speech_to_text.dart' as stt;

class CustomAdminSearchDelegate extends SearchDelegate {
  final stt.SpeechToText speechToText = stt.SpeechToText();
  Future<List<ProductModel>> fetchProducts() async {
    final snapshot =
        await FirebaseFirestore.instance.collection('products').get();
    return snapshot.docs.map((e) => ProductModel.fromFirestoreDoc(e)).toList();
  }

  Future<void> requestMicrophonePermission(BuildContext context) async {
    var status = await Permission.microphone.request();
    if (!status.isGranted) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Microphone Permission Required"),
        ),
      );
    }
  }

  Future<void> startVoiceSearch(BuildContext context) async {
    await requestMicrophonePermission(context);

    bool available = await speechToText.initialize();
    if (available) {
      speechToText.listen(
        onResult: (result) {
          query = result.recognizedWords;
        },
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Voice recognition not available')),
      );
    }
  }

  void startCameraScan(BuildContext context) {
    Navigator.of(context)
        .push(
      MaterialPageRoute(
        builder: (context) => const ScanView(),
      ),
    )
        .then(
      (value) {
        if (value != null) {
          query = value;
        }
      },
    );
  }

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        onPressed: () {
          startVoiceSearch(context);
        },
        icon: const Icon(
          Icons.mic_none,
          size: 30,
        ),
      ),
      IconButton(
        onPressed: () {
          startCameraScan(context);
        },
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
    return BlocProvider(
      create: (context) => EditProductCubit(getIt<ProductsRepo>()),
      child: FutureBuilder<List<ProductModel>>(
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
                .where(
                  (product) =>
                      product.title.toString().toLowerCase().contains(
                            query.toLowerCase(),
                          ) ||
                      product.barcode.toString().toLowerCase().contains(
                            query.toLowerCase(),
                          ),
                )
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
      ),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return buildResults(context);
  }
}
