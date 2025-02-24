import 'package:flutter/material.dart';

import 'designer_card.dart';


main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Home(),
    );
  }
}

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  
  final TextEditingController _searchController = TextEditingController();
  bool searchFocus = false;
  
  final List _categories = [
    {'name': 'Industrial Design'},
    {'name': 'Interior Design'},
    {'name': 'Graphic Design'},
  ];
  final List<Map<String,dynamic>> designers =[
    {
      'image': 'https://i.pinimg.com/736x/f0/e0/1c/f0e01ceff513a76372b29aad30f88b13.jpg',
      'rating': 4.7,
      'reviews': 99,
      'name': 'Tarik Ahmed',
      'experience': '3 years',
      'category': 'Interior Design',
      'isFavorite': true,
    },
    {
      'image': 'https://i.pinimg.com/736x/38/69/40/3869404b350b57481f9598f9ed36c37a.jpg',
      'rating': 4.8,
      'reviews': 55,
      'name': 'Tarik Ahmed',
      'experience': '3 years',
      'category': 'Interior Design',
      'isFavorite': false,
    },
    {
      'image': 'https://i.pinimg.com/736x/f0/e0/1c/f0e01ceff513a76372b29aad30f88b13.jpg',
      'rating': 4.5,
      'reviews': 99,
      'name': 'Tarik Ahmed',
      'experience': '3 years',
      'category': 'Interior Design',
      'isFavorite': true,
    },
    {
      'image': 'https://i.pinimg.com/736x/38/69/40/3869404b350b57481f9598f9ed36c37a.jpg',
      'rating': 4.1,
      'reviews': 99,
      'name': 'Tarik Ahmed',
      'experience': '3 years',
      'category': 'Interior Design',
      'isFavorite': false,
    },
    {
      'image': 'https://i.pinimg.com/736x/26/75/75/267575103089a2b77bae16c5e4f8c930.jpg',
      'rating': 4.1,
      'reviews': 99,
      'name': 'Tarik Ahmed',
      'experience': '3 years',
      'category': 'Interior Design',
      'isFavorite': false,
    },
    {
      'image': 'https://i.pinimg.com/736x/26/75/75/267575103089a2b77bae16c5e4f8c930.jpg',
      'rating': 4.1,
      'reviews': 99,
      'name': 'Tarik Ahmed',
      'experience': '3 years',
      'category': 'Interior Design',
      'isFavorite': false,
    },
  ];
  void toggleFavorite(int index) {
    setState(() {
      designers[index]['isFavorite'] = !designers[index]['isFavorite'];
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Good Afternoon",
                  style: TextStyle(fontSize: 13),
                ),
                Text(
                  "Tarik Lotfy",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
                ),
                Padding(
                  padding:
                  const EdgeInsets.symmetric(horizontal: 22.0, vertical: 20),
                  child: SearchBar(
                    controller: _searchController,
                    hintText: 'Search for designers, categories ...',
                    hintStyle: WidgetStatePropertyAll(
                        TextStyle(
                            fontSize: 12
                        ),
                    ),
                    autoFocus: searchFocus,
                    leading: const Icon(Icons.search,
                        color: Colors.black54, size: 30),
                    trailing: [
                      IconButton(
                        icon: const Icon(Icons.clear),
                        onPressed: () {
                          setState(() {
                            _searchController.clear();
                            searchFocus = false;
                          });
                        },
                      )
                    ],
                    onChanged: (value) => {},
                    elevation: WidgetStateProperty.all(4.0),
                    backgroundColor: WidgetStatePropertyAll(Color(0xFAF4FBFF)),
                  ),
                ),
                Text(
                  "Categories",
                  style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold
                  ),
                ),
                SizedBox(
                  height: 60,
                  child: ListView.builder(
                    itemCount: _categories.length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 4.0),
                        child: ChoiceChip(
                          label: Text(_categories[index]['name']),
                          selected: index == 1,
                          onSelected: (selected) {
                          },
                          shape:RoundedRectangleBorder(borderRadius: BorderRadius.circular(60)),
                        ),
                      );
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0,10,0,0),
                  child: Row(
                    children: [
                      Text(
                          'Top-Rated Designers',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 25,
                        ),
                      ),
                      SizedBox(
                        width: 75,
                      ),
                      TextButton(
                        onPressed: () {
            
                        },
                        style: TextButton.styleFrom(
                          padding: EdgeInsets.fromLTRB(0,0,0,0),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              'View All',
                              style: TextStyle(
                                color: Colors.blue,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Icon(
                              Icons.arrow_right_alt, // Arrow icon
                              color: Colors.blue,
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                Center(

                  child: SizedBox(
                    width: 300,
                    child: Divider(),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10.0),
                  child: GridView.builder(
                    itemCount: designers.length,
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 0.75,
                      crossAxisSpacing: 12,
                      mainAxisSpacing: 12,
                    ),
                    itemBuilder: (context, index) {
                      final designer = designers[index];
                      return DesignerCard(
                        image: designer['image'],
                        rating: designer['rating'],
                        reviews: designer['reviews'],
                        name: designer['name'],
                        experience: designer['experience'],
                        category: designer['category'],
                        isFavorite: designer['isFavorite'],
                        onFavoritePressed: () => toggleFavorite(index),
                      );
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(5.0,20,0,0),
                  child: Row(
                    children: [
                      Text(
                        'Similar Designers',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 25,
                        ),
                      ),
                      SizedBox(
                        width: 75,
                      ),
                      TextButton(
                        onPressed: () {

                        },
                        style: TextButton.styleFrom(
                          padding: EdgeInsets.fromLTRB(30,0,0,0),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              'View All',
                              style: TextStyle(
                                color: Colors.blue,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Icon(
                              Icons.arrow_right_alt, // Arrow icon
                              color: Colors.blue,
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                Center(
                  child: SizedBox(
                    width: 300,
                    child: Divider(),
                  ),
                ),
                GridView.builder(
                  itemCount: designers.length,
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 0.75,
                    crossAxisSpacing: 12,
                    mainAxisSpacing: 12,
                  ),
                  itemBuilder: (context, index) {
                    final designer = designers[index];
                    return DesignerCard(
                      image: designer['image'],
                      rating: designer['rating'],
                      reviews: designer['reviews'],
                      name: designer['name'],
                      experience: designer['experience'],
                      category: designer['category'],
                      isFavorite: designer['isFavorite'],
                      onFavoritePressed: () => toggleFavorite(index),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
