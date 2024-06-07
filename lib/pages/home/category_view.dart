import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class CategoryView extends StatelessWidget {
  final dynamic category;

  CategoryView({required this.category});

  @override
  Widget build(BuildContext context) {
    if (category['SubCategories'] == null ||
        category['SubCategories'].isEmpty) {
      return Center(child: Text('No subcategories available'));
    }
    return ListView.builder(
      itemCount: category['SubCategories'].length,
      itemBuilder: (context, index) {
        final subCategory = category['SubCategories'][index];
        return Padding(
          padding: const EdgeInsets.only(top: 15, bottom: 15, left: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(subCategory['Name']),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: subCategory['Product'].map<Widget>((product) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          Stack(
                            children: [
                              Container(
                                height: 100,
                                width: 100,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10)
                                ),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(10),
                                  child: Image.network(
                                    product['ImageName'],
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: Colors.blue,
                                    borderRadius: BorderRadius.circular(10)
                                  ),

                                  height: 25,
                                  width: 45,
                                  child: Center(child: Text('${product['PriceCode']}')),
                                ),
                              ),
                            ],
                          ),
                          Container(
                            height: 80,
                            width: 100,
                            child: Text(product['Name']),
                          ),
                        ],
                      ),
                    );
                  }).toList(),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
