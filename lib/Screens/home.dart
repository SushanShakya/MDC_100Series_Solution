import 'package:flutter/material.dart';
import 'package:mdc_102/Models/product.dart';
import 'package:mdc_102/Models/product_repository.dart';
import 'package:mdc_102/Supplementary/asymmetric_view.dart';

class Home extends StatefulWidget {
  final Category category;

  const Home({Key key, this.category = Category.all}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return AsymmetricView(
      products: ProductsRepository.loadProducts(widget.category),
    );
  }
}
