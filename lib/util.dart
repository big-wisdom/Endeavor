extension ListExtension<T> on List<T> {
  List<T> reorderedCopy(int oldIndex, int newIndex) {
    List<T> copiedList = [...this];
    if (oldIndex < newIndex) {
      newIndex -= 1;
    }
    // remove the item from its present index
    final T itemToMove = copiedList.removeAt(oldIndex);

    // insert it at the new index
    copiedList.insert(newIndex, itemToMove);

    return copiedList;
  }
}
