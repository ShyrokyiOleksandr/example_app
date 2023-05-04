import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../app_assets.dart';

class AppLogo extends StatelessWidget {
  const AppLogo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20),
      child: SvgPicture.asset(
        AppAssets.logoTimeAndDate,
      ),
    );
  }
}
