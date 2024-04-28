import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/widgets.dart';
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
  Color originalColor = Colors.amber; // Define the original color

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
      debugShowCheckedModeBanner:
          false, // Set to false to remove the debug banner

      home: Scaffold(
        appBar: AppBar(
          leading: const Icon(Icons.menu, color: Colors.amber),
          title: const Text('Sydney CBD'),
        ),
        drawer: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: const <Widget>[
              DrawerHeader(
                decoration: BoxDecoration(
                  color: Colors.amber,
                ),
                child: Text('Sydney CBD'),
              ),
              ListTile(
                leading: Icon(Icons.home_outlined),
                title: Text('Home'),
              ),
              ListTile(
                leading: Icon(Icons.fmd_good_outlined),
                title: Text('Discovery'),
              ),
              ListTile(
                leading: Icon(Icons.bookmark_outline),
                title: Text('Bookmark'),
              ),
              ListTile(
                leading: Icon(Icons.favorite_outline_outlined),
                title: Text('Top Foodie'),
              ),
              ListTile(
                leading: Icon(Icons.person),
                title: Text('Profile'),
              ),
            ],
          ),
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
        image: 'https://asianinspirations.com.au/wp-content/uploads/2018/07/R00067_Tom-Yum-Goong.jpg',
        name: 'Tom Yum Goong',
        style: 'Thai'),
    Category(
        image: 'https://cdn0-production-images-kly.akamaized.net/i1CKcu1ErcEIdJegAf--eDxiygE=/0x0:1000x563/1200x675/filters:quality(75):strip_icc():format(jpeg)/kly-media-production/medias/4518333/original/007291800_1690604915-shutterstock_1940048218.jpg',
        name: 'Pasta Carbonara',
        style: 'Italian'),
    Category(
        image: 'https://cdn0-production-images-kly.akamaized.net/jAhRHll_RQBlFGXC18vg2VpRWZ0=/0x120:3000x1811/1200x675/filters:quality(75):strip_icc():format(jpeg)/kly-media-production/medias/3282059/original/075075700_1604028408-shutterstock_1788721670.jpg',
        name: 'Kari Rendang',
        style: 'Indonesian'),
    Category(
        image: 'https://media-cdn.tripadvisor.com/media/photo-s/1c/7a/c2/86/maki-roll-set-40-piece.jpg',
        name: 'Sushi',
        style: 'Japanese'),
  ];
  List<Food> mealDeals = [
    Food(
        image: 'https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEjFbK-PsTUcOTt7ef22buzJBjaFqRSz48TZFZYaYqjKfunrc-Qfbf2_GcosMWiwdy9Aa5yA9utzIb1dgN69LlPdXCwO3KIasxdpH_0KM4YBpGhUa_zV8H4QF8lDzVzc1diUPZkGb2l0-E2P5IR2qW8u1hPJCwzRDJh-vjLr6tQYqiIipOvotaepHPvFQw/s2084/K-Cheese%20For%20Media-01.jpg',
        name: 'Shin Tae Yong Deal',
        price: 10.0),
    Food(
        image: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT6q7p51I-EeJ3YxRjymo2s0HR_C9XAZz7CkqW4FY_SBQ&s',
        name: 'Pizza Heart Deal',
        price: 20.0),
    Food(
        image: 'https://ayamkeprabon.com/data/foto_berita/paket%20geprek%20jumbo%20matah.jpg',
        name: 'Geprek Jumbo Hemat',
        price: 30.0),
    Food(
        image: 'https://weelicious.com/wp-content/uploads/2009/04/Chicken-Meatballs-with-Mini-Wheel-Pasta-7.jpg',
        name: 'Pasta Mini',
        price: 40.0),
    Food(
        image: 'https://mcdonaldsblog.in/wp-content/uploads/2021/12/Cheer-on-with-McDonalds-match-party-company.jpg',
        name: 'U-23 Deal',
        price: 30.0),
    Food(
        image: 'https://cdn1.clickthecity.com/wp-content/uploads/2023/04/12104439/McDonalds-McNuggets-Meal-Meets-BT21-is-here-starting-April-15-1024x1024.jpg',
        name: 'BT21 Combo',
        price: 40.0),
    Food(image: 'https://images.immediate.co.uk/production/volatile/sites/30/2022/08/Corndogs-7832ef6.jpg?quality=90&resize=556,505', name: 'Food X', price: 30.0),
    Food(image: 'https://food.fnr.sndimg.com/content/dam/images/food/fullset/2016/6/12/3/FNM070116_Penne-with-Vodka-Sauce-and-Mini-Meatballs-recipe_s4x3.jpg.rend.hgtvcom.1280.1280.suffix/1465939620872.jpeg', name: 'Food Z', price: 40.0),
  ];
  List<Restaurant> mostPopular = [
    Restaurant(
        image:
            'https://lh3.googleusercontent.com/p/AF1QipN9oFAOgxXrcw32AEBhhuI8uKUdjRTFb-NesdYd=s1360-w1360-h1020',
        name: 'KFC',
        location: 'Location 1',
        cuisineType: 'Fast Food Style'),
    Restaurant(
        image:
            'https://lh3.googleusercontent.com/p/AF1QipM3kQJsJqagoyAa_62uLwD9V0fCneuYVQqG_Ebp=s1360-w1360-h1020',
        name: 'McDonalds\nPlaza',
        location: 'Location 2',
        cuisineType: 'Fast Food Style'),
    Restaurant(
        image:
            'https://lh3.googleusercontent.com/p/AF1QipOpeLJ95njmERBwIETyBEwmFuLYszoA3y5wK2Ea=s1360-w1360-h1020',
        name: 'PizzaHut\nRistorante',
        location: 'Location 3',
        cuisineType: 'Fast Food Style'),
    Restaurant(
        image:
            'https://salsawisata.com/wp-content/uploads/2023/11/restoran-layar-seafood-surabaya.webp',
        name: 'Layar Seafood',
        location: 'Jl. KH Abdul',
        cuisineType: 'Sea Food Style'),
    Restaurant(
        image:
            'https://surabayarek.com/wp-content/uploads/2015/10/Resto-Bodaeng-Thai-Surabaya.jpg',
        name: 'Bodaeng Thai',
        location: 'Jl. Embong Kenongo',
        cuisineType: 'Thai Style'),
    Restaurant(
        image:
            'https://media-cdn.tripadvisor.com/media/photo-s/17/cd/25/88/20190428-215814-largejpg.jpg',
        name: 'Sansekerta',
        location: 'Jl. Walikota Mustajab',
        cuisineType: 'Indonesian Style'),
    Restaurant(
        image:
            'https://media-cdn.tripadvisor.com/media/photo-s/19/73/8c/2e/sapore-osteria.jpg',
        name: 'Sapore Osteria',
        location: 'Jl. Mayjen Sungkono ',
        cuisineType: 'Italian Style'),
    Restaurant(
        image:
            'https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEidZEm0GUlay9ru4IJ3dOk8FjgQy3K99enYVfbvfGnasspbp_CeKsOeeFuknMzJLsYosjEXQBAdFzRl2e2A93gPtJNnjtGSCvUu1CiJAEnCoeQGL63gwTPHN-6AnTARl_l1CGhzGaM65t5B/s1600/IMG_8892.JPG',
        name: 'Spago Boulangerie',
        location: 'Jl. Niaga Gapura',
        cuisineType: 'Italian Style'),
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
              false, MediaQuery.of(context).size.height * 0.2215),
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
    return Container(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1), // Shadow color
            spreadRadius: 2, // Spread radius
            blurRadius: 4, // Blur radius
            offset: const Offset(0, 2), // Shadow offset (x, y)
          ),
        ],
      ),
      child: Stack(
        children: [
          CarouselSlider(
            options: CarouselOptions(
              enlargeCenterPage: false,
              viewportFraction: 1.0, // Full screen width
              enableInfiniteScroll: false,
              autoPlay: false,
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
                    height: MediaQuery.of(context).size.height *
                        0.3, // Adjust the height as needed
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          height: MediaQuery.of(context).size.height *
                              0.26, // Adjust the height as needed
                          child: Stack(
                            children: [
                              ClipRRect(
                                child: Image.network(
                                  category.image,
                                  width: MediaQuery.of(context).size.width,
                                  fit: BoxFit
                                      .cover, // Ensure the image covers the container
                                ),
                              ),
                              Container(
                                decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                    begin: Alignment.bottomCenter,
                                    end: Alignment.topCenter,
                                    colors: [
                                      Colors.black.withOpacity(0.2),
                                      Colors.transparent,
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                },
              );
            }).toList(),
          ),

          // Text
          Positioned(
            top: 205.0,
            left: 16.0,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.categories[_currentIndex].name,
                  style: const TextStyle(fontWeight: FontWeight.bold,color: Colors.white),
                ),
                Text(
                  widget.categories[_currentIndex].style,
                  style: const TextStyle(color: Colors.white),
                ),
              ],
            ),
          ),

          // Dots indicator
          Positioned(
            bottom: 16.0,
            left: 340.0,
            right: 0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(widget.categories.length, (index) {
                return Container(
                  width: 8.0,
                  height: 8.0,
                  margin: const EdgeInsets.symmetric(horizontal: 4.0),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: _currentIndex == index
                        ? const Color.fromARGB(255, 0, 0, 0)
                        : Colors.grey,
                  ),
                );
              }),
            ),
          ),
        ],
      ),
    );
  }
}

