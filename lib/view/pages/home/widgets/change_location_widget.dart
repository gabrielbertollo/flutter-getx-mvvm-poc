import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ChangeLocationWidget extends StatelessWidget {
  const ChangeLocationWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.g_translate_outlined),
      onPressed: () {
        Get.dialog(
          AlertDialog(
            title: const Text('Choose language'),
            content: SingleChildScrollView(
              child: ListBody(
                children: [
                  for (Locale locale in AppLocalizations.supportedLocales)
                    ListTile(
                      title: Row(
                        children: [
                          Flexible(
                            child: Text(
                              locale.toLanguageTag() == 'en'
                                  ? '🇺🇸  English'
                                  : '🇧🇷  Português',
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ],
                      ),
                      trailing: Icon(
                        AppLocalizations.of(context)?.localeName ==
                                locale.toLanguageTag()
                            ? Icons.check
                            : null,
                      ),
                      onTap: () {
                        Get.updateLocale(locale);
                        Get.back();
                      },
                    ),
                ],
              ),
            ),
          ),
        );
      },
      tooltip: AppLocalizations.of(context)!.localizationButtonMessage,
    );
  }
}
