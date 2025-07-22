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
    CatalogModel.items = List.from(productsData).map<Item>((item)=> Item.fromMap(item)).toList();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
   
    return Scaffold(
      appBar: AppBar(title: Text("Catelog App")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: (CatalogModel.items != null && CatalogModel.items!.isNotEmpty) ? ListView.builder(
          itemCount: CatalogModel.items?.length,
          itemBuilder: (context, index) =>
             ItemWidget(item: CatalogModel.items![index])
          
        ): Center(child: CircularProgressIndicator(),),
      ),
      drawer: MyDrawer(),
    );
  }
}
