extension DurationFormat on Duration {
  String compact() {
    if (inDays >= 7) return "${(inDays / 7).round()}w";
    if (inHours >= 24) return "${inDays}d";
    return "${inHours}h";
  }
}
