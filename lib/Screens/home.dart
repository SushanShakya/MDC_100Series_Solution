import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:mdc_102/Models/product.dart';
import 'package:mdc_102/Models/product_repository.dart';

class Home extends StatelessWidget {
  List<Card> _buildGridCards(BuildContext context) {
    List<Product> products = ProductsRepository.loadProducts(Category.all);

    if (products == null || products.isEmpty) return const <Card>[];

    final ThemeData theme = Theme.of(context);

    final NumberFormat formatter = NumberFormat.simpleCurrency(
        locale: Localizations.localeOf(context).toString());

    return products
        .map((product) => Card(
              clipBehavior: Clip.antiAlias,
              child: Column(
                children: [
                  AspectRatio(
                    aspectRatio: 18.0 / 11.0,
                    child: Image.asset(
                      product.assetName,
                      package: product.assetPackage,
                      // "assets/diamond.png",
                      // fit: BoxFit.fitWidth,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(16.0, 12.0, 16.0, 8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          product.name,
                          maxLines: 1,
                          style: theme.textTheme.headline6,
                        ),
                        SizedBox(
                          height: 8.0,
                        ),
                        Text(
                          formatter.format(product.price),
                          style: theme.textTheme.subtitle2,
                        )
                      ],
                    ),
                  )
                ],
              ),
            ))
        .toList();
  }

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
      body: GridView.count(
        crossAxisCount: 2,
        padding: EdgeInsets.all(16.0),
        childAspectRatio: 8.0 / 9.0,
        children: _buildGridCards(context),
      ),
    );
  }
}
