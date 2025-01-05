// ignore_for_file: deprecated_member_use, prefer_final_fields, unused_field
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:innbucks/data/model/response/category_wise_product.dart';
import 'package:innbucks/data/model/response/top12productsResponse.dart';
import 'package:innbucks/helper/shimmer_helper.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () async {},
      child: CustomScrollView(
        slivers: [],
      ),
    );
  }
}
