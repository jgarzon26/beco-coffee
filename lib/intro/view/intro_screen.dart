import 'dart:io';

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
  int _currentPage = 0;

  late Widget _currentImage;

  @override
  void initState() {
    super.initState();
    final mediaQuery = (context
            .getElementForInheritedWidgetOfExactType<MediaQuery>()!
            .widget as MediaQuery)
        .data;
    _currentImage = _buildImageAsset(key: const ValueKey(0), name: pages[0].image, height: mediaQuery.size.height * 0.5);
  }

  Widget _buildImageAsset({
    required Key key,
    required String name,
    double? height,
  }) {
    return Image.asset(
      key: key,
      name,
      fit: BoxFit.cover,
      height: height ?? MediaQuery.of(context).size.height * 0.5,
      width: double.infinity,
    );
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
        child: Padding(
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
                  borderRadius: BorderRadius.all(Radius.circular(borderRadius)),
                ),
                elevation: 10,
                child: ClipRRect(
                  borderRadius:
                      const BorderRadius.all(Radius.circular(borderRadius)),
                  child: AnimatedSwitcher(
                    duration: const Duration(milliseconds: 500),
                    child: _currentImage,
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
                  size: const Size(15, 5),
                  activeSize: const Size(25, 5),
                  shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(15))),
                  activeShape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(15))),
                  spacing: const EdgeInsets.only(right: 2),
                ),
              ),
              const SizedBox(height: 15),
              Text(
                pages[_currentPage].title,
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                      fontWeight: FontWeight.w900,
                    ),
              ),
              const SizedBox(height: 15),
              Text(
                pages[_currentPage].subtitle,
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
                      context.goNamed('auth');
                    },
                    child: Text(
                      'Skip',
                      style: Theme.of(context).textTheme.titleLarge!.copyWith(
                            fontWeight: FontWeight.w600,
                          ),
                    ),
                  ),
                  IconButton(
                    iconSize: 40,
                    onPressed: () {
                      if (_currentPage + 1 >= pages.length) {
                        context.goNamed('auth');
                        return;
                      }

                      setState(() {
                        _currentPage++;
                        _currentImage =
                            _buildImageAsset(key: ValueKey(_currentPage), name: pages[_currentPage].image);
                      });
                    },
                    icon: Icon(
                      Platform.isIOS
                          ? Icons.arrow_forward_ios
                          : Icons.arrow_forward,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
