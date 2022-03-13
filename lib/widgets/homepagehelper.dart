import 'dart:convert';
import 'package:flutter/rendering.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/widgets.dart';
import 'package:milkman_application_4/providers/ProductsProvider.dart';
import 'package:milkman_application_4/model/Products.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../screens/navscreen/bottomna.dart';

class HomePageHelp extends StatefulWidget {
  const HomePageHelp({Key? key}) : super(key: key);

  @override
  State<HomePageHelp> createState() => _HomePageHelpState();
}

class _HomePageHelpState extends State<HomePageHelp> {
  @override
  void initState() {
    SchedulerBinding.instance!.addPostFrameCallback((_) {
      var provider = Provider.of<ProductsProvider>(context, listen: false);
      provider.loadProductsData(context);
      //default selected 1st
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<ProductsProvider>(
      builder: (context, provider, child) {
        return Scaffold(
          body: Container(
            width: double.maxFinite,
            height: double.maxFinite,
            child: Stack(children: [
              Positioned(
                left: 0,
                right: 0,
                child: Container(
                  width: double.maxFinite,
                  height: 260,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage("assets/banner.png"),
                        fit: BoxFit.cover),
                  ),
                ),
              ),
              Positioned(
                top: 230,
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: 700,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30),
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(top: 25, left: 25),
                        child: Text(
                          'Categories',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.blue,
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 25),
                        child: Container(
                          height: 65,
                          alignment: Alignment.center,
                          child: ListView.builder(
                            itemCount: provider.products?.data?.length ?? 0,
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context, index) {
                              var product = provider.products?.data?[index];
                              return InkWell(
                                  onTap: () {
                                    setState(() {
                                      provider.selectedIndex = index;
                                      if (!product!.isSelected) {
                                        provider.products?.data
                                            ?.forEach((element) {
                                          element.isSelected = false;
                                        });
                                        provider.products?.data?[index]
                                            .isSelected = true;
                                      }
                                    });
                                  },
                                  child: _categoryCard(product!));
                            },
                          ),
                        ),
                      ),
                      Padding(
                          padding: EdgeInsets.only(right: 20, left: 20),
                          child: Divider(thickness: 2)),
                      Padding(
                        padding: EdgeInsets.only(top: 5, left: 35),
                        child: Row(
                          children: [
                            Container(
                              height: 50,
                              width: 50,
                              decoration: BoxDecoration(
                                boxShadow: [
                                  BoxShadow(
                                      color: Colors.black26,
                                      blurRadius: 5,
                                      spreadRadius: 1),
                                ],
                                shape: BoxShape.rectangle,
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Align(
                                alignment: Alignment.center,
                                child: Icon(Icons.border_bottom_outlined),
                              ),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              'Result',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.blue,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 10),
                      Padding(
                        padding: EdgeInsets.only(left: 25),
                        child: Container(
                          height: 300,
                          alignment: Alignment.center,
                          child: ListView.builder(
                            itemCount: provider
                                    .products
                                    ?.data?[provider.selectedIndex]
                                    .products
                                    ?.length ??
                                0,
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context, index) {
                              var product = provider
                                  .products
                                  ?.data?[provider.selectedIndex]
                                  .products?[index];
                              return _productCard(product!);
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ]),
          ),
        );
      },
    );
  }

  Widget _categoryCard(Data product) {
    return Container(
      width: 120,
      padding: EdgeInsets.all(10),
      margin: EdgeInsets.all(10),
      decoration: BoxDecoration(
        shape: BoxShape.rectangle,
        color: product.isSelected
            ? Colors.amber
            : Theme.of(context).backgroundColor,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Align(alignment: Alignment.center, child: Text(product.category!)),
    );
  }

  Widget _productCard(Product product) {
    return Container(
      margin: EdgeInsets.all(5),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        children: [
          Container(
              height: 150,
              width: 150,
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                        color: Colors.black26, blurRadius: 5, spreadRadius: 1),
                  ]),
              child: ClipRRect(
                  borderRadius: BorderRadius.circular(30),
                  child: Image.network(product.img!))),
          SizedBox(height: 10),
          Container(
            decoration: BoxDecoration(
              shape: BoxShape.rectangle,
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Text(product.name!),
          ),
        ],
      ),
    );
  }
}
