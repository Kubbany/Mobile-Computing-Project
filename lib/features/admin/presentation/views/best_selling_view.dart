import 'package:ecommerce_app/features/admin/data/repos/products_repo.dart';
import 'package:ecommerce_app/features/products/data/models/product_model.dart';
import 'package:ecommerce_app/utils/get_it_setup.dart';
import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

class BestSellingView extends StatelessWidget {
  const BestSellingView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Best Selling Products")),
      body: StreamBuilder(
          stream: getIt<ProductsRepo>().getCategoryProducts(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            }

            final products = snapshot.data?.docs.map(
                  (e) => ProductModel.fromFirestoreDoc(e),
                ) ??
                [];
            final topSellingProducts = products
                .where((product) => product.numOfSellings > 0)
                .toList()
              ..sort((a, b) => b.numOfSellings.compareTo(a.numOfSellings));

            final bestSellers = topSellingProducts.take(4).toList();
            return Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  Text(
                    "Top 4 Best Selling Products",
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  const SizedBox(height: 16),

                  // Chart or List
                  if (bestSellers.isEmpty)
                    const Center(
                        child: Text("No products available for the chart"))
                  else
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(bottom: 50),
                        child: Column(
                          children: [
                            Expanded(
                              child: ListView.builder(
                                itemCount: bestSellers.length,
                                itemBuilder: (context, index) {
                                  final product = bestSellers[index];
                                  return Card(
                                    elevation: 4,
                                    margin:
                                        const EdgeInsets.symmetric(vertical: 8),
                                    child: ListTile(
                                      title: Text(product.title),
                                      trailing: Text(
                                        "Sold: ${product.numOfSellings}",
                                        style: const TextStyle(
                                          fontSize: 16,
                                        ),
                                      ),
                                    ),
                                  );
                                },
                              ),
                            ),
                            const SizedBox(height: 16),
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: BarChart(
                                  BarChartData(
                                    barGroups: bestSellers.map((product) {
                                      final index =
                                          bestSellers.indexOf(product);
                                      return BarChartGroupData(
                                        x: index,
                                        barRods: [
                                          BarChartRodData(
                                            toY: product.numOfSellings
                                                .toDouble(),
                                            color: Colors.blue,
                                            width: 20,
                                          ),
                                        ],
                                        showingTooltipIndicators: [0],
                                      );
                                    }).toList(),
                                    titlesData: const FlTitlesData(
                                      leftTitles: AxisTitles(
                                        sideTitles: SideTitles(
                                          showTitles: true,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                ],
              ),
            );
          }),
    );
  }
}
