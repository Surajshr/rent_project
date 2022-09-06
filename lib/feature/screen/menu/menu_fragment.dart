import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rent_project/common/base_page/base_page.dart';
import 'package:rent_project/common/model/card_item_model.dart';
import 'package:rent_project/common/widget/custom_listtile.dart';
import 'package:rent_project/core/auth/bloc/auth_bloc.dart';
import 'package:rent_project/core/auth/bloc/auth_events.dart';
import 'package:rent_project/core/auth/bloc/auth_states.dart';
import 'package:rent_project/core/constant/image_constant.dart';
import 'package:rent_project/core/constant/res_string.dart';
import 'package:rent_project/helper/show_dialog.dart';
import 'package:rent_project/localization.dart';
import 'package:rent_project/routing/Routing.dart';
import 'package:rent_project/utils/image_utils.dart';

class MenuFragment extends StatefulWidget {
  const MenuFragment({Key? key}) : super(key: key);

  @override
  State<MenuFragment> createState() => _MenuFragmentState();
}

class _MenuFragmentState extends State<MenuFragment> {
  @override
  Widget build(BuildContext context) {
    List<CardListItem> menuItems = [
      CardListItem(
        label: getLocalizedString(
          context: context,
          resString: ResString.tenantMenu,
        ),
        IconsPath: ImageConstant.tenant,
        onNavigate: RoutingPath.currentTenant,
      ),
      CardListItem(
        label: getLocalizedString(
          context: context,
          resString: ResString.invoice,
        ),
        IconsPath: ImageConstant.invoice,
      ),
      CardListItem(
        label: getLocalizedString(
          context: context,
          resString: ResString.ownerMenu,
        ),
        IconsPath: ImageConstant.ownerProfile,
      ),
      CardListItem(
        label: getLocalizedString(
          context: context,
          resString: ResString.setting,
        ),
        IconsPath: ImageConstant.setting,
      ),
      CardListItem(
          label: getLocalizedString(
            context: context,
            resString: ResString.logout,
          ),
          IconsPath: ImageConstant.logout,
          onNavigate: RoutingPath.logOut),
    ];

    CardItemModel menuData = CardItemModel(cardList: menuItems);
    return SafeArea(
      child: BasePage(
        showAppBar: false,
        body: BlocListener<AuthBloc, AuthState>(
          listener: (context, state) {
            if (state is UnAuthenticatedState) {
              Navigator.pushNamedAndRemoveUntil(
                  context, RoutingPath.loginPage, (route) => false);
            }
          },
          child: ListView.builder(
            itemCount: menuData.cardList.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.only(left: 5, right: 5),
                child: Card(
                  elevation: .5,
                  child: CustomListTile(
                      title: Text(
                        getLocalizedString(
                            context: context,
                            resString: menuData.cardList[index].label),
                      ),
                      leading: ImageUtils.localImage(
                        imgSource: "${menuData.cardList[index].IconsPath}",
                        height: 30,
                        width: 40,
                      ),
                      onPress: () {
                        if (menuData.cardList[index].onNavigate ==
                            RoutingPath.logOut) {
                          showConfirmDialog(
                            context,
                            getLocalizedString(
                                context: context,
                                resString: ResString.conformQuestion),
                            Text(
                              getLocalizedString(
                                  context: context,
                                  resString: ResString.conformMessage),
                            ),
                            actions: [
                              ElevatedButton(
                                onPressed: () {
                                  context
                                      .read<AuthBloc>()
                                      .add(SignOutRequestEvent());
                                },
                                child: Text("ok"),
                              ),
                            ],
                          );
                        } else {
                          Navigator.pushNamed(
                            context,
                            menuData.cardList[index].onNavigate.toString(),
                          );
                        }
                      }
                      //menuData.cardList[index].onNavigate,
                      ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