// List View Most Popular + Meal Deals
Widget buildListView(BuildContext context, String title, List<dynamic> data,
    Axis scrollDirection, bool isDetailsPage, double height) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    mainAxisSize: MainAxisSize.min,
    children: [
      if (isDetailsPage == false)
        Row(
          mainAxisSize: MainAxisSize.min,
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
    width: 200.0,
    margin: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
    decoration: BoxDecoration(
      color: Colors.grey[200],
      borderRadius: BorderRadius.circular(12.0),
      border: Border.all(
        width: 2,
      ),
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Stack(children: [
          ClipRRect(
            borderRadius:
                const BorderRadius.vertical(top: Radius.circular(12.0)),
            child: Image.network(
              item.image,
              height: 109.5,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          Positioned(
            top: 8.0,
            right: 8.0,
            child: Container(
              padding:
                  const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
              decoration: BoxDecoration(
                color: Colors.red,
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: const Row(
                children: [
                  Icon(
                    Icons.favorite,
                    color: Colors.white,
                    size: 16.0,
                  ),
                  SizedBox(width: 4.0),
                  Text(
                    'Hot', // Customize the badge text
                    style: TextStyle(color: Colors.white),
                  ),
                ],
              ),
            ),
          ),
        ]),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text(
              item.name,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            Text(
              'Price: \$${item.price.toStringAsFixed(2)}',
              style: const TextStyle(color: Colors.grey),
            ),
          ]),
        ),
      ],
    ),
  );
}

