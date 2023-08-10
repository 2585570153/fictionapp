import 'package:fictionapp/widgets/page_content.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: const PageContent(name: "首页"),
    );
  }
}
