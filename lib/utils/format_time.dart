String formatTime(int sec) {
  String resultFormat;
  final duration = Duration(seconds: sec);
  int hours = duration.inHours;
  int min = duration.inMinutes;
  int seconds = duration.inSeconds;
  if (sec > 3600) {
    resultFormat = "$hours:$min:$seconds";
  } else {
    resultFormat = "$min:$seconds";
  }
  return resultFormat;
}
