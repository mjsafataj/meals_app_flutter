import 'package:flutter/material.dart';

enum DrawerSelectedItem { meals, filters }

class MainDrawer extends StatelessWidget {
  const MainDrawer({required this.selectDrawerItem,super.key});

  final void Function(DrawerSelectedItem) selectDrawerItem;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Drawer(
      child: Column(
        children: [
          DrawerHeader(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  colorScheme.primaryContainer,
                  colorScheme.primaryContainer.withOpacity(0.8)
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
            child: Row(
              children: [
                Icon(
                  Icons.fastfood,
                  size: 48,
                  color: colorScheme.primary,
                ),
                const SizedBox(width: 18),
                Text(
                  'Cooking Up!',
                  style: theme.textTheme.titleLarge!.copyWith(
                    color: colorScheme.primary,
                  ),
                )
              ],
            ),
          ),
          ListTile(
            leading: Icon(
              size: 26,
              Icons.restaurant,
              color: colorScheme.onBackground,
            ),
            title: Text('Meals',
                style: theme.textTheme.titleSmall!.copyWith(
                  color: colorScheme.onBackground,
                  fontSize: 24,
                )),
            onTap: () {selectDrawerItem(DrawerSelectedItem.meals);},
          ),
          ListTile(
            leading: Icon(
              size: 26,
              Icons.filter_alt,
              color: colorScheme.onBackground,
            ),
            title: Text('Filters',
                style: theme.textTheme.titleSmall!.copyWith(
                  color: colorScheme.onBackground,
                  fontSize: 24,
                )),
            onTap: () {selectDrawerItem(DrawerSelectedItem.filters);},
          ),
        ],
      ),
    );
  }
}
