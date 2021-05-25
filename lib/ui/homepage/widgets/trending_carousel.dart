import 'package:carousel_slider/carousel_slider.dart';
import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:moviewebsite/data/models/movie.dart';
import 'package:moviewebsite/ui/detailspage/detailspage.dart';
import 'package:moviewebsite/ui/homepage/homepage_viewmodel.dart';
import 'package:moviewebsite/ui/widgets/center_circular_progress.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class TrendingCarousel extends HookWidget {
  const TrendingCarousel({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final trending = useProvider(trendingProvider);
    return trending.when(
      data: (data) {
        // remove all the movies with title that are null
        data.results!.removeWhere((element) => element.title == null);

        return CarouselSlider(
          options: CarouselOptions(
            height: Adaptive.h(22),
            autoPlay: true,
          ),
          items: data.results!.map((movie) {
            return Builder(
              builder: (BuildContext context) {
                return InkWell(
                  onTap: () => Get.to(DetailsPage(movie: movie)),
                  child: Container(
                    width: Get.size.width,
                    margin: EdgeInsets.symmetric(horizontal: 5.0),
                    decoration: buildBgImage(movie),
                    child: buildTitle(movie),
                  ),
                );
              },
            );
          }).toList(),
        );
      },
      loading: () => CenterCircularProgress(),
      error: (error, stackTrace) => SizedBox(),
    );
  }

  BoxDecoration buildBgImage(Movie movie) {
    return BoxDecoration(
      color: Get.theme.cardColor,
      borderRadius: BorderRadius.circular(10),
      image: DecorationImage(
        fit: BoxFit.fitWidth,
        alignment: Alignment.topCenter,
        image: ExtendedNetworkImageProvider(
          !movie.backdropPath!.contains('null')
              ? movie.backdropPath!
              : movie.posterPath!,
          cache: true,
        ),
      ),
    );
  }

  Align buildTitle(Movie movie) {
    return Align(
      alignment: Alignment.bottomLeft,
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: Adaptive.w(8),
          vertical: Adaptive.w(5),
        ),
        child: Container(
          padding: EdgeInsets.symmetric(
            horizontal: 10,
            vertical: 5,
          ),
          color: Colors.black,
          child: Text(
            movie.title!,
            style: GoogleFonts.montserrat(
                fontSize: 15.sp,
                fontWeight: FontWeight.bold,
                color: Colors.white),
          ),
        ),
      ),
    );
  }
}
