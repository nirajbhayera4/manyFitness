import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart'; // Import animate package
import 'package:lottie/lottie.dart';
import 'LoginScreen.dart';

void main() {
  runApp(AnyDistanceApp());
}

class AnyDistanceApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );
  }
}

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 3), () {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (_) => OnboardingScreen()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Stack(
          children: [
            // Background Lottie Animation
            Positioned.fill(
              child: Lottie.network(
                'https://lottie.host/2524802f-6244-4257-a273-da34883e7403/kX4FJKL1eL.json',
                //frameRate: FrameRate(24),
                width: double
                    .infinity, // Stretch the animation to the screen's width
                height: double
                    .infinity, // Stretch the animation to the screen's height
                fit: BoxFit
                    .cover, // Optional: try using BoxFit.cover to make sure it covers the screen
              ),
            ),
            // Content on top of Lottie
            Center(
              child: SizedBox(
                height: MediaQuery.of(context).size.width * 0.35,
                width: MediaQuery.of(context).size.width * 0.35,
                child: Lottie.network(
                  'https://lottie.host/e30dc131-be39-45e5-9a31-8ee3f14e264a/4kwMnfWPLm.json',
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class OnboardingScreen extends StatefulWidget {
  @override
  _OnboardingScreenState createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _controller = PageController();
  int _pageIndex = 0;

  final List<Map<String, String>> pages = [
    {
      'title': 'Welcome to\nMany Fitness',
      'subtitle': 'A new home for your active lifestyle.',
      'image':
          'https://lottie.host/1231e2e4-733e-4487-b6a4-482ca994ec74/YPelGihE0x.json',

      'backgroundImage':
          'https://lottie.host/5d649bed-966a-4d5b-be04-4d35fcbc09a8/DVKS9JrZlm.json', // Uncomment for Lottie animation
    },
    {
      'title': "Collect'em all\nCollectibles",
      'subtitle': 'Earn achievements, rewards, and digital collectibles.',
      'image':
          'https://lottie.host/00ca2e76-f421-417a-93cc-3fde79c3f53c/80dWFeo6lW.json',

      'backgroundImage':
          'https://lottie.host/5d649bed-966a-4d5b-be04-4d35fcbc09a8/DVKS9JrZlm.json', // Uncomment for Lottie animation
    },
    {
      'title': "Your first week's on us",
      'subtitle': 'Try Super Distance free for 7 days',
      'image': 'assets/logo/ManyFitness.jpg',

      'backgroundImage':
          'https://lottie.host/5d649bed-966a-4d5b-be04-4d35fcbc09a8/DVKS9JrZlm.json', // Uncomment for Lottie animation
    },
    {
      'title': "You're all set",
      'subtitle': 'Your purchase was successful.',
      'image': 'assets/logo/ManyFitness.jpg',

      'backgroundImage':
          'https://lottie.host/5d649bed-966a-4d5b-be04-4d35fcbc09a8/DVKS9JrZlm.json', // Uncomment for Lottie animation
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView.builder(
        controller: _controller,
        itemCount: pages.length,
        onPageChanged: (index) {
          setState(() => _pageIndex = index);
        },
        itemBuilder: (context, index) {
          final page = pages[index];
          return OnboardingPage(
            title: page['title']!,
            subtitle: page['subtitle']!,
            imagePath: page['image']!,
            backgroundImage: page['backgroundImage']!,
            isLastPage: index == pages.length - 1,
            onStart: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => HomeScreen()),
              );
            },
          );
        },
      ),
    );
  }
}

class OnboardingPage extends StatelessWidget {
  final String title, subtitle, imagePath, backgroundImage;
  final bool isLastPage;
  final VoidCallback onStart;

  OnboardingPage({
    required this.title,
    required this.subtitle,
    required this.imagePath,
    required this.backgroundImage,
    required this.isLastPage,
    required this.onStart,
  });

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Stack(
          children: [
            // Background Image or Lottie Animation
            Positioned.fill(
              child: backgroundImage.contains('.json')
                  ? Lottie.network(backgroundImage, fit: BoxFit.cover)
                  : Image.asset(backgroundImage, fit: BoxFit.cover),
            ),
            SingleChildScrollView(
              padding: EdgeInsets.symmetric(
                horizontal: screenWidth * 0.066,
                vertical: screenHeight * 0.044,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Align(
                    alignment: Alignment.topRight,
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (_) => LoginScreen()),
                        );
                      },
                      child: Text('Sign In',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: screenWidth * 0.045,
                                fontWeight: FontWeight.bold,
                              ))
                          .animate()
                          .fade(duration: 500.ms)
                          .scale(delay: 500.ms),
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.15),
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: screenWidth * 0.010,
                      vertical: screenHeight * 0.020,
                    ),
                    child: Lottie.network(
                      'https://lottie.host/1231e2e4-733e-4487-b6a4-482ca994ec74/YPelGihE0x.json',
                      height: screenHeight * 0.1,
                      width: screenWidth * 0.3,
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) {
                        return Image.asset(
                          'assets/logo/fallback_image.jpg', // Your fallback image
                          height: screenHeight * 0.3,
                          width: screenWidth * 0.3,
                          fit: BoxFit.cover,
                        );
                      },
                    ),
                  ),

                  SizedBox(height: screenHeight * 0.5),
                  Text(title,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: screenWidth * 0.05,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ))
                      .animate()
                      .fade(duration: 500.ms)
                      .scale(delay: 500.ms), // Animation applied
                  SizedBox(height: screenHeight * 0.02),
                  Text(subtitle,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: screenWidth * 0.04,
                            color: Colors.white70,
                          ))
                      .animate()
                      .fade(duration: 500.ms)
                      .scale(delay: 500.ms), // Animation applied
                  SizedBox(height: screenHeight * 0.08),
                  ElevatedButton(
                    onPressed: onStart,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      foregroundColor: Colors.black,
                      padding: EdgeInsets.symmetric(
                        horizontal: screenWidth * 0.12,
                        vertical: screenHeight * 0.02,
                      ),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text('Start',
                            style: TextStyle(fontSize: screenWidth * 0.04)),
                        SizedBox(width: 10),
                        Icon(Icons.arrow_forward, size: screenWidth * 0.045),
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

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.08),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Great to see you!',
                style: TextStyle(
                    fontSize: screenWidth * 0.05, color: Colors.white),
              )
                  .animate()
                  .fade(duration: 500.ms)
                  .scale(delay: 500.ms), // Animation applied
              SizedBox(height: screenHeight * 0.15),
              Image.asset('assets/logo/achievements.jpg',
                      height: screenHeight * 0.18)
                  .animate()
                  .fade(duration: 500.ms)
                  .scale(delay: 500.ms), // Animation applied
              SizedBox(height: screenHeight * 0.03),
              ElevatedButton(
                onPressed: () {},
                child: Text('Start',
                    style: TextStyle(fontSize: screenWidth * 0.045)),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  foregroundColor: const Color.fromARGB(255, 17, 17, 17),
                  padding: EdgeInsets.symmetric(
                    horizontal: screenWidth * 0.1,
                    vertical: screenHeight * 0.015,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
