import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:islamii/my_theme.dart';
import 'package:islamii/providers/app_config_provider.dart';
import 'package:provider/provider.dart';

class TasbehTab extends StatefulWidget {
  @override
  State<TasbehTab> createState() => _TasbehTabState();
}

class _TasbehTabState extends State<TasbehTab> {
  double turns = 0.0;

  void _changeRotation() {
    setState(() => turns += 1.0 / 30.0);
  }

  int numberOfPraises = 0;

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppConfigProvider>(context);
    return Container(
      width: MediaQuery.of(context).size.width * 0.7,
      margin: EdgeInsets.symmetric(
          horizontal: MediaQuery.of(context).size.width * 0.15,
          vertical: MediaQuery.of(context).size.height * 0.03),
      child: Column(
        children: [
          Stack(
            children: [
              Container(
                  margin: EdgeInsets.only(
                      left: MediaQuery.of(context).size.width * 0.24),
                  child: provider.appTheme == ThemeMode.dark
                      ? Padding(
                          padding: const EdgeInsets.only(right: 60.0),
                          child: Image.asset(
                            'assets/images/dark_head_of_seb7a.png',
                          ),
                        )
                      : provider.appLanguage == 'en'
                          ? Image.asset(
                              'assets/images/head_of_seb7a.png',
                            )
                          : Padding(
                              padding: EdgeInsets.only(right: 60.0),
                              child: Image.asset(
                                'assets/images/head_of_seb7a.png',
                              ),
                            )),
              InkWell(
                onTap: () {
                  _changeRotation();
                  numberOfPraises++;
                },
                child: AnimatedRotation(
                  turns: turns,
                  duration: const Duration(milliseconds: 1),
                  child: Padding(
                      padding: EdgeInsets.symmetric(
                        vertical: MediaQuery.of(context).size.height * 0.09,
                      ),
                      child: provider.appTheme == ThemeMode.dark
                          ? Image.asset(
                              'assets/images/dark_body_of_seb7a.png',
                            )
                          : Image.asset(
                              'assets/images/body_of_seb7a.png',
                            )),
                ),
              ),
            ],
          ),
          Text(
            AppLocalizations.of(context)!.number_of_praises,
            style: provider.appTheme == ThemeMode.dark
                ? Theme.of(context)
                    .textTheme
                    .titleMedium!
                    .copyWith(color: MyTheme.whiteColor)
                : Theme.of(context).textTheme.titleMedium,
          ),
          Container(
            margin: EdgeInsets.symmetric(
              vertical: MediaQuery.of(context).size.height * 0.05,
            ),
            decoration: BoxDecoration(
              color: provider.appTheme == ThemeMode.dark
                  ? MyTheme.primaryDark
                  : MyTheme.primaryLight.withOpacity(0.7),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Text(
                '$numberOfPraises',
                style: provider.appTheme == ThemeMode.dark
                    ? Theme.of(context).textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.bold, color: MyTheme.whiteColor)
                    : Theme.of(context).textTheme.titleMedium?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
              ),
            ),
          ),
          Container(
            decoration: BoxDecoration(
              color: provider.appTheme == ThemeMode.dark
                  ? MyTheme.yellowColor
                  : MyTheme.primaryLight.withOpacity(0.7),
              borderRadius: BorderRadius.circular(40),
            ),
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Text(AppLocalizations.of(context)!.tasbeh,
                  style: provider.appTheme == ThemeMode.dark
                      ? Theme.of(context).textTheme.titleMedium?.copyWith(
                            fontWeight: FontWeight.bold,
                            color: MyTheme.blackColor,
                          )
                      : Theme.of(context).textTheme.titleMedium?.copyWith(
                            fontWeight: FontWeight.bold,
                            color: MyTheme.whiteColor,
                          )),
            ),
          ),
        ],
      ),
    );
  }
}
