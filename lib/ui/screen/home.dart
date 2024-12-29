import 'package:flutter/material.dart';
import 'package:home_screen/controller/bottom_nav.dart';
import 'package:home_screen/utils/image_assets.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:get/get.dart';

class Home extends StatelessWidget {
  Home({super.key});

  final BottomNav controller = Get.put(BottomNav());

  final List<String> continueWatchingImages = [
    ImageAssets.continueWatching_1,
    ImageAssets.continueWatching_2
  ];
  final List<String> continueWatchingVideoTitle = [
    'Wednesday | Season - 1| Episode - 3',
    'Emily in Paris | Season - 1| Episode - 1'
  ];

  final List<String> recommendedVideoImages = [
    ImageAssets.recommended_1,
    ImageAssets.recommended_2,
    ImageAssets.recommended_3,
    ImageAssets.recommended_1,
  ];
  final List<String> recommendedVideoTitle = [
    'Double Love',
    'Curse Of The River',
    'Sunite',
    'Double Love'
  ];

  final List<String> trendingMoviesImages = [
    ImageAssets.trending_2,
    ImageAssets.trending_1,
    ImageAssets.trending_3,
    ImageAssets.trending_2,
  ];
  final List<String> trendingMovieTitle = [
    'Yes I Do',
    'Soul Mate',
    "UB's Secret",
    'Yes I Do'
  ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff1E1E1E), // Set the background to black
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Space at the top
              const SizedBox(height: 60),

              // AppBar Part
              _buildAppBar(),

              const SizedBox(height: 16),

              // Search Box with Additional Icon
              _buildSearchBoxAndIcon(),
              const SizedBox(height: 20),

