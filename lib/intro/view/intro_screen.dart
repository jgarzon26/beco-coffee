import 'package:beco_coffee/intro/data/pages.dart';
import 'package:beco_coffee/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

class IntroScreen extends StatefulWidget {
  const IntroScreen({super.key});

  @override
  State<IntroScreen> createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {
  final PageController _pageController = PageController();

  int _currentPage = 0;

  @override
  void dispose() {
    super.dispose();
    _pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    const borderRadius = 15.0;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: kSurface,
      ),
      body: DefaultTextStyle(
        style: GoogleFonts.inter().copyWith(
          color: kOnSurface,
          backgroundColor: kSurface,
        ),
        child: PageView.builder(
          itemCount: pages.length,
          controller: _pageController,
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.only(
                left: 15,
                right: 15,
                top: 20,
                bottom: 40,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Card(
                    margin: const EdgeInsets.symmetric(horizontal: 5),
                    shape: const RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.all(Radius.circular(borderRadius)),
                    ),
                    elevation: 10,
                    child: ClipRRect(
                      borderRadius:
                          const BorderRadius.all(Radius.circular(borderRadius)),
                      child: Image.asset(
                        pages[index].image,
                        fit: BoxFit.cover,
                        height: MediaQuery.of(context).size.height * 0.5,
                        width: double.infinity,
                      ),
                    ),
                  ),
                  const SizedBox(height: 15),
                  DotsIndicator(
                    position: _currentPage,
                    dotsCount: pages.length,
                    decorator: DotsDecorator(
                      color: kSecondaryContainer.withOpacity(0.7),
                      activeColor: kSecondaryContainer,
                    ),
                  ),
                  const SizedBox(height: 15),
                  Text(
                    pages[index].title,
                    style: Theme.of(context).textTheme.titleLarge!.copyWith(
                          fontWeight: FontWeight.w900,
                        ),
                  ),
                  const SizedBox(height: 15),
                  Text(
                    pages[index].subtitle,
                    style: Theme.of(context).textTheme.titleSmall!.copyWith(
                          fontWeight: FontWeight.w600,
                        ),
                  ),
                  const Spacer(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextButton(
                        style: TextButton.styleFrom(
                          padding: EdgeInsets.zero,
                          alignment: Alignment.centerLeft,
                        ),
                        onPressed: () {
                          //TODO: go to auth screen
                          context.goNamed('home');
                        },
                        child: Text(
                          'Skip',
                          style:
                              Theme.of(context).textTheme.titleLarge!.copyWith(
                                    fontWeight: FontWeight.w600,
                                  ),
                        ),
                      ),
                      IconButton(
                        iconSize: 40,
                        onPressed: () {
                          if (_currentPage + 1 >= pages.length) {
                            //TODO: go to auth screen
                            context.goNamed('home');
                            return;
                          }

                          _pageController.jumpToPage(_currentPage + 1);

                          setState(() {
                            _currentPage++;
                          });
                        },
                        icon: const Icon(
                          Icons.arrow_forward_ios,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
//SafeArea>Column[Card>Image,SizedBox,Text,Text,SizedBox,Row[TextButton,Spacer,IconButton]