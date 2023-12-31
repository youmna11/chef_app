import 'package:chef_app/core/locale/app_locale.dart';
import 'package:flutter/material.dart';
import '../../../../core/utils/app_strings.dart';
import '../../../../core/widgets/custom_button.dart';
import '../components/menu_item_component.dart';

class MenuHomeScreen extends StatelessWidget {
  const MenuHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
        body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(children: [
          CustomButton(
            onPressed: () {},
            text: AppStrings.addDishToMenu.tr(context),
          ),
          Expanded(
              child: ListView.builder(
                itemCount: 5,
                itemBuilder: (context,index)=> Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: const MenuItemComponent(),
                ),

              ))
          //items
        ]),
      ),
    ));
  }
}
