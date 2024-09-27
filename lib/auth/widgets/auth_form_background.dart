import 'dart:io';

import 'package:beco_coffee/auth/widgets/auth_background.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

class AuthFormBackground extends StatelessWidget {
  final GlobalKey<FormState> formKey;
  final List<Widget> Function(
    BuildContext context,
    BoxConstraints constraints,
  )? builder;
  final MainAxisAlignment? mainAxisAlignment;

  const AuthFormBackground({
    super.key,
    required this.formKey,
    this.builder,
    this.mainAxisAlignment,
  });

  @override
  Widget build(BuildContext context) {
    return DefaultTextStyle(
      style: GoogleFonts.inter(),
      child: Scaffold(
        extendBody: true,
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: IconButton(
            style: IconButton.styleFrom(
              backgroundColor: Colors.transparent,
            ),
            iconSize: 40,
            onPressed: () => context.pop(),
            icon: Icon(
              Platform.isIOS ? Icons.arrow_back_ios_new : Icons.arrow_back,
            ),
          ),
        ),
        body: GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
          },
          child: AuthBackground(
            child: LayoutBuilder(
              builder: (context, constraints) {
                return SingleChildScrollView(
                  physics: const NeverScrollableScrollPhysics(),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 15,
                    vertical: 25,
                  ),
                  child: ConstrainedBox(
                    constraints: BoxConstraints(
                      minHeight: constraints.maxHeight,
                      minWidth: constraints.maxWidth,
                    ),
                    child: Form(
                      key: formKey,
                      child: IntrinsicHeight(
                        child: Column(
                          mainAxisAlignment:
                              mainAxisAlignment ?? MainAxisAlignment.start,
                          children: [
                            SizedBox.fromSize(
                              size: Size.fromHeight(
                                constraints.maxHeight * 0.05,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(70),
                              child: Image.asset(
                                'assets/img/logo/logo_2.png',
                                width: double.infinity,
                                height:
                                    MediaQuery.of(context).size.height * 0.1,
                                fit: BoxFit.cover,
                              ),
                            ),
                            if (builder != null)
                              ...builder!(context, constraints),
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
