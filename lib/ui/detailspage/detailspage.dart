import 'dart:ui';

import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:moviewebsite/data/models/movie.dart';
import 'package:moviewebsite/ui/detailspage/widgets/genre_list.dart';
import 'package:moviewebsite/ui/detailspage/widgets/synopsis_text.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class DetailsPage extends StatelessWidget {
  const DetailsPage({Key? key, required this.movie}) : super(key: key);
  final Movie movie;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: Container(
        decoration: bgImage(),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
          child: Container(
            width: Get.width,
            height: Get.height,
            decoration: BoxDecoration(color: Colors.black.withOpacity(0.5)),
            child: SafeArea(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    posterImage(),
                    Gap(10.sp),
                    movieTitle(),
                    Gap(1.h),
                    GenreList(movie: movie),
                    Gap(3.h),
                    SynopsisText(movie: movie),
                    Gap(3.h),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Padding movieTitle() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text(
        movie.title!,
        textAlign: TextAlign.center,
        style: GoogleFonts.montserrat(
          color: Colors.white,
          fontSize: 16.sp,
          fontWeight: FontWeight.w700,
        ),
      ),
    );
  }

  Hero posterImage() {
    return Hero(
      tag: movie.id!,
      child: ExtendedImage.network(
        movie.posterPath!,
        width: Adaptive.w(30),
      ),
    );
  }

  BoxDecoration bgImage() {
    return BoxDecoration(
      image: DecorationImage(
        image: ExtendedNetworkImageProvider(
          movie.backdropPath!,
          cache: true,
        ),
        fit: BoxFit.cover,
      ),
    );
  }
}
