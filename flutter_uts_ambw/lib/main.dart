import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_uts_ambw/category.dart';
import 'package:flutter_uts_ambw/food.dart';
import 'package:flutter_uts_ambw/restaurant.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatefulWidget {
  const MainApp({Key? key}) : super(key: key);

  @override
  State createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  int _selectedIndex = 0; // Define the selected index
  Color originalColor = Colors.blue; // Define the original color

  final List<Widget> _pages = [
    // Replace with your actual screen widgets
    HomeScreen(),
    DiscoveryScreen(),
    BookmarkScreen(),
    TopFoodieScreen(),
    ProfileScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          leading: Icon(Icons.menu),
          title: Text('Sydney CBD'),
        ),
        body: _pages[_selectedIndex],
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          currentIndex: _selectedIndex,
          unselectedItemColor: Colors.grey,
          selectedItemColor: originalColor,
          onTap: _onItemTapped,
          items: const [
            BottomNavigationBarItem(
              label: "Home",
              icon: Icon(Icons.home_outlined, size: 35),
            ),
            BottomNavigationBarItem(
              label: "Discovery",
              icon: Icon(Icons.fmd_good_outlined, size: 35),
            ),
            BottomNavigationBarItem(
              label: "Bookmark",
              icon: Icon(Icons.bookmark_outline, size: 35),
            ),
            BottomNavigationBarItem(
              label: "Top Foodie",
              icon: Icon(Icons.favorite_outline_outlined, size: 35),
            ),
            BottomNavigationBarItem(
              label: "Profile",
              icon: Icon(Icons.person, size: 35),
            ),
          ],
          unselectedFontSize: 12.0,
          selectedFontSize: 12.0,
        ),
      ),
    );
  }
}

// Replace the following with your actual screen widgets
class HomeScreen extends StatelessWidget {
  List<Category> foodStyle = [
    Category(
        image: 'https://via.placeholder.com/300',
        name: 'Category 1',
        style: 'Style 1'),
    Category(
        image: 'https://via.placeholder.com/300',
        name: 'Category 2',
        style: 'Style 2'),
    Category(
        image: 'https://via.placeholder.com/300',
        name: 'Category 3',
        style: 'Style 3'),
    Category(
        image: 'https://via.placeholder.com/300',
        name: 'Category 4',
        style: 'Style 4'),
  ];
  List<Food> mealDeals = [
    Food(image: 'https://via.placeholder.com/300', name: 'Food 1', price: 10.0),
    Food(image: 'https://via.placeholder.com/300', name: 'Food 2', price: 20.0),
    Food(image: 'https://via.placeholder.com/300', name: 'Food 3', price: 30.0),
    Food(image: 'https://via.placeholder.com/300', name: 'Food 4', price: 40.0),
    Food(image: 'https://via.placeholder.com/300', name: 'Food 3', price: 30.0),
    Food(image: 'https://via.placeholder.com/300', name: 'Food 4', price: 40.0),
    Food(image: 'https://via.placeholder.com/300', name: 'Food 3', price: 30.0),
    Food(image: 'https://via.placeholder.com/300', name: 'Food 4', price: 40.0),
  ];
  List<Restaurant> mostPopular = [
    Restaurant(
        image: 'https://via.placeholder.com/300',
        name: 'Restaurant 1',
        location: 'Location 1',
        cuisineType: 'Cuisine 1'),
    Restaurant(
        image: 'https://via.placeholder.com/300',
        name: 'Restaurant 2',
        location: 'Location 2',
        cuisineType: 'Cuisine 2'),
    Restaurant(
        image: 'https://via.placeholder.com/300',
        name: 'Restaurant 3',
        location: 'Location 3',
        cuisineType: 'Cuisine 3'),
    Restaurant(
        image: 'https://via.placeholder.com/300',
        name: 'Restaurant 4',
        location: 'Location 4',
        cuisineType: 'Cuisine 4'),
    Restaurant(
        image: 'https://via.placeholder.com/300',
        name: 'Restaurant 3',
        location: 'Location 3',
        cuisineType: 'Cuisine 3'),
    Restaurant(
        image: 'https://via.placeholder.com/300',
        name: 'Restaurant 4',
        location: 'Location 4',
        cuisineType: 'Cuisine 4'),
    Restaurant(
        image: 'https://via.placeholder.com/300',
        name: 'Restaurant 3',
        location: 'Location 3',
        cuisineType: 'Cuisine 3'),
    Restaurant(
        image: 'https://via.placeholder.com/300',
        name: 'Restaurant 3',
        location: 'Location 3',
        cuisineType: 'Cuisine 3'),
  ];
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: TextField(
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12.0),
                ),
                labelText: 'Search for Restaurants',
              ),
            ),
          ),
          ImageCarousel(
            categories: foodStyle,
          ),
          buildListView(context, 'Most Popular', mostPopular, Axis.horizontal,
              false, MediaQuery.of(context).size.height * 0.2),
          SizedBox(height: 20.0),
          buildListView(context, 'Meal Deals', mealDeals, Axis.horizontal,
              false, MediaQuery.of(context).size.height * 0.2),
        ],
      ),
    );
  }
}

