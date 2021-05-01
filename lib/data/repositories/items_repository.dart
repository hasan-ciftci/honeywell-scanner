class ItemsRepository {
  List<String> _currentDirectory = ["items"];

  forwardOnDirectory(String newDirectory) {
    _currentDirectory.add(newDirectory);
  }

  backwardOnDirectory() {
    _currentDirectory.removeLast();
  }

  getCurrentDirectory() {
    String currentDirectory = _currentDirectory.join("/");
    print(currentDirectory);
  }
}
