import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../core/fonts.dart';

class GalleryView extends StatelessWidget {
  final List<String> images;

  const GalleryView({super.key, required this.images});

  @override
  Widget build(BuildContext context) {
    ColorScheme colorScheme = Theme.of(context).colorScheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Gallery:',
            style:
                Fonts.sFProDisplay(18.sp, colorScheme.primary, FontWeight.w700),
            textScaleFactor: 1),
        SizedBox(height: 10.h),
        SizedBox(
          height: 225.h,
          width: double.infinity,
          child: ListView.separated(
            itemBuilder: (ctx, index) => Image.network(
              images[index],
              fit: BoxFit.fill,
              width: 150.w,
            ),
            separatorBuilder: (ctx, index) => SizedBox(
              width: 6.w,
            ),
            itemCount: images.length,
            padding: EdgeInsets.zero,
            scrollDirection: Axis.horizontal,
            physics: const BouncingScrollPhysics(),
            shrinkWrap: true,
          ),
        ),
      ],
    );
  }
}
