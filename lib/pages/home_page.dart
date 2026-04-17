import 'package:flutter/material.dart';
import '../data/dummy_data.dart';
import 'detail_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    if (products.isEmpty) {
      return const Scaffold(
        body: Center(child: Text("Ürün bulunamadı")),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text("Mini Katalog"),
        centerTitle: true,
        elevation: 0,
      ),
      body: GridView.builder(
        padding: const EdgeInsets.all(12),
        itemCount: products.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 0.75,
          crossAxisSpacing: 12,
          mainAxisSpacing: 12,
        ),
        itemBuilder: (ctx, index) {
          final product = products[index];

          return Material(
            borderRadius: BorderRadius.circular(15),
            color: Colors.white,
            elevation: 3,
            child: InkWell(
              borderRadius: BorderRadius.circular(15),
              onTap: () {
                // Detay sayfasına git
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => DetailPage(product: product),
                  ),
                );
              },
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // IMAGE
                  Hero(
                    tag: product.id,
                    child: ClipRRect(
                      borderRadius: const BorderRadius.vertical(
                        top: Radius.circular(15),
                      ),
                      child: Image.asset(
                        product.image,
                        height: 120,
                        width: double.infinity,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),

                  const SizedBox(height: 6),

                  // TITLE
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: Text(
                      product.title,
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),

                  const Spacer(),

                  // PRICE + BUTTON
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: Text(
                      "${product.price} ₺",
                      style: const TextStyle(color: Colors.blue),
                    ),
                  ),

                  const SizedBox(height: 4),

                  Padding(
                    padding: const EdgeInsets.all(8),
                    child: SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(
                                  "${product.title} sepete eklendi"),
                            ),
                          );
                        },
                        child: const Text("Sepete Ekle"),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}