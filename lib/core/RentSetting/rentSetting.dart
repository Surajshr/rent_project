import 'package:flutter/material.dart';
import 'package:rent_project/Constaints.dart';
import 'package:rent_project/Resuable_card.dart';


class RentalSetting extends StatefulWidget {
  const RentalSetting({Key? key}) : super(key: key);

  @override
  _RentalSettingState createState() => _RentalSettingState();
}

class _RentalSettingState extends State<RentalSetting> {
  Widget listOfSetting(
      {required IconData myIcons, String? settingType, Function()? onPress}) {
    return Padding(
      padding: const EdgeInsets.only(left: 15.0, top: 15.0, bottom: 10.0),
      child: InkWell(
        hoverColor: Colors.blue,
        onTap: onPress,
        child: Row(
          children: [
            Icon(myIcons),
            const SizedBox(
              width: 20.0,
            ),
            Text(
              "$settingType",
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
          child: const Icon(Icons.arrow_back),
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
                      myIcons: Icons.settings,
                      settingType: "General",
                      onPress: () {

                      },
                    ),
                    customDivider(),
                    listOfSetting(
                      myIcons: Icons.subscriptions_rounded,
                      settingType: "Subscription",
                      onPress: () {},
                    ),
                    customDivider(),
                    listOfSetting(
                      myIcons: Icons.help,
                      settingType: "Help Center",
                      onPress: () {},
                    ),
                    customDivider(),
                    listOfSetting(
                      myIcons: Icons.people_alt,
                      settingType: "Organization",
                      onPress: () {},
                    ),
                    customDivider()
                  ],
                ),
              ),
              const SizedBox(
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
                      myIcons: Icons.people_alt,
                      settingType: "Contact Us",
                      onPress: () {},
                    ),
                    customDivider(),
                    listOfSetting(
                      myIcons: Icons.facebook,
                      settingType: "Join Our Facebook",
                      onPress: () {},
                    ),
                    customDivider(),
                    listOfSetting(
                      myIcons: Icons.whatsapp,
                      settingType: "Join Us on WhatsApp",
                      onPress: () {},
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 10.0,
              ),
              const Text(
                "Share",
                style: kBodyTextStyle,
              ),
              ReusableCard(
                containerHeight: MediaQuery.of(context).size.height * 0.18,
                containerWidth: MediaQuery.of(context).size.width,
                colour: kAppBarColor,
                cardChild: Column(
                  children: [
                    listOfSetting(
                      myIcons: Icons.share,
                      settingType: "Tell a Friends",
                      onPress: () {},
                    ),
                    customDivider(),
                    listOfSetting(
                      myIcons: Icons.star,
                      settingType: "Rate US",
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
