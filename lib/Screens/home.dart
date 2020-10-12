import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:mdc_102/Models/product.dart';
import 'package:mdc_102/Models/product_repository.dart';
import 'package:mdc_102/Supplementary/asymmetric_view.dart';

class Home extends StatelessWidget {
  // List<Card> _buildGridCards(BuildContext context) {
  //   List<Product> products = ProductsRepository.loadProducts(Category.all);

  //   if (products == null || products.isEmpty) return const <Card>[];

  //   final ThemeData theme = Theme.of(context);

  //   final NumberFormat formatter = NumberFormat.simpleCurrency(
  //       locale: Localizations.localeOf(context).toString());

  //   return products
  //       .map((product) => Card(
  //             elevation: 0.0,
  //             clipBehavior: Clip.antiAlias,
  //             child: Column(
  //               mainAxisAlignment: MainAxisAlignment.end,
  //               crossAxisAlignment: CrossAxisAlignment.center,
  //               children: [
  //                 AspectRatio(
  //                   aspectRatio: 18.0 / 11.0,
  //                   child: Image.asset(
  //                     // product.assetName,
  //                     // package: product.assetPackage,
  //                     "assets/diamond.png",
  //                     // fit: BoxFit.fitWidth,
  //                   ),
  //                 ),
  //                 Padding(
  //                   padding: EdgeInsets.fromLTRB(16.0, 12.0, 16.0, 8.0),
  //                   child: Column(
  //                     crossAxisAlignment: CrossAxisAlignment.center,
  //                     mainAxisAlignment: MainAxisAlignment.end,
  //                     children: [
  //                       Text(
  //                         product.name,
  //                         maxLines: 1,
  //                         softWrap: false,
  //                         style: theme.textTheme.button,
  //                       ),
  //                       SizedBox(
  //                         height: 8.0,
  //                       ),
  //                       Text(
  //                         formatter.format(product.price),
  //                         style: theme.textTheme.caption,
  //                       )
  //                     ],
  //                   ),
  //                 )
  //               ],
  //             ),
  //           ))
  //       .toList();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("shrine".toUpperCase()),
        leading: IconButton(
          icon: Icon(
            Icons.menu,
            semanticLabel: "menu",
          ),
          onPressed: () {
            print("Menu Button");
          },
        ),
        actions: [
          IconButton(
            icon: Icon(
              Icons.search,
              semanticLabel: "search",
            ),
            onPressed: () {
              print("Search Button");
            },
          ),
          IconButton(
            icon: Icon(
              Icons.tune,
              semanticLabel: "filter",
            ),
            onPressed: () {
              print("Filter Button");
            },
          ),
        ],
      ),
      body: AsymmetricView(
        products: ProductsRepository.loadProducts(Category.all),
      ),
    );
  }
}