// Food Style Carousel
class ImageCarousel extends StatefulWidget {
  final List<Category> categories;

  ImageCarousel({required this.categories});

  @override
  _ImageCarouselState createState() => _ImageCarouselState();
}

class _ImageCarouselState extends State<ImageCarousel> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CarouselSlider(
          options: CarouselOptions(
            height: 250.0,
            enlargeCenterPage: true,
            aspectRatio: 16 / 9,
            autoPlayCurve: Curves.fastOutSlowIn,
            viewportFraction: 0.8,
            enableInfiniteScroll: false,
            autoPlay: true,
            onPageChanged: (index, reason) {
              setState(() {
                _currentIndex = index;
              });
            },
          ),
          items: widget.categories.map((category) {
            return Builder(
              builder: (BuildContext context) {
                return Container(
                  width: MediaQuery.of(context).size.width,
                  margin: EdgeInsets.symmetric(horizontal: 5.0),
                  decoration: BoxDecoration(
                    color: Colors.grey,
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.network(
                        category.image,
                        height: 100.0,
                        width: 160.0,
                        fit: BoxFit.cover,
                      ),
                      SizedBox(height: 8.0),
                      Text(
                        category.name,
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Text(
                        category.style,
                        style: TextStyle(color: Colors.grey),
                      ),
                    ],
                  ),
                );
              },
            );
          }).toList(),
        ),
        // Dots indicator
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(widget.categories.length, (index) {
            return Container(
              width: 8.0,
              height: 8.0,
              margin: EdgeInsets.symmetric(horizontal: 4.0),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: _currentIndex == index ? Colors.blue : Colors.grey,
              ),
            );
          }),
        ),
      ],
    );
  }
}

// List View Most Popular + Meal Deals
Widget buildListView(BuildContext context, String title, List<dynamic> data,
    Axis scrollDirection, bool isDetailsPage, double height) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      if (isDetailsPage == false)
        Row(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Text(
                title,
                style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
              ),
            ),
            const Spacer(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: TextButton(
                onPressed: () {
                  // Navigate to the details page
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => DetailsPage(
                        data: data, // Pass your data here
                        title: title,
                      ),
                    ),
                  );
                },
                child: const Text(
                  'See All',
                  style: TextStyle(color: Colors.blue),
                ),
              ),
            ),
          ],
        ),
      Container(
        height: height,
        child: ListView.builder(
          scrollDirection: scrollDirection,
          itemCount: data.length,
          itemBuilder: (context, index) {
            if (data[index] is Restaurant) {
              return buildMostPopularCard(data[index]);
            } else if (data[index] is Food) {
              return buildMealDealsCard(data[index]);
            }
            return Container(); // Handle other types (if needed)
          },
        ),
      ),
    ],
  );
}

Widget buildMealDealsCard(dynamic item) {
  return Container(
    width: 160.0,
    margin: EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
    decoration: BoxDecoration(
      color: Colors.grey[200],
      borderRadius: BorderRadius.circular(8.0),
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Image.network(
          item.image,
          height: 100.0,
          width: 160.0,
          fit: BoxFit.cover,
        ),
        SizedBox(height: 12.0), // Add vertical spacing
        Text(
          item.name,
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 4.0), // Add more vertical spacing
        Text(
          'Price: \$${item.price.toStringAsFixed(2)}',
          style: TextStyle(color: Colors.grey),
        ),
      ],
    ),
  );
}

Widget buildMostPopularCard(Restaurant restaurant) {
  return Container(
    width: 160.0,
    margin: EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
    decoration: BoxDecoration(
      color: Colors.grey[200],
      borderRadius: BorderRadius.circular(8.0),
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.vertical(top: Radius.circular(8.0)),
          child: Image.network(
            restaurant.image,
            height: 100.0,
            width: 160.0,
            fit: BoxFit.cover,
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                restaurant.name,
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Text(
                restaurant.location,
                style: TextStyle(color: Colors.grey),
              ),
              Text(
                restaurant.cuisineType,
                style: TextStyle(color: Colors.grey),
              ),
            ],
          ),
        ),
      ],
    ),
  );
}

class DetailsPage extends StatelessWidget {
  final List<dynamic> data;
  final String title;

  DetailsPage({required this.data, required this.title});
//           buildListView('Most Popular', mostPopular, Axis.vertical),

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: buildListView(context, title, data, Axis.vertical, true,
            MediaQuery.of(context).size.height * 0.85),
      ),
    );
  }
}

class DiscoveryScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(child: Text('Discovery Screen'));
  }
}

class BookmarkScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(child: Text('Bookmark Screen'));
  }
}

class TopFoodieScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(child: Text('Top Foodie Screen'));
  }
}

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(child: Text('Profile Screen'));
  }
}
