extension StringFormattingX on String {
  String _capitalizeFirst() => this[0].toUpperCase() + this.substring(1);

  String toCapitalized() =>
      this.split(" ").map((e) => e._capitalizeFirst()).join(" ");
}
