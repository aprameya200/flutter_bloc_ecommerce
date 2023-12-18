import 'package:auto_size_text/auto_size_text.dart';
import 'package:bloc_e_commerce/features/item/bloc/item_bloc.dart';
import 'package:bloc_e_commerce/features/item/ui/bottom_sheet.dart';
import 'package:bloc_e_commerce/features/item/ui/button_widget.dart';
import 'package:bloc_e_commerce/features/item/ui/item_app_bar.dart';
import 'package:bloc_e_commerce/features/item/ui/item_body.dart';
import 'package:bloc_e_commerce/helpers/helper.dart';
import 'package:bloc_e_commerce/helpers/state_helper.dart';
import 'package:bloc_e_commerce/models/product_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/constants.dart';
import '../../../models/category_model.dart';
import '../../home/ui/bar_menu_widget.dart';

class ItemPage extends StatefulWidget {
  const ItemPage({super.key, required this.item});

  final ProductModel item;

  @override
  State<ItemPage> createState() => _ItemPageState();
}

class _ItemPageState extends State<ItemPage> {
  final ItemBloc itemBloc = ItemBloc();

  @override
  void initState() {
    super.initState();
    itemBloc.add(ItemInitialEvent());
  }

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    ProductModel item = widget.item;

    return BlocConsumer<ItemBloc, ItemState>(
      bloc: itemBloc,
      listenWhen: (previous, current) => current is ItemActionsState,
      buildWhen: (previous, current) => current is! ItemActionsState,
      listener: (context, state) {},
      builder: (context, state) {
        if (ItemStateHelper.isValidItemState(state)) {
          int  quantity = 0;

          if (state is ItemLoadedSuccessState) {
            quantity = state.quantity;
          }
          if (state is ItemAddQuantityActionState) { //this may not be needed
            quantity = state.quantity;
          }
          if (state is ItemSubtractQuantityActionState) { // this may not be needed
            quantity = state.quantity;
          }

          return Scaffold(
            appBar: AppBar(
              systemOverlayStyle: SystemUiOverlayStyle(
                systemNavigationBarColor: colorRed,
                statusBarColor: colorBakgroundWhite, // Set the color you want
                // Set the color you want
              ),
              automaticallyImplyLeading: false,
              backgroundColor: colorBakgroundWhite,
              title: const ItemAppBar(),
            ),
            body: ItemBody(
              screenHeight: screenHeight,
              item: item,
            ),
            bottomSheet: BottomSheetWidget(
              screenHeight: screenHeight,
              item: item,
              itembloc: itemBloc,
              quantity: quantity,
              screenWidth: screenWidth,
            ),
          );
        } else {
          return const Scaffold(body: Text("Null"));
        }
      },
    );
  }
}
