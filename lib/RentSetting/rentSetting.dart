import 'package:flutter/material.dart';

import '../Constaints.dart';
import '../Resuable_card.dart';

class RentalSetting extends StatefulWidget {
  const RentalSetting({Key? key}) : super(key: key);

  @override
  _RentalSettingState createState() => _RentalSettingState();
}

class _RentalSettingState extends State<RentalSetting> {
  Widget listOfSetting(
      {required IconData MyIcons, String? SettingType, Function()? onPress}) {
    return Padding(
      padding: const EdgeInsets.only(left: 15.0, top: 15.0, bottom: 10.0),
      child: InkWell(
        hoverColor: Colors.blue,
        onTap: onPress,
        child: Row(
          children: [
            Icon(MyIcons),
            const SizedBox(
              width: 20.0,
            ),
            Text(
              "$SettingType",
              style: kBodyTextStyle,
            )
          ],
        ),
      ),
    );
  }

  Widget customDivider() => const Divider(
        color: Colors.white,
        thickness: 0.2,
        indent: 20.0,
        endIndent: 20.0,
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
          child: Icon(Icons.arrow_back),
          onTap: () {
            Navigator.pop(context);
          },
        ),
        actions: const [
          Padding(
            padding: EdgeInsets.only(top: 15, right: 20),
            child: Text(
              "Save",
              style: kSideBarTextStyle,
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Setting",
                style: kBodyTextStyle,
              ),
              ReusableCard(
                containerHeight: MediaQuery.of(context).size.height * 0.35,
                containerWidth: MediaQuery.of(context).size.width,
                colour: kAppBarColor,
                cardChild: Column(
                  children: [
                    listOfSetting(
                      MyIcons: Icons.settings,
                      SettingType: "General",
                      onPress: () {

                      },
                    ),
                    customDivider(),
                    listOfSetting(
                      MyIcons: Icons.subscriptions_rounded,
                      SettingType: "Subscription",
                      onPress: () {},
                    ),
                    customDivider(),
                    listOfSetting(
                      MyIcons: Icons.help,
                      SettingType: "Help Center",
                      onPress: () {},
                    ),
                    customDivider(),
                    listOfSetting(
                      MyIcons: Icons.people_alt,
                      SettingType: "Organization",
                      onPress: () {},
                    ),
                    customDivider()
                  ],
                ),
              ),
              SizedBox(
                height: 10.0,
              ),
              const Text(
                "FeedBack",
                style: kBodyTextStyle,
              ),
              ReusableCard(
                containerHeight: MediaQuery.of(context).size.height * 0.25,
                containerWidth: MediaQuery.of(context).size.width,
                colour: kAppBarColor,
                cardChild: Column(
                  children: [
                    listOfSetting(
                      MyIcons: Icons.people_alt,
                      SettingType: "Contact Us",
                      onPress: () {},
                    ),
                    customDivider(),
                    listOfSetting(
                      MyIcons: Icons.facebook,
                      SettingType: "Join Our Facebook",
                      onPress: () {},
                    ),
                    customDivider(),
                    listOfSetting(
                      MyIcons: Icons.whatsapp,
                      SettingType: "Join Us on WhatsApp",
                      onPress: () {},
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 10.0,
              ),
              const Text(
                "Share",
                style: kBodyTextStyle,
              ),
              ReusableCard(
                containerHeight: MediaQuery.of(context).size.height * 0.15,
                containerWidth: MediaQuery.of(context).size.width,
                colour: kAppBarColor,
                cardChild: Column(
                  children: [
                    listOfSetting(
                      MyIcons: Icons.share,
                      SettingType: "Tell a Friends",
                      onPress: () {},
                    ),
                    customDivider(),
                    listOfSetting(
                      MyIcons: Icons.star,
                      SettingType: "Rate US",
                      onPress: () {},
                    ),

                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
