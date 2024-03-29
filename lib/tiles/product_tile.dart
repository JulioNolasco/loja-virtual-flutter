import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:loja_virtual/Screens/category_screen.dart';
import 'package:loja_virtual/Screens/product_screen.dart';
import 'package:loja_virtual/datas/product_data.dart';

class ProductsTile extends StatelessWidget {
  final String type;
  final ProductData product;

  ProductsTile(this.type, this.product);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        Navigator.of(context).push(
            MaterialPageRoute(builder: (context)=>ProductScreen(product))
        );
      },
      child: Card(
          child: type == "grid"
              ? Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    AspectRatio(
                      aspectRatio: 0.8,
                      child: Image.network(
                        product.image[0],
                        fit: BoxFit.cover,
                      ),
                    ),
                    Expanded(
                      child: Container(
                        padding: EdgeInsets.all(8.0),
                        child: Column(
                          children: <Widget>[
                            Text(
                              product.title,
                              style: TextStyle(fontWeight: FontWeight.w500),
                            ),
                            Text(
                              "R\$ ${product.price.toStringAsFixed(2)}",
                              style: TextStyle(
                                  color: Theme.of(context).primaryColor,
                                  fontSize: 17.0,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                )
              : Row(
            children: <Widget>[
              Flexible(
                flex: 1,
                child: Image.network(
                  product.image[0],
                  fit: BoxFit.cover,
                  height: 250.0,
                ),
              ),
              Flexible(
                flex: 1,
                child: Container(
                  padding: EdgeInsets.all(8.0),
                  child: Column(

                    children: <Widget>[
                      Text(
                        product.title,
                        style: TextStyle(fontWeight: FontWeight.w500),
                      ),
                      Text(
                        "R\$ ${product.price.toStringAsFixed(2)}",
                        style: TextStyle(
                            color: Theme.of(context).primaryColor,
                            fontSize: 17.0,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
              )
            ],
          )),
    );
  }
}