              // Categories
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Categories",
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w400,
                        color: Colors.white),
                  ),
                  TextButton(
                    onPressed: () {},
                    child: const Text(
                      "See More",
                      style: TextStyle(
                          color: Colors.white,
                          fontFamily: 'Roboto-Regular',
                          fontSize: 14),
                    ),
                  ),
                ],
              ),

              // Chips
              buildCategoryChips(),

              const SizedBox(height: 20),

              // 3 Slider
              buildSlider(),

              const SizedBox(height: 20),

              // Trending Movies
              _buildSectionHeader("Trending Movies"),
              _buildTrendingMovieList(trendingMoviesImages, trendingMovieTitle),

              const SizedBox(height: 20),

              // Continue Watching
              _buildSectionHeader("Continue Watching"),
              _buildHorizontalContinueMovieList(
                  continueWatchingImages, continueWatchingVideoTitle),

              // SizedBox(height: 20),

              // Recommended For You
              _buildSectionHeader("Recommended For You"),
              _buildHorizontalRecommendedList(
                  recommendedVideoImages, recommendedVideoTitle),

              const SizedBox(
                height: 120,
              )
            ],
          ),
        ),
      ),
    );
  }

  //App bar
  Widget _buildAppBar() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Hello, Rafsan",
              style: TextStyle(
                  fontSize: 20,
                  fontFamily: 'Roboto-Medium',
                  color: Colors.white),
            ),
            SizedBox(height: 4),
            Text(
              "Let's watch today",
              style: TextStyle(fontSize: 14, fontFamily: 'Roboto-Regular', color: Colors.grey),
            ),
          ],
        ),
        Container(
          width: 40,
          height: 40,
          decoration: BoxDecoration(
            shape: BoxShape.circle, // Makes the container circular
            image: DecorationImage(
              image: AssetImage('assets/avatar.jpg'),
              fit: BoxFit.cover, // Ensures the image covers the circular area
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.pink.withOpacity(0.4), // Gradient effect from pink
                blurRadius: 10,
                spreadRadius: 3,
                offset: Offset(3, 3), // Adjusts the position of the shadow
              ),
              BoxShadow(
                color: Colors.blue.withOpacity(0.4), // Gradient effect from blue
                blurRadius: 10,
                spreadRadius: 3,
                offset: Offset(-3, -3), // Adjusts the position of the shadow
              ),
            ],
          ),
        )

      ],
    );
  }

  Column buildSlider() {
    return Column(
      children: [
        CarouselSlider(
          items: [
            _buildBanner(ImageAssets.banner_0),
            _buildBanner(ImageAssets.banner_1),
            _buildBanner(ImageAssets.banner_3),
          ],
          options: CarouselOptions(
            viewportFraction: 1,
            onPageChanged: (index, _) => controller.updatePageIndicator(index),
          ),
        ),
        const SizedBox(
          height: 8,
        ),
        Obx(() {
          return Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              for (int i = 0; i < 3; i++)
                Container(
                  width: 10,
                  height: 10,
                  margin: const EdgeInsets.only(right: 10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(400),
                    color: controller.carousalCurrentIndex.value == i
                        ? Colors.white
                        : const Color(0xff4F5055),
                  ),
                ),
            ],
          );
        })
      ],
    );
  }

  Container _buildBanner(String imagePath) {
    return Container(
      //Slider (w -> 343, H -> 165)
      height: 165,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16.0),
        color: Colors.grey[800],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16.0),
        child: Image(
          image: AssetImage(imagePath),
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  SingleChildScrollView buildCategoryChips() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          _buildCategoryChip("All", true),
          _buildCategoryChip("Action", false),
          _buildCategoryChip("Anime", false),
          _buildCategoryChip("Sci-fi", false),
          _buildCategoryChip("Thriller", false),
        ],
      ),
    );
  }

  Row _buildSearchBoxAndIcon() {
    return Row(
      children: [
        Expanded(
          child: TextField(
            decoration: InputDecoration(
              filled: true,
              fillColor: Colors.grey[900],
              hintText: 'Search',
              hintStyle: TextStyle(color: Colors.grey),
              suffixIcon: Icon(Icons.search, color: Colors.white),
              // Search icon on trailing side
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30),
                borderSide: BorderSide(color: Colors.white), // White border
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30),
                borderSide: BorderSide(
                    color: Colors.white), // White border for enabled state
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30),
                borderSide: BorderSide(
                    color: Colors.white,
                    width: 2), // White border for focused state
              ),
            ),
            style: TextStyle(color: Colors.white),
          ),
        ),
        SizedBox(width: 8),
        Container(
          decoration: BoxDecoration(
            color: Colors.red, // Red background
            borderRadius: BorderRadius.circular(8), // Rounded corners
          ),
          padding: EdgeInsets.all(8), // Padding inside the container
          child: Icon(
            Icons.tune, // Filter icon
            color: Colors.white,
            size: 24,
          ),
        ),
      ],
    );
  }

  Widget _buildCategoryChip(String label, bool isSelected) {
    return Padding(
      padding: const EdgeInsets.only(right: 8.0),
      child: Chip(
        label: Text(label),
        labelStyle: TextStyle(
          fontFamily: 'Akatab-Regular',
          fontSize: 14,
          color: isSelected ? Colors.white : Colors.white.withOpacity(0.3),
        ),
        backgroundColor: isSelected ? Colors.red : const Color(0xFF221821),
        side: const BorderSide(
          color: Color(0xFF221821), // Optional border for unselected chips
        ),
      ),
    );
  }

  Widget _buildSectionHeader(String title) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: const TextStyle(
              fontSize: 18, fontFamily: 'Akatab-SemiBold', color: Colors.white),
        ),
        TextButton(
          onPressed: () {},
          child: const Text(
            "See More",
            style: TextStyle(
                color: Colors.white,
                fontFamily: 'Roboto-Regular',
                fontSize: 14),
          ),
        ),
      ],
    );
  }

  // Trending Movies
  Widget _buildTrendingMovieList(
      List<String> trending, List<String> movieName) {
    return SizedBox(
      height: 180, // Adjust the height as per design
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: trending.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  //Trending (w->99,H->127)
                  width: 99,
                  height: 127,
                  decoration: BoxDecoration(
                    color: Colors.grey[800],
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8.0),
                    child: Image(
                      fit: BoxFit.cover,
                      image: AssetImage(trending[index]),
                    ),
                  ),
                ),
                const SizedBox(height: 8),
                Padding(
                  padding: const EdgeInsets.only(left: 4),
                  child: Text(
                    trendingMovieTitle[index],
                    textAlign: TextAlign.start,
                    style: const TextStyle(
                        color: Colors.white,
                        fontFamily: 'Akatab-Regular',
                        fontSize: 14),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  // Continue Watching
  Widget _buildHorizontalContinueMovieList(
      List<String> continueWatching, List<String> continueWatchingTitle) {
    return SizedBox(
      height: 180, // Adjust the height as per design
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: continueWatching.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              // Aligns items to the start
              children: [
                Container(
                  //Continue image (w->166,H->98)
                  width: 166,
                  height: 98,
                  decoration: BoxDecoration(
                    color: Colors.grey[800], // Placeholder for movie image
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8.0),
                    // Ensures rounded corners
                    child: Image(
                      fit: BoxFit.cover,
                      // Ensures the image covers the entire container
                      image: AssetImage(continueWatching[index]),
                    ),
                  ),
                ),
                const SizedBox(height: 8),
                SizedBox(
                  width: 160, // Constrains the width of the text
                  child: Text(
                    formatVideoTitle(continueWatchingVideoTitle[index]),
                    style: const TextStyle(
                        color: Colors.white,
                        fontFamily: 'Akatab-Regular',
                        fontSize: 14),
                    maxLines: 2,
                    // Limits to 2 lines
                    overflow: TextOverflow.ellipsis,
                    // Adds ellipsis if text overflows
                    softWrap: true,
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  String formatVideoTitle(String title) {
    if (title.startsWith('Emily in Paris')) {
      return title.replaceFirst('Emily in Paris |', 'Emily in Paris |\n');
    }
    return title;
  }

  // Recommended For You
  Widget _buildHorizontalRecommendedList(
      List<String> recommendVideos, List<String> recommendVideosTile) {
    return SizedBox(
      height: 180, // Adjust the height as per design
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: recommendVideos.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  //Trending (w->99,H->127)
                  width: 99,
                  height: 127,
                  decoration: BoxDecoration(
                    color: Colors.grey[800],
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8.0),
                    child: Image(
                      fit: BoxFit.cover,
                      image: AssetImage(recommendVideos[index]),
                    ),
                  ),
                ),
                const SizedBox(height: 8),
                Padding(
                  padding: const EdgeInsets.only(left: 4),
                  child: Text(
                    recommendVideosTile[index]
                        .replaceAll('Of The River', 'Of\nThe River'),
                    textAlign: TextAlign.start,
                    style: const TextStyle(
                        color: Colors.white,
                        fontFamily: 'Roboto-Regular',
                        fontSize: 14),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
