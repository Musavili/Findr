import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/screens/chat/calls_page.dart';
import 'package:flutter_app/screens/chat/contacts_page.dart';
import 'package:flutter_app/screens/chat/messages.dart';
import 'package:flutter_app/screens/chat/notifications_page.dart';
import 'package:flutter_app/screens/chat/profile_screen.dart';
import 'package:flutter_app/theme.dart';
import 'package:flutter_app/widget/glowing_action_button.dart';
import 'package:flutter_app/widget/icon_buttons.dart';
import 'package:flutter_app/app.dart';

import '../../helpers.dart';
import '../../widget/widgets.dart';



class HomeChat extends StatelessWidget {
  HomeChat({Key? key}) : super(key: key);

  final ValueNotifier<int> pageIndex = ValueNotifier(0);
  final ValueNotifier<String > title = ValueNotifier('Messages');
  //notifies when value changes

  final pages = const[
    Messages(),
    Notifications(),
    Calls(),
    Contacts(),
  ];

  final pageTitles = [
    'Messages',
    'Notifications',
    'Calls',
    'Contacts'
  ];

  void _onNavigationItemSelected(index) {
    title.value = pageTitles[index];
    pageIndex.value = index;
  }

  @override
  Widget build(BuildContext context) {
    //pageIndex.addListener(() {});
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        iconTheme: Theme.of(context).iconTheme,//defined in our theme class
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: ValueListenableBuilder(
          valueListenable: title,
          builder: (BuildContext context, String value, _){
            //build context, value, child widget
            return Text(
              value,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            );
          },
        ),
        leading: Align(
          alignment: Alignment.centerRight,
          child: IconBackground(
            icon: Icons.search,
            onTap: (){
               print('TODO SEARCH');
            },
          ),
        ),
        actions: [Padding(
          padding: const EdgeInsets.only(right: 24.0),
          child: Hero(
            tag: 'hero-profile-picture',
            child: Avatar.small(
              url:context.currentUserImage,
              onTap: (){
                Navigator.of(context).push(ProfileScreen.route);
              },
            ),
          ),
        )],
      ),
      body: ValueListenableBuilder(
        valueListenable: pageIndex,
        builder: (BuildContext context, int value, _){
          return pages[value];
        },
      ),
      bottomNavigationBar: _BottomNavigationBar(
        onItemSelected: _onNavigationItemSelected,
      ),
    );
  }
}

class _BottomNavigationBar extends StatefulWidget {
  const _BottomNavigationBar({
    Key? key,
    required this.onItemSelected,
  }) : super(key: key);

  final ValueChanged<int> onItemSelected;
  @override
  __BottomNavigationBarState createState() => __BottomNavigationBarState();
}

class __BottomNavigationBarState extends State<_BottomNavigationBar> {
  var selectedIndex = 0;

  void handleItemSelected(int index) {
    setState(() {
      selectedIndex = index;
    });
    widget.onItemSelected(index);
  }

  @override
  Widget build(BuildContext context) {
    final brightness =  Theme.of(context).brightness;
    return Card(
      color: (brightness == Brightness.light) ?Colors.transparent: null,
      elevation: 0,
      child: SafeArea(
        top: false,
        bottom: true,
        child: Padding(
          padding: const EdgeInsets.only(top: 16, left: 8, right: 8, bottom: 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _NavigationBarItem(
                index: 0,
                label: 'messages',
                icon: CupertinoIcons.bubble_left_bubble_right_fill,
                isSelected: (selectedIndex == 0),
                onTap: handleItemSelected,
              ),
              _NavigationBarItem(
                index: 1,
                label: 'notifications',
                icon: CupertinoIcons.bell_solid,
                isSelected: (selectedIndex == 1),
                onTap: handleItemSelected,
              ),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 4.0),
                child: GlowingActionButton(
                    color: AppColors.secondary,
                    icon: CupertinoIcons.add,
                    onPressed: (){
                      showDialog(
                        context: context,
                        builder: (BuildContext context) => const Dialog(
                          child: AspectRatio(
                            aspectRatio: 8 / 7,
                            child: Contacts(),
                          ),
                        ),
                      );
                    }
                ),
              ),

              _NavigationBarItem(
                index: 2,
                label: 'calls',
                icon: CupertinoIcons.phone_fill,
                isSelected: (selectedIndex == 2),
                onTap: handleItemSelected,
              ),
              _NavigationBarItem(
                index: 3,
                label: 'contacts',
                icon: CupertinoIcons.person_2,
                isSelected: (selectedIndex == 3),
                onTap: handleItemSelected,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _NavigationBarItem extends StatelessWidget {
  const _NavigationBarItem({
    Key? key,
    required this.index,
    required this.label,
    required this.icon,
    this.isSelected = false,
    required this.onTap,
  }) : super(key: key);

  final int index;
  final String label;
  final IconData icon;
  final bool isSelected;
  final ValueChanged<int> onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: (){
        onTap(index);
      },
      child: SizedBox(
        //height: 60,
        width: 70,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              icon,
              size: 20,
              color: isSelected? AppColors.secondary: null,),
            SizedBox(height: 8),
            Text(label,
                style: isSelected
                    ? const TextStyle(
                    fontSize: 11,
                    fontWeight: FontWeight.bold,
                    color: AppColors.secondary,
                    )
                    :const TextStyle(fontSize: 11),
            ),
          ],
        ),
      ),
    );
  }
}

