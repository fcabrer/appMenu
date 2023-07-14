import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:widgets_app/config/menu/menu_items.dart';
import 'package:widgets_app/presentation/widgets/side_menu.dart';

class HomeScreen extends StatelessWidget {
  static const String name = 'home_screen';

  HomeScreen({super.key});

  final scaffoldKey =
      GlobalKey<ScaffoldState>(); //para cerrar el menu al volver de un widget

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key:
            scaffoldKey, //llamo a la clase //este scaffold tiene todo los parametros

        appBar: AppBar(
          title: const Text('Flutter + Material 3'),
        ),
        body: const _HomeView(),
        drawer: SideMenu(scaffoldKey: scaffoldKey));
  }
}

class _HomeView extends StatelessWidget {
  const _HomeView();

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: appMenuItem.length,
      itemBuilder: (context, index) {
        final menuItem = appMenuItem[index];

        return _CustomListTile(menuItem: menuItem);
      },
    );
  }
}

class _CustomListTile extends StatelessWidget {
  const _CustomListTile({
    required this.menuItem,
  });

  final MenuItem menuItem;

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme; //escribir theme-of-con....

    return ListTile(
        leading: Icon(menuItem.icon, color: colors.primary),
        trailing: Icon(Icons.arrow_forward_ios_rounded, color: colors.primary),
        title: Text(menuItem.title),
        subtitle: Text(menuItem.subTitle),
        onTap: () {
          context.push(menuItem.link); //go router llama con pads
          //context.pushNamed(CardsScreen.name) llama con el nombre pero solo uno
        });
  }
}
