import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:product/util_constant/image_constants.dart';
import '../../util_constant/color_constants.dart';
import '../product_detail/productList.dart';
import '../product_detail/product_detail_screen.dart';

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
    {'title': 'Unpolished\nGrains', 'image': 'assets/images/category.png'},
  ];

  // Scroll controllers for each product list
  final ScrollController _featuredProductsController = ScrollController();
  final ScrollController _dailyBestSellingController = ScrollController();
  final ScrollController _recentlyAddedController = ScrollController();
  final ScrollController _popularProductsController = ScrollController();
  final ScrollController _trendingProductsController = ScrollController();

  // Scroll amount for arrow navigation
  final double _scrollAmount = 200;

  @override
  void dispose() {
    // Dispose all controllers to prevent memory leaks
    _featuredProductsController.dispose();
    _dailyBestSellingController.dispose();
    _recentlyAddedController.dispose();
    _popularProductsController.dispose();
    _trendingProductsController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final h = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: ColorConstants.scaffoldBackgroundColor,
      appBar: AppBar(
        backgroundColor: ColorConstants.buttonColor,
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
            icon: Image.asset(ImageConstants.search, color: Colors.white),
          ),
          IconButton(
            onPressed: () {},
            icon: Image.asset(ImageConstants.like, color: Colors.white),
          ),
          IconButton(
            onPressed: () {},
            icon: Image.asset(ImageConstants.notification, color: Colors.white),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 16),
            _buildCarouselSlider(h),
            const SizedBox(height: 24),

            _buildSectionHeader('Categories', showArrows: true),
            const SizedBox(height: 16),
            _buildCategories(context),
            const SizedBox(height: 24),

            _buildSectionHeader('Featured Products', showArrows: true),
            const SizedBox(height: 16),
            _buildProductList(
              controller: _featuredProductsController,
            ),
            const SizedBox(height: 24),

            _buildSectionHeader('Daily Best Selling', showArrows: true),
            const SizedBox(height: 16),
            _buildProductList(
              controller: _dailyBestSellingController,
            ),
            const SizedBox(height: 24),

            _buildMiddleBanner(),
            const SizedBox(height: 24),

            _buildSectionHeader('Recently Added', showArrows: true),
            const SizedBox(height: 16),
            _buildProductList(
              controller: _recentlyAddedController,
            ),
            const SizedBox(height: 24),

            _buildSectionHeader('Popular Products', showArrows: true),
            const SizedBox(height: 16),
            _buildProductList(
              controller: _popularProductsController,
            ),
            const SizedBox(height: 24),

            _buildSectionHeader('Trending Products', showArrows: true),
            const SizedBox(height: 16),
            _buildProductList(
              controller: _trendingProductsController,
            ),
            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }

  Widget _buildCarouselSlider(double h) {
    return CarouselSlider(
      items: _bannerImages.map((imagePath) {
        return Builder(
          builder: (BuildContext context) {
            return Container(
              width: MediaQuery.of(context).size.width,
              margin: const EdgeInsets.symmetric(horizontal: 5.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                gradient: const LinearGradient(
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                  colors: [
                    Color(0xFFFF9800),
                    Color(0xFFFFB74D),
                  ],
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Row(
                  children: [
                    Expanded(
                      flex: 3,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            'Hurry Up! Get 10% Off',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          const SizedBox(height: 4),
                          const Text(
                            'Go Natural with\nUnpolished Grains',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              height: 1.2,
                            ),
                          ),
                          const SizedBox(height: 8),
                          ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.white,
                              foregroundColor: Colors.orange,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                              padding: const EdgeInsets.symmetric(
                                horizontal: 20,
                                vertical: 8,
                              ),
                              elevation: 0,
                            ),
                            child: const Text(
                              'Shop Now',
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    Expanded(
                      flex: 2,
                      child: Image.asset(
                        imagePath,
                        fit: BoxFit.contain,
                      ),
                    ),
                  ],
                ),
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

  Widget _buildMiddleBanner() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          gradient: const LinearGradient(
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
            colors: [
              Color(0xFF9C27B0),
              Color(0xFFAB47BC),
            ],
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Row(
            children: [
              Expanded(
                flex: 3,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'Hurry Up! Get 10% Off',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(height: 4),
                    const Text(
                      'Power Your Day\nwith Nuts & Dry Fruits',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        height: 1.2,
                      ),
                    ),
                    const SizedBox(height: 8),
                    ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                        foregroundColor: Colors.purple,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        padding: const EdgeInsets.symmetric(
                          horizontal: 20,
                          vertical: 8,
                        ),
                        elevation: 0,
                      ),
                      child: const Text(
                        'Shop Now',
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Expanded(
                flex: 2,
                child: Image.asset(
                  'assets/images/image 742.png',
                  fit: BoxFit.contain,
                ),
              ),
            ],
          ),
        ),
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
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: ColorConstants.buttonColor,
            ),
          ),
          if (showArrows)
            Row(
              children: [
                // Left arrow
                GestureDetector(
                  onTap: () {
                    _scrollListLeft(title);
                  },
                  child: Container(
                    padding: const EdgeInsets.all(4),
                    // decoration: BoxDecoration(
                    //   shape: BoxShape.circle,
                    //   color: Colors.grey[200],
                    // ),
                    child: Icon(
                      Icons.chevron_left,
                      color: Colors.grey[600],
                      size: 20,
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                // Right arrow
                GestureDetector(
                  onTap: () {
                    _scrollListRight(title);
                  },
                  child: Container(
                    padding: const EdgeInsets.all(4),
                    // decoration: BoxDecoration(
                    //   shape: BoxShape.circle,
                    //   color: Colors.grey[200],
                    // ),
                    child: Icon(
                      Icons.chevron_right,
                      color: Colors.grey[600],
                      size: 20,
                    ),
                  ),
                ),
              ],
            )
        ],
      ),
    );
  }

  // Function to scroll left
  void _scrollListLeft(String sectionTitle) {
    switch (sectionTitle) {
      case 'Featured Products':
        _featuredProductsController.animateTo(
          _featuredProductsController.offset - _scrollAmount,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeInOut,
        );
        break;
      case 'Daily Best Selling':
        _dailyBestSellingController.animateTo(
          _dailyBestSellingController.offset - _scrollAmount,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeInOut,
        );
        break;
      case 'Recently Added':
        _recentlyAddedController.animateTo(
          _recentlyAddedController.offset - _scrollAmount,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeInOut,
        );
        break;
      case 'Popular Products':
        _popularProductsController.animateTo(
          _popularProductsController.offset - _scrollAmount,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeInOut,
        );
        break;
      case 'Trending Products':
        _trendingProductsController.animateTo(
          _trendingProductsController.offset - _scrollAmount,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeInOut,
        );
        break;
    }
  }

  // Function to scroll right
  void _scrollListRight(String sectionTitle) {
    switch (sectionTitle) {
      case 'Featured Products':
        _featuredProductsController.animateTo(
          _featuredProductsController.offset + _scrollAmount,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeInOut,
        );
        break;
      case 'Daily Best Selling':
        _dailyBestSellingController.animateTo(
          _dailyBestSellingController.offset + _scrollAmount,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeInOut,
        );
        break;
      case 'Recently Added':
        _recentlyAddedController.animateTo(
          _recentlyAddedController.offset + _scrollAmount,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeInOut,
        );
        break;
      case 'Popular Products':
        _popularProductsController.animateTo(
          _popularProductsController.offset + _scrollAmount,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeInOut,
        );
        break;
      case 'Trending Products':
        _trendingProductsController.animateTo(
          _trendingProductsController.offset + _scrollAmount,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeInOut,
        );
        break;
    }
  }

  Widget _buildCategories(BuildContext context) {
    return SizedBox(
      height: 120,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        itemCount: _categories.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ProductListScreen()),
              );
            },
            child: Padding(
              padding: const EdgeInsets.only(right: 16.0),
              child: Column(
                children: [
                  Container(
                    width: 70,
                    height: 70,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.grey[200],
                    ),
                    child: ClipOval(
                      child: Image.asset(
                        _categories[index]['image']!,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  const SizedBox(height: 8),
                  SizedBox(
                    width: 70,
                    child: Text(
                      _categories[index]['title']!,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontSize: 11,
                        fontWeight: FontWeight.w500,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildProductList({
    required ScrollController controller,
  }) {
    return SizedBox(
      height: 260,
      child: ListView.builder(
        controller: controller,
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        itemCount: 10, // Increased item count for better scrolling
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
          MaterialPageRoute(builder: (context) =>  ProductListScreen()),
        );
      },
      child: Container(
        width: 150,
        margin: const EdgeInsets.only(right: 12),
        decoration: BoxDecoration(
          color: Colors.grey.shade50,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.15),
              spreadRadius: 1,
              blurRadius: 8,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                Container(
                  height: 120,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: const BorderRadius.vertical(
                      top: Radius.circular(12),
                    ),
                  ),
                  child: ClipRRect(
                    borderRadius: const BorderRadius.vertical(
                      top: Radius.circular(12),
                    ),
                    child: Image.asset(
                      'assets/images/image 742.png',
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
                const Positioned(
                  top: 8,
                  right: 8,
                  child: Icon(
                    Icons.favorite_border,
                    color: ColorConstants.buttonColor,
                    size: 20,
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Unpolished Millets',
                    style: TextStyle(
                      fontSize: 10,
                      color: Colors.orange,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(height: 4),
                  const Text(
                    'Black Eyed Peas-1kg',
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w600,
                      height: 1.2,
                    ),
                  ),
                  const SizedBox(height: 6),
                  Row(
                    children: [
                      const Text(
                        '₹ 99.00',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: ColorConstants.buttonColor,
                        ),
                      ),
                      const SizedBox(width: 6),
                      Text(
                        '₹ 130.00',
                        style: TextStyle(
                          fontSize: 11,
                          decoration: TextDecoration.lineThrough,
                          color: Colors.grey[600],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Container(
                    height: 32,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: Colors.white,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Add',
                          style: TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.w600,
                            color: ColorConstants.buttonColor,
                          ),
                        ),
                        const SizedBox(width: 6),
                        Image.asset(
                          ImageConstants.cart,
                          color: ColorConstants.buttonColor,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}