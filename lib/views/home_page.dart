import 'package:demo_loan_repayment_app/controllers/home_page_controller.dart';
import 'package:demo_loan_repayment_app/controllers/locale_controller.dart';
import 'package:demo_loan_repayment_app/controllers/size_config_controller.dart';
import 'package:demo_loan_repayment_app/controllers/theme_controller.dart';
import 'package:demo_loan_repayment_app/utils/hom_page_menu_lists.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: ThemeController.topBarBackgroundColor,
          actions: [
            TextButton(
              child: Text('Bn'),
              onPressed: () {
                Get.find<LocalController>().setLocale(Locale('bn'));
              },
            ),
            TextButton(
              child: Text('En'),
              onPressed: () {
                Get.find<LocalController>().setLocale(Locale('en'));
              },
            ),
          ],
          title: Text(AppLocalizations.of(context)!.homePageAppbarTitle)),
      body: Container(
        margin: EdgeInsets.only(
            top: 4 * SizeConfigController.heightMultiplier,
            left: 2 * SizeConfigController.widthMultiplier,
            right: 2 * SizeConfigController.widthMultiplier),
        child: GridView.builder(

            //  padding: EdgeInsets.all(8),
            itemCount: home_page_menus.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                mainAxisSpacing:
                    0.00001 * SizeConfigController.heightMultiplier,
                crossAxisSpacing: SizeConfigController.isMobilePotrait
                    ? 2 * SizeConfigController.widthMultiplier
                    : 8 * SizeConfigController.widthMultiplier,
                crossAxisCount: SizeConfigController.isPotrait
                    ? (SizeConfigController.isMobilePotrait ? 2 : 4)
                    : 4),
            itemBuilder: (context, index) => HomePageGridItem(
                  index: index,
                )),
      ),
    );
  }
}

class HomePageGridItem extends StatelessWidget {
  final index;

  HomePageGridItem({Key? key, required this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var gridItemNames = [
      AppLocalizations.of(context)!.addMember,
      AppLocalizations.of(context)!.fieldVisitHistory,
      AppLocalizations.of(context)!.somityMeeting,
      AppLocalizations.of(context)!.attendance,
      AppLocalizations.of(context)!.profileMangement,
      AppLocalizations.of(context)!.electronicPassbook,
      AppLocalizations.of(context)!.loanApply,
      AppLocalizations.of(context)!.offlineTransaction,
    ];
    return GestureDetector(
      onTap: () {
        Get.find<HomePageController>().homePageGridItemTap(index, context);
      },
      child: Column(
        children: [
          Container(
              height: SizeConfigController.isMobilePotrait
                  ? 14 * SizeConfigController.heightMultiplier
                  : 24 * SizeConfigController.heightMultiplier,
              width: 30 * SizeConfigController.widthMultiplier,
              decoration: BoxDecoration(
                  color: ThemeController.topBarBackgroundColor,
                  borderRadius: BorderRadius.circular(16)),
              child: home_page_menus[index].menuIcon),
          SizedBox(
            height: 2 * SizeConfigController.heightMultiplier,
          ),
          FittedBox(child: Text(gridItemNames[index]))
        ],
      ),
    );
  }
}
