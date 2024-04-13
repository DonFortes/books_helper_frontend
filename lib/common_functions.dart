bool isInt(String str) {
  try {
    int.parse(str);
    return true;
  } catch (e) {
    return false;
  }
}
