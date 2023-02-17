import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:przepisy_sylwii_mobile/constants/typography.dart';
import 'package:przepisy_sylwii_mobile/core/favorites_cubit/favorites_cubit.dart';
import 'package:przepisy_sylwii_mobile/injection.dart';
import 'package:przepisy_sylwii_mobile/view/widgets/shimmer_box.dart';

class FavRecipesList extends StatelessWidget {
  const FavRecipesList({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: getIt<FavoritesCubit>().state.favoritesRecipes.length,
        shrinkWrap: true,
        physics: const ClampingScrollPhysics(),
        itemBuilder: (_, index) {
          return Padding(
            padding: EdgeInsets.symmetric(vertical: 8.h),
            child: SizedBox(
              height: 260.h,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 200.h,
                    width: double.infinity,
                    child: ClipRRect(
                      borderRadius: BorderRadius.all(Radius.circular(16.r)),
                      child: CachedNetworkImage(
                        imageUrl: getIt<FavoritesCubit>()
                            .state
                            .favoritesRecipes[index]
                            .url,
                        fit: BoxFit.cover,
                        filterQuality: FilterQuality.high,
                        placeholder: (_, __) => const ShimmerBox(
                          height: 240,
                          width: double.infinity,
                          radius: 16,
                        ),
                        errorWidget: (_, __, ___) => const Icon(Icons.error),
                      ),
                    ),
                  ),
                  SizedBox(height: 10.h),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 6.w),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Flexible(
                          child: Text(
                            getIt<FavoritesCubit>()
                                .state
                                .favoritesRecipes[index]
                                .dishName,
                            overflow: TextOverflow.ellipsis,
                            style: CustomTypography.uRegular16,
                          ),
                        ),
                        Text(
                          '${getIt<FavoritesCubit>().state.favoritesRecipes[index].time} min',
                          style: CustomTypography.uRegular14n70,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
