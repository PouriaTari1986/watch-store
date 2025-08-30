String formatTime(int sec) {
  String resultFormat;
  final duration = Duration(seconds: sec);
  int hours = duration.inHours.remainder(24);
  int min = duration.inMinutes.remainder(60);
  int seconds = duration.inSeconds.remainder(60);
  if (sec >= 3600) {
    resultFormat = "$hours:$min:$seconds";
  } else {
    resultFormat = "$min:$seconds";
  }
  return resultFormat;

}
