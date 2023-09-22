
import 'package:flutter/material.dart';



class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
 // List<String> items = List.generate(50, (index) => faker.food.dish());
 List<String> items = ["Somesh","Mesh","fdlkgk","dd","fdlgfdl","dlsdll", "slssldl","cssclldsld","hello","how", "who", "backup"];
  List<String> filteredItems = [];
  String _query = '';

  void search(String query) {
    setState(
          () {
        _query = query;

        filteredItems = items
            .where(
              (item) => item.toLowerCase().contains(
            query.toLowerCase(),
          ),
        )
            .toList();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: TextField(
          style: const TextStyle(color: Colors.white),
          onChanged: (value) {
            search(value);
          },
          decoration: const InputDecoration(
            hintText: 'Search...',
            hintStyle: TextStyle(color: Colors.white),
            fillColor: Colors.white,
            prefixIcon: Icon(
              Icons.search,
              color: Colors.white,
            ),
          ),
        ),
      ),
      body: filteredItems.isNotEmpty || _query.isNotEmpty
          ? filteredItems.isEmpty
          ? const Center(
        child: Text(
          'No Results Found',
          style: TextStyle(fontSize: 18),
        ),
      )
          : ListView.builder(
        itemCount: filteredItems.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(filteredItems[index]),
          );
        },
      )
          : ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(items[index]),
          );
        },
      ),
    );
  }
}