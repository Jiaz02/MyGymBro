class RowRepKg {
  RowRepKg({required this.repes, required this.kg});

  int repes = 0;
  int kg = 0;

  int get getRepes => this.repes;

  int get getKg => this.kg;

  @override
  String toString() {
    // TODO: implement toString
    return '$repes x $kg';
  }
}
