import 'package:flutter/material.dart';
import 'package:flutter_project_2/core/routing/app_router.dart';
import 'package:flutter_project_2/core/helpers/responsive.dart';
import 'package:go_router/go_router.dart';
import '../models/onboarding_item.dart';
import '../widgets/onboarding_page_content.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _pageController = PageController();
  int _currentIndex = 0;

  final List<OnboardingItem> _pages = [
    OnboardingItem(
      imagePath: 'assets/images/on_boarding_logo1.png',
      title: 'Trade anytime anywhere',
      description: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore.',
    ),
    OnboardingItem(
      imagePath: 'assets/images/on_boarding_logo2.png',
      title: 'Transact fast and easy',
      description: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore.',
    ),
    OnboardingItem(
      imagePath: 'assets/images/on_boarding_logo3.png',
      title: 'Save and invest at the same time',
      description: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore.',
    ),
  ];

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _onNextPressed() {
    if (_currentIndex < _pages.length - 1) {
      _pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    } else {
      context.go(AppRouter.auth);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset(
            'assets/images/onboarding_bg.png',
            fit: BoxFit.cover,
          ),

          SafeArea(
            child: Column(
              children: [
                Expanded(
                  child: PageView.builder(
                    controller: _pageController,
                    onPageChanged: (index) {
                      setState(() {
                        _currentIndex = index;
                      });
                    },
                    itemCount: _pages.length,
                    itemBuilder: (context, index) {
                      return OnboardingPageContent(item: _pages[index]);
                    },
                  ),
                ),

                Padding(
                  padding: EdgeInsets.fromLTRB(
                    Responsive.padding(context, 24),
                    0,
                    Responsive.padding(context, 24),
                    Responsive.padding(context, 48),
                  ),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: List.generate(
                          _pages.length,
                          (index) => AnimatedContainer(
                            duration: const Duration(milliseconds: 300),
                            margin: EdgeInsets.symmetric(horizontal: Responsive.value(context, 4)),
                            height: Responsive.value(context, 8),
                            width: Responsive.value(context, 8),
                            decoration: BoxDecoration(
                              color: _currentIndex == index
                                  ? Theme.of(context).primaryColor
                                  : Colors.white.withValues(alpha: 0.2),
                              shape: BoxShape.circle,
                            ),
                          ),
                        ),
                      ),
                      
                      SizedBox(height: Responsive.value(context, 32)),
                      Container(
                        decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              color: Theme.of(context).primaryColor.withValues(alpha: 0.2),
                              blurRadius: Responsive.value(context, 20),
                              offset: Offset(0, Responsive.value(context, 8)),
                            ),
                          ],
                        ),
                        child: ElevatedButton(
                          onPressed: _onNextPressed,
                          style: ElevatedButton.styleFrom(
                            minimumSize: Size(Responsive.value(context, 200), Responsive.value(context, 56)), 
                          ),
                          child: Text(
                            _currentIndex == _pages.length - 1 ? 'Get Started' : 'Next',
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}