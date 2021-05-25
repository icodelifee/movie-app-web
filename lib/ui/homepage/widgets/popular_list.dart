import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:get/get.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:moviewebsite/data/providers/popular_provider.dart';
import 'package:moviewebsite/ui/detailspage/detailspage.dart';
import 'package:moviewebsite/ui/widgets/center_circular_progress.dart';
import 'package:moviewebsite/ui/widgets/image_hover.dart';
import 'package:moviewebsite/utils/get_break_points.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class PopularList extends HookWidget {
  PopularList({Key? key}) : super(key: key);
  final double _crossAxisSpacing = 20,
      _mainAxisSpacing = 19,
      _aspectRatio = 0.8;

  @override
  Widget build(BuildContext context) {
    final popular = useProvider(popularProvider);
    return popular.when(
      data: (data) => GridView.builder(
          padding: EdgeInsets.all(1.5.h),
          physics: NeverScrollableScrollPhysics(),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: _getGridCount(),
            crossAxisSpacing: _crossAxisSpacing,
            mainAxisSpacing: _mainAxisSpacing,
            childAspectRatio: _aspectRatio,
          ),
          shrinkWrap: true,
          itemCount: data.results!.length,
          itemBuilder: (BuildContext context, int index) {
            final movie = data.results![index];
            return ImageHover(
              child: Hero(
                tag: movie.id!,
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    image: DecorationImage(
                      image: ExtendedNetworkImageProvider(
                        movie.posterPath!,
                        cache: true,
                      ),
                      fit: BoxFit.cover,
                    ),
                  ),
                  height: 200,
                  child: Material(
                    color: Colors.transparent,
                    child: InkWell(
                      onTap: () => Get.to(
                        DetailsPage(
                          movie: movie,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            );
          }),
      loading: () => CenterCircularProgress(),
      error: (error, stackTrace) => SizedBox(),
    );
  }

  int _getGridCount() {
    final bp = getBreakPoints();
    if (bp == BreakPoints.mobile) {
      return 3;
    } else if (bp == BreakPoints.tablet) {
      return 4;
    } else {
      return 6;
    }
  }
}
