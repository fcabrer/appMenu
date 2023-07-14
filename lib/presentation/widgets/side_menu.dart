import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:widgets_app/config/menu/menu_items.dart';

class SideMenu extends StatefulWidget {
  final GlobalKey<ScaffoldState> scaffoldKey;

  const SideMenu({super.key, required this.scaffoldKey});
  @override
  State<SideMenu> createState() => _SideMenuState();
}

int navDrawerIndex = 0;

class _SideMenuState extends State<SideMenu> {
  @override
  Widget build(BuildContext context) {
    final hasNotch = MediaQuery.of(context).viewPadding.top > 35;
//si el padding es mayor a 35 es por que tenemos un notch (barrita negra en top)
    return NavigationDrawer(
        //para seleccionar los items
        selectedIndex: navDrawerIndex,
        onDestinationSelected: (value) {
          setState(() {
            navDrawerIndex = (value);
          });

          //funcionalidad al menu
          final menuItem = appMenuItem[value]; //selecciona los item
          context.push(menuItem.link);
          widget.scaffoldKey.currentState?.closeDrawer(); //empuja los links
        },
        children: [
          Padding(
            //condicion para colocar padding si tiene notch
            //si tiene notch colocamos 10 sino 20
            padding: EdgeInsets.fromLTRB(28, hasNotch ? 10 : 20, 16, 10),
            child: const Text('hola mundo'),
          ),
          ...appMenuItem.sublist(0, 3).map(
                //mapear cada widget
                (item) => NavigationDrawerDestination(
                  icon: Icon(item.icon),
                  label: Text(item.title),
                ),
              ),
          const Padding(
            padding: EdgeInsets.fromLTRB(28, 16, 16, 10),
            child: Divider(),
          ),
          ...appMenuItem.sublist(3).map(
                //mapear cada widget
                (item) => NavigationDrawerDestination(
                  icon: Icon(item.icon),
                  label: Text(item.title),
                ),
              ),
        ]);
  }
}
