import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:moviewebsite/data/models/movie.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class SynopsisText extends StatelessWidget {
  const SynopsisText({
    Key? key,
    required this.movie,
  }) : super(key: key);

  final Movie movie;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: Device.screenType == ScreenType.tablet ? 40 : 20,
      ),
      // width: ,
      child: Column(
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              'Synopsis',
              textAlign: TextAlign.left,
              style: GoogleFonts.montserrat(
                color: Colors.white,
                fontSize: 8.sp,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          Gap(1.h),
          Text(
            movie.overview!,
            textAlign: TextAlign.justify,
            style: GoogleFonts.montserrat(
              color: Colors.white,
              fontSize: 11.3.sp,
              fontWeight: FontWeight.w300,
            ),
          ),
        ],
      ),
    );
  }
}
