import 'dart:math';

List<T> getRandomItems<T>({
  required List<T> items, int count = 4,
}) {
  List<T> randItems = [];

  for (int i = 0; i < count;) {
    int randomIndex = Random().nextInt(items.length);

    if (randItems.contains(items[randomIndex])) {
      continue;
    }

    randItems.add(items[randomIndex]);
    i++;
  }

  return randItems;
}