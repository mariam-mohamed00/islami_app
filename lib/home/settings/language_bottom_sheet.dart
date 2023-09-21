import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:islamii/my_theme.dart';
import 'package:islamii/providers/app_config_provider.dart';
import 'package:provider/provider.dart';

class LanguageBottomSheet extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppConfigProvider>(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        InkWell(
            onTap: () {
              provider.changeLanguage('en');
            },
            child: provider.appLanguage == 'en'
                ? getSelectedItemWidget(
                    context, AppLocalizations.of(context)!.english)
                : getUnSelectedItemWidget(
                    context, AppLocalizations.of(context)!.english)),
        InkWell(
            onTap: () {
              provider.changeLanguage('ar');
            },
            child: provider.appLanguage == 'ar'
                ? getSelectedItemWidget(
                    context, AppLocalizations.of(context)!.arabic)
                : getUnSelectedItemWidget(
                    context, AppLocalizations.of(context)!.arabic)),
      ],
    );
  }

  Widget getSelectedItemWidget(BuildContext context, String text) {
    var provider = Provider.of<AppConfigProvider>(context, listen: false);
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            text,
            style: provider.appTheme == ThemeMode.dark
                ? Theme.of(context)
                    .textTheme
                    .titleMedium!
                    .copyWith(color: MyTheme.yellowColor)
                : Theme.of(context)
                    .textTheme
                    .titleMedium!
                    .copyWith(color: Theme.of(context).primaryColor),
          ),
          Icon(
            Icons.check,
            color: provider.appTheme == ThemeMode.dark
                ? MyTheme.yellowColor
                : Theme.of(context).primaryColor,
            size: 30,
          ),
        ],
      ),
    );
  }

  Widget getUnSelectedItemWidget(BuildContext context, String text) {
    var provider = Provider.of<AppConfigProvider>(context, listen: false);

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text(
        text,
        style: provider.appTheme == ThemeMode.dark
            ? Theme.of(context)
                .textTheme
                .titleMedium!
                .copyWith(color: MyTheme.whiteColor)
            : Theme.of(context).textTheme.titleMedium,
      ),
    );
  }
}
