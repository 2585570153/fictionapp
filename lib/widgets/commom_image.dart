import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';


final networkUriReg = RegExp('^http');
final localUriReg = RegExp('^assets/images');

class CommonImage extends StatelessWidget {
  final String? src;
  final double? width;
  final double? height;
  //布局方式
  // BoxFit.fill: 图像将被拉伸或压缩，以填充容器的整个空间，可能会导致图像的宽高比失真。
  // BoxFit.contain: 图像将按比例缩放，以适应容器的内部，保持图像的宽高比，可能会在容器内留下空白。
  // BoxFit.cover: 图像将按比例缩放，以填充容器的整个空间，同时保持图像的宽高比，可能会超出容器。
  // BoxFit.fitWidth: 图像将按比例缩放，以适应容器的宽度，保持图像的宽高比。
  // BoxFit.fitHeight: 图像将按比例缩放，以适应容器的高度，保持图像的宽高比。
  final BoxFit? fit;
  const CommonImage(
      this.src,
      {Key? key,
      this.width,
      this.height,
      this.fit});

  @override
  Widget build(BuildContext context) {
    if (networkUriReg.hasMatch(src!)) {
  return CachedNetworkImage(
    width: width,
    height: height,
    fit: fit,
    imageUrl: src!,  // 使用 src 变量作为图像链接
    progressIndicatorBuilder: (context, url, downloadProgress) =>
        CircularProgressIndicator(value: downloadProgress.progress),
    errorWidget: (context, url, error) => Icon(Icons.error),
  );
}

    if (localUriReg.hasMatch(src!)) {
      return Image.asset(
        src!,
        width: width,
        height: height,
        fit: fit,
      );
    }
    assert(false, '图片地址src不合法');
    return const Placeholder();
  }
}
