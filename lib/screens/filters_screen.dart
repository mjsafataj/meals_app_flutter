import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals/providers/filter_provider.dart';

enum Filters { gultenFree, lactoseFree, vegetarian, vegan }

class FiltersScreen extends ConsumerWidget {
  const FiltersScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final filters = ref.watch(filterProvider);
    final filterNotifier = ref.read(filterProvider.notifier);

    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Your filters'),
      ),
      body: Column(
        children: [
          SwitchListTile(
            value: filters[Filters.gultenFree]!,
            onChanged: (isChecked) {
              filterNotifier.changeFilter(Filters.gultenFree, isChecked);
            },
            title: Text(
              "Gluten-free",
              style: textTheme.titleLarge!
                  .copyWith(color: colorScheme.onBackground),
            ),
            subtitle: Text(
              'Only contains gluten-free meals.',
              style: textTheme.bodyMedium!
                  .copyWith(color: colorScheme.onBackground),
            ),
            activeColor: colorScheme.tertiary,
            contentPadding: const EdgeInsets.only(left: 34, right: 22),
          ),
          SwitchListTile(
            value: filters[Filters.lactoseFree]!,
            onChanged: (isChecked) {
              filterNotifier.changeFilter(Filters.lactoseFree, isChecked);
            },
            title: Text(
              "Lactose-free",
              style: textTheme.titleLarge!
                  .copyWith(color: colorScheme.onBackground),
            ),
            subtitle: Text(
              'Only contains Lactose-free meals.',
              style: textTheme.bodyMedium!
                  .copyWith(color: colorScheme.onBackground),
            ),
            activeColor: colorScheme.tertiary,
            contentPadding: const EdgeInsets.only(left: 34, right: 22),
          ),
          SwitchListTile(
            value: filters[Filters.vegetarian]!,
            onChanged: (isChecked) {
              filterNotifier.changeFilter(Filters.vegetarian, isChecked);
            },
            title: Text(
              "Vegetarian",
              style: textTheme.titleLarge!
                  .copyWith(color: colorScheme.onBackground),
            ),
            subtitle: Text(
              'Only contains vegetarian meals.',
              style: textTheme.bodyMedium!
                  .copyWith(color: colorScheme.onBackground),
            ),
            activeColor: colorScheme.tertiary,
            contentPadding: const EdgeInsets.only(left: 34, right: 22),
          ),
          SwitchListTile(
            value: filters[Filters.vegan]!,
            onChanged: (isChecked) {
              filterNotifier.changeFilter(Filters.vegan, isChecked);
            },
            title: Text(
              "Vegan",
              style: textTheme.titleLarge!
                  .copyWith(color: colorScheme.onBackground),
            ),
            subtitle: Text(
              'Only contains Vegan meals.',
              style: textTheme.bodyMedium!
                  .copyWith(color: colorScheme.onBackground),
            ),
            activeColor: colorScheme.tertiary,
            contentPadding: const EdgeInsets.only(left: 34, right: 22),
          ),
        ],
      ),
    );
  }
}
