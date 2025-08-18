

import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';

extension SizedBoxExtention on num {

  SizedBox get height => SizedBox(height:  toDouble(),);

  SizedBox get width => SizedBox(width:  toDouble(),);
}


extension IndexExtention on int{

  String get seperatedWithComa{

    final numFormat = NumberFormat.decimalPattern();
    
    return numFormat.format(this);
  }
}