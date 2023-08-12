extension ListExtension<T> on List<T> {
  void reorder(int oldIndex, int newIndex) {
    if (oldIndex < newIndex) {
      newIndex -= 1;
    }
    // remove the item from its present index
    final T itemToMove = removeAt(oldIndex);

    // insert it at the new index
    insert(newIndex, itemToMove);
  }
}
