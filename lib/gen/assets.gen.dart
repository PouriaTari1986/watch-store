// dart format width=80

/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: deprecated_member_use,directives_ordering,implicit_dynamic_list_literal,unnecessary_import

import 'package:flutter/widgets.dart';

class $AssetsPngGen {
  const $AssetsPngGen();

  /// File path: assets/png/aiW.png
  AssetGenImage get aiW => const AssetGenImage('assets/png/aiW.png');

  /// File path: assets/png/classicW.png
  AssetGenImage get classicW => const AssetGenImage('assets/png/classicW.png');

  /// File path: assets/png/digital.png
  AssetGenImage get digital => const AssetGenImage('assets/png/digital.png');

  /// File path: assets/png/table.png
  AssetGenImage get table => const AssetGenImage('assets/png/table.png');

  /// File path: assets/png/user.png
  AssetGenImage get user => const AssetGenImage('assets/png/user.png');

  /// File path: assets/png/whatch store.png
  AssetGenImage get whatchStore =>
      const AssetGenImage('assets/png/whatch store.png');

  /// List of all assets
  List<AssetGenImage> get values => [
    aiW,
    classicW,
    digital,
    table,
    user,
    whatchStore,
  ];
}

class $AssetsSvgGen {
  const $AssetsSvgGen();

  /// File path: assets/svg/Vector.svg
  String get vector => 'assets/svg/Vector.svg';

  /// File path: assets/svg/arrow left.svg
  String get arrowLeft => 'assets/svg/arrow left.svg';

  /// File path: assets/svg/card.svg
  String get card => 'assets/svg/card.svg';

  /// File path: assets/svg/close.svg
  String get close => 'assets/svg/close.svg';

  /// File path: assets/svg/home-hashtag.svg
  String get homeHashtag => 'assets/svg/home-hashtag.svg';

  /// File path: assets/svg/list.svg
  String get list => 'assets/svg/list.svg';

  /// File path: assets/svg/minus.svg
  String get minus => 'assets/svg/minus.svg';

  /// File path: assets/svg/plus.svg
  String get plus => 'assets/svg/plus.svg';

  /// File path: assets/svg/recycleBin.svg
  String get recycleBin => 'assets/svg/recycleBin.svg';

  /// File path: assets/svg/search-normal.svg
  String get searchNormal => 'assets/svg/search-normal.svg';

  /// File path: assets/svg/shopping bascket.svg
  String get shoppingBascket => 'assets/svg/shopping bascket.svg';

  /// File path: assets/svg/user.svg
  String get user => 'assets/svg/user.svg';

  /// File path: assets/svg/vuesax-linear-call.svg
  String get vuesaxLinearCall => 'assets/svg/vuesax-linear-call.svg';

  /// List of all assets
  List<String> get values => [
    vector,
    arrowLeft,
    card,
    close,
    homeHashtag,
    list,
    minus,
    plus,
    recycleBin,
    searchNormal,
    shoppingBascket,
    user,
    vuesaxLinearCall,
  ];
}

class Assets {
  const Assets._();

  static const $AssetsPngGen png = $AssetsPngGen();
  static const $AssetsSvgGen svg = $AssetsSvgGen();
}

class AssetGenImage {
  const AssetGenImage(
    this._assetName, {
    this.size,
    this.flavors = const {},
    this.animation,
  });

  final String _assetName;

  final Size? size;
  final Set<String> flavors;
  final AssetGenImageAnimation? animation;

  Image image({
    Key? key,
    AssetBundle? bundle,
    ImageFrameBuilder? frameBuilder,
    ImageErrorWidgetBuilder? errorBuilder,
    String? semanticLabel,
    bool excludeFromSemantics = false,
    double? scale,
    double? width,
    double? height,
    Color? color,
    Animation<double>? opacity,
    BlendMode? colorBlendMode,
    BoxFit? fit,
    AlignmentGeometry alignment = Alignment.center,
    ImageRepeat repeat = ImageRepeat.noRepeat,
    Rect? centerSlice,
    bool matchTextDirection = false,
    bool gaplessPlayback = true,
    bool isAntiAlias = false,
    String? package,
    FilterQuality filterQuality = FilterQuality.medium,
    int? cacheWidth,
    int? cacheHeight,
  }) {
    return Image.asset(
      _assetName,
      key: key,
      bundle: bundle,
      frameBuilder: frameBuilder,
      errorBuilder: errorBuilder,
      semanticLabel: semanticLabel,
      excludeFromSemantics: excludeFromSemantics,
      scale: scale,
      width: width,
      height: height,
      color: color,
      opacity: opacity,
      colorBlendMode: colorBlendMode,
      fit: fit,
      alignment: alignment,
      repeat: repeat,
      centerSlice: centerSlice,
      matchTextDirection: matchTextDirection,
      gaplessPlayback: gaplessPlayback,
      isAntiAlias: isAntiAlias,
      package: package,
      filterQuality: filterQuality,
      cacheWidth: cacheWidth,
      cacheHeight: cacheHeight,
    );
  }

  ImageProvider provider({AssetBundle? bundle, String? package}) {
    return AssetImage(_assetName, bundle: bundle, package: package);
  }

  String get path => _assetName;

  String get keyName => _assetName;
}

class AssetGenImageAnimation {
  const AssetGenImageAnimation({
    required this.isAnimation,
    required this.duration,
    required this.frames,
  });

  final bool isAnimation;
  final Duration duration;
  final int frames;
}
