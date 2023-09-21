import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:islamii/my_theme.dart';
import 'package:islamii/providers/app_config_provider.dart';
import 'package:provider/provider.dart';

class RadioTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppConfigProvider>(context);
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Image.asset('assets/images/radio_image.png'),
        Text(
          AppLocalizations.of(context)!.quran_radio,
          style: provider.appTheme == ThemeMode.dark
              ? Theme.of(context)
                  .textTheme
                  .titleMedium!
                  .copyWith(color: MyTheme.whiteColor)
              : Theme.of(context).textTheme.titleMedium,
        ),
        // Image.asset('assets/images/icons_radio.png',
        //   ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Icon(
              Icons.skip_previous,
              size: 40,
              color: provider.appTheme == ThemeMode.dark
                  ? MyTheme.yellowColor
                  : MyTheme.primaryLight,
            ),
            Icon(
              Icons.play_arrow,
              size: 55,
              color: provider.appTheme == ThemeMode.dark
                  ? MyTheme.yellowColor
                  : MyTheme.primaryLight,
            ),
            Icon(
              Icons.skip_next,
              size: 40,
              color: provider.appTheme == ThemeMode.dark
                  ? MyTheme.yellowColor
                  : MyTheme.primaryLight,
            )
          ],
        ),
      ],
    );
  }
}