Widget buildMostPopularCard(Restaurant restaurant) {
  return Container(
    width: 300.0,
    height: 200.0,
    margin: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
    decoration: BoxDecoration(
      color: Colors.grey[200],
      borderRadius: BorderRadius.circular(12.0),
      border: Border.all(
        width: 2,
      ),
    ),
    child: LayoutBuilder(
      builder: (context, constraints) {
        double leftPadding =
            constraints.maxWidth * 0.05; // 4% of container's width
        double topPadding =
            constraints.maxHeight * 0.75; // 54% of container's height

        return Stack(
          children: [
            ClipRRect(
              borderRadius:
                  const BorderRadius.vertical(top: Radius.circular(12.0)),
              child: Image.network(
                restaurant.image,
                width: double.infinity, // Use the container's width
                height: 140.0,
                fit: BoxFit.cover, // Ensure the image covers the container
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: leftPadding, top: topPadding),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Text(
                      restaurant.name,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16.2,
                      ),
                    ),
                  ),
                  SizedBox(height: 4.0),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          restaurant.location,
                          style: const TextStyle(color: Colors.grey),
                        ),
                        Text(
                          restaurant.cuisineType,
                          style: const TextStyle(color: Colors.grey),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        );
      },
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
    return const Center(child: Text('Discovery Screen'));
  }
}

class BookmarkScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const Center(child: Text('Bookmark Screen'));
  }
}

class TopFoodieScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const Center(child: Text('Top Foodie Screen'));
  }
}

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const Center(child: Text('Profile Screen'));
  }
}
