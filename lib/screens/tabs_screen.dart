import 'package:flutter/material.dart';
import 'package:meals_app/screens/favourites.dart';
import 'package:meals_app/widgets/main_drawer.dart';
import '../model/meal.dart';
import './categories_screen.dart';

class TabScreen extends StatefulWidget {
  final List<Meal> favouriteMeals;

  const TabScreen(this.favouriteMeals, {Key? key}) : super(key: key);

  @override
  State<TabScreen> createState() => _TabScreenState();
}

class _TabScreenState extends State<TabScreen> {
  List<Map<String, dynamic>> pages = [];
  int selectedPageIndex = 0;

  @override
  void initState() {
    pages = [
      {'page': const CategoryScreens(), 'title': 'Categories'},
      {'page': FavouriteScreen(widget.favouriteMeals), 'title': 'Favourites'}
    ];
    super.initState();
  }

  void _selectPage(int index) {
    setState(() {
      selectedPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(pages[selectedPageIndex]['title'].toString()),
      ),
      body: pages[selectedPageIndex]['page'],
      drawer: MainDrawer(),
      bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Colors.black12,
          unselectedItemColor: Colors.black,
          selectedItemColor: Colors.white,
          currentIndex: selectedPageIndex,
          onTap: _selectPage,
          items: [
            BottomNavigationBarItem(
                icon: Icon(Icons.category), label: 'Categories'),
            BottomNavigationBarItem(
                icon: Icon(Icons.favorite), label: 'Favourites'),
          ]),
    );
  }
}
