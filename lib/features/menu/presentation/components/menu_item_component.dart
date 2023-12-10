import 'package:cached_network_image/cached_network_image.dart';
import 'package:chef_app/core/locale/app_locale.dart';
import 'package:chef_app/core/utils/app_strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/utils/app_color.dart';
import '../../../../core/widgets/custom_alert_dialog.dart';
import '../../../../core/widgets/custom_cached_network_image.dart';

class MenuItemComponent extends StatelessWidget {
  const MenuItemComponent({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        //image
        SizedBox(
          height: 60.h,
          width: 60.w,
          child: const CustomCachedNetworkImage(imgUrl: 'https://www.pexels.com/photo/top-view-of-food-1640772/',),
        ),
        SizedBox(
          width: 8.w,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('title'),
            Text('Subtitle'),
            Text('Price LE'),
    ],
        ),
        const Spacer(),
           IconButton(
              onPressed: (){
                showDialog(
                    context: context,
                    builder: (context) {
                     return CustomAlertDialog(
                       message: 'Delete Item',
                       confirmAction: (){},
                     );
                    });
              },
              icon: const Icon(
                Icons.cancel,
                color: AppColors.red,
                size: 40,
              ),
            ),
      ],
    );
  }
}

