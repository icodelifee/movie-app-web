import 'dart:math';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:moviewebsite/ui/homepage/homepage_viewmodel.dart';
import 'package:moviewebsite/ui/homepage/widgets/popular_list.dart';
import 'package:moviewebsite/ui/homepage/widgets/trending_carousel.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class HomePage extends HookWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'MoviesGo',
          style: GoogleFonts.montserrat(
            fontWeight: FontWeight.bold,
            fontSize: 14.sp,
            letterSpacing: 2,
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(
            vertical: Adaptive.h(2),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TrendingCarousel(),
              Gap(Adaptive.h(3)),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 10.sp),
                child: Text(
                  'Popular Movies',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 10.sp,
                    color: Colors.white,
                  ),
                ),
              ),
              PopularList()
            ],
          ),
        ),
      ),
    );
  }
}
