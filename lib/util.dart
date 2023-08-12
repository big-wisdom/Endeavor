extension ListExtension on List {
  void reorder(int oldIndex, int newIndex) {
    if (oldIndex < newIndex) {
      newIndex -= 1;
    }
    // remove the item from its present index
    final String itemToMove = removeAt(oldIndex);

    // insert it at the new index
    insert(newIndex, itemToMove);
  }
}
