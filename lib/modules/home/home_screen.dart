import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:product/util_constant/size_config.dart';
import '../product_detail/product_detail_screen.dart';

import '../../util_constant/color_constants.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<String> _bannerImages = [
    'assets/images/image 742.png',
    'assets/images/image 742.png',
    'assets/images/image 742.png',
  ];

  final List<Map<String, String>> _categories = [
    {'title': 'Unpolished\nPulses', 'image': 'assets/images/category.png'},
    {'title': 'Unpolished\nRice', 'image': 'assets/images/category.png'},
    {'title': 'Unpolished\nMillets', 'image': 'assets/images/category.png'},
    {'title': 'Nuts & Dry\nFruits', 'image': 'assets/images/category.png'},
    {'title': 'Nuts & Dry\nFruits', 'image': 'assets/images/category.png'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstants.scaffoldBackgroundColor,
      appBar: AppBar(
        backgroundColor:
            ColorConstants.buttonColor, // User requested button color
        elevation: 0,
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Image.asset(
            'assets/images/logo.png',
            fit: BoxFit.contain,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.search, color: Colors.white),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.favorite_border, color: Colors.white),
          ),
          Stack(
            children: [
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.notifications_outlined,
                    color: Colors.white),
              ),
              Positioned(
                right: 12,
                top: 12,
                child: Container(
                  height: 8,
                  width: 8,
                  decoration: const BoxDecoration(
                    color: Colors.red,
                    shape: BoxShape.circle,
                  ),
                ),
              )
            ],
          ),
          const SizedBox(width: 8),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 16),
            // Carousel Banner
            _buildCarouselSlider(),
            const SizedBox(height: 24),

            // Categories
            _buildSectionHeader('Categories', showArrows: true),
            const SizedBox(height: 16),
            _buildCategories(context),
            const SizedBox(height: 24),

            // Featured Products
            _buildSectionHeader('Featured Products', showArrows: true),
            const SizedBox(height: 16),
            _buildProductList(),
            const SizedBox(height: 24),

            // Daily Best Selling
            _buildSectionHeader('Daily Best Selling', showArrows: true),
            const SizedBox(height: 16),
            _buildProductList(),
            const SizedBox(height: 24),

            // Middle Banner
            Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  margin: const EdgeInsets.symmetric(horizontal: 5.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Color.fromARGB(255, 199, 106, 216).withOpacity(0.5),
                    // Solid Orange Base
                  ),
                  child: Stack(
                    children: [
                      // Gradient Overlay (optional, for subtle effect)
                      Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            gradient: LinearGradient(
                                begin: Alignment.centerLeft,
                                end: Alignment.centerRight,
                                colors: [
                                  Colors.purple,
                                  Colors.deepPurpleAccent,
                                ])),
                      ),
                      // Content
                      Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Row(
                          children: [
                            // Left Text Content
                            Expanded(
                              flex: 3,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const Text(
                                    'Hurry Up! Get 10% Off',
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 14),
                                  ),
                                  // const SizedBox(height: 1),
                                  const Text(
                                    'Power Your Day\nwith Nuts & Dry Fruits',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 18, // Slightly smaller to fit
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  const SizedBox(height: 2),
                                  ElevatedButton(
                                    onPressed: () {},
                                    style: ElevatedButton.styleFrom(
                                        backgroundColor: Colors.white,
                                        foregroundColor: Colors.orange,
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(20),
                                        ),
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 20, vertical: 5)),
                                    child: const Text('Shop Now'),
                                  )
                                ],
                              ),
                            ),
                            // Right Image
                            Expanded(
                              flex: 2,
                              child: Image.asset(
                                'assets/images/image 742.png',
                                fit: BoxFit.contain,
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                )),
            const SizedBox(height: 24),

            // Recently Added
            _buildSectionHeader('Recently Added', showArrows: true),
            const SizedBox(height: 16),
            _buildProductList(),
            const SizedBox(height: 24),

            // Popular Products
            _buildSectionHeader('Popular Products', showArrows: true),
            const SizedBox(height: 16),
            _buildProductList(),
            const SizedBox(height: 24),

            // Trending Products
            _buildSectionHeader('Trending Products', showArrows: true),
            const SizedBox(height: 16),
            _buildProductList(),
            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }

  Widget _buildCarouselSlider() {
    return CarouselSlider(
      items: _bannerImages.map((imagePath) {
        return Builder(
          builder: (BuildContext context) {
            return Container(
              width: MediaQuery.of(context).size.width,
              margin: const EdgeInsets.symmetric(horizontal: 5.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: const Color.fromARGB(
                    255, 236, 152, 26), // Solid Orange Base
              ),
              child: Stack(
                children: [
                  // Gradient Overlay (optional, for subtle effect)
                  Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        gradient: LinearGradient(
                            begin: Alignment.centerLeft,
                            end: Alignment.centerRight,
                            colors: [
                              Colors.orange,
                              const Color.fromARGB(255, 221, 154, 53)
                                  .withOpacity(0.8),
                            ])),
                  ),
                  // Content
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Row(
                      children: [
                        // Left Text Content
                        Expanded(
                          flex: 3,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text(
                                'Hurry Up! Get 10% Off',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 14),
                              ),
                              // const SizedBox(height: 1),
                              const Text(
                                'Go Natural with\nUnpolished Grains',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18, // Slightly smaller to fit
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(height: 2),
                              ElevatedButton(
                                onPressed: () {},
                                style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.white,
                                    foregroundColor: Colors.orange,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 20, vertical: 5)),
                                child: const Text('Shop Now'),
                              )
                            ],
                          ),
                        ),
                        // Right Image
                        Expanded(
                          flex: 2,
                          child: Image.asset(
                            imagePath,
                            fit: BoxFit.contain,
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            );
          },
        );
      }).toList(),
      options: CarouselOptions(
        height: h * 0.2,
        autoPlay: true,
        enlargeCenterPage: true,
        viewportFraction: 0.9,
        aspectRatio: 16 / 9,
        initialPage: 0,
      ),
    );
  }

  Widget _buildSectionHeader(String title, {bool showArrows = false}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: ColorConstants
                  .buttonColor, // Using brown/button color for headers
            ),
          ),
          if (showArrows)
            Row(
              children: [
                Icon(Icons.chevron_left, color: Colors.grey[600]),
                const SizedBox(width: 8),
                Icon(Icons.chevron_right, color: Colors.grey[600]),
              ],
            )
        ],
      ),
    );
  }

  Widget _buildCategories(BuildContext context) {
    return SizedBox(
      height: 150,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        itemCount: _categories.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: Column(
              children: [
                CircleAvatar(
                  radius: 35,
                  backgroundColor: Colors.grey[200],
                  child: Image.asset(
                    _categories[index]['image']!,
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  _categories[index]['title']!,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                      fontSize: 12, fontWeight: FontWeight.w500),
                )
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _buildProductList() {
    // Placeholder product data
    return SizedBox(
      height: 280,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        itemCount: 4,
        itemBuilder: (context, index) {
          return _buildProductCard();
        },
      ),
    );
  }

  Widget _buildProductCard() {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const ProductDetailScreen()),
        );
      },
      child: Container(
        width: 160,
        margin: const EdgeInsets.only(right: 16),
        decoration: BoxDecoration(
          color: Colors.grey[50],
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.1),
              spreadRadius: 1,
              blurRadius: 5,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Stack(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.white, // Light background for image
                        borderRadius: const BorderRadius.vertical(
                            top: Radius.circular(12)),
                        image: const DecorationImage(
                          image: AssetImage(
                              'assets/images/image 742.png'), // Placeholder
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                    const Positioned(
                      top: 8,
                      right: 8,
                      child: Icon(Icons.favorite_border,
                          color: ColorConstants.buttonColor, size: 20),
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Unpolished Millets',
                      style: TextStyle(fontSize: 10, color: Colors.orange),
                    ),
                    const SizedBox(height: 4),
                    const Text(
                      'Black Eyed Peas-1kg',
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style:
                          TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 4),
                    Row(
                      children: [
                        const Text(
                          '₹ 99.00',
                          style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              color: ColorConstants.buttonColor),
                        ),
                        const SizedBox(width: 8),
                        Text(
                          '₹ 130.00',
                          style: TextStyle(
                            fontSize: 12,
                            decoration: TextDecoration.lineThrough,
                            color: Colors.grey[600],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 12),
                    Container(
                      height: h * 0.05,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: ColorConstants.white,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            'Add',
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              color: ColorConstants.buttonColor,
                            ),
                          ),
                          const SizedBox(width: 8),
                          Icon(
                            Icons.shopping_cart_outlined,
                            color: ColorConstants.buttonColor,
                            size: 20,
                          ),
                        ],
                      ),
                    )
                    // SizedBox(
                    // width: double.infinity,
                    // height: 36,
                    // child: OutlinedButton.icon(
                    // onPressed: () {},
                    // icon: const Icon(Icons.shopping_cart_outlined, size: 16),
                    // label: const Text('Add'),
                    // style: OutlinedButton.styleFrom(
                    //     foregroundColor: ColorConstants.buttonColor,
                    //     side: const BorderSide(
                    //         color: ColorConstants.buttonColor),
                    //     shape: RoundedRectangleBorder(
                    //         borderRadius: BorderRadius.circular(8))),
                    // ),
                    // )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
