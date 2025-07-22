import 'dart:convert';

import 'package:first_application/model/catalog.dart';
import 'package:first_application/widget/item_widget.dart';
import 'package:first_application/widget/my_drawer.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    loadData();
    super.initState();
  }

  loadData() async {
    final catalogJson = await rootBundle.loadString(
      'assets/files/catalog.json',
    );
    final decodedData = await jsonDecode(catalogJson);
    final productsData = decodedData["products"];
    CatalogModel.items = List.from(
      productsData,
    ).map<Item>((item) => Item.fromMap(item)).toList();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Catelog App")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: (CatalogModel.items != null && CatalogModel.items!.isNotEmpty)
            ? GridView.builder(
                itemCount: CatalogModel.items!.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  mainAxisSpacing: 16,
                  crossAxisSpacing: 16,
                  crossAxisCount: 2,
                ),
                itemBuilder: (context, index) {
                  final item = CatalogModel.items?[index];
                  return Card(
                    clipBehavior: Clip.antiAlias,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: GridTile(
                      header: Text(item!.name),
                      child: Image.network(item!.image),
                      footer: Text(item.price.toString()),
                    ),
                  );
                },
              )
            : Center(child: CircularProgressIndicator()),
      ),
      drawer: MyDrawer(),
    );
  }
}
