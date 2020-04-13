import 'dart:developer';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_masked_text/flutter_masked_text.dart';
import 'package:instacop/src/helpers/TextStyle.dart';
import 'package:instacop/src/helpers/colors_constant.dart';
import 'package:instacop/src/helpers/screen.dart';
import 'package:instacop/src/widgets/box_info.dart';

class CartProductCard extends StatelessWidget {
  CartProductCard(
      {this.id,
      this.productName = '',
      this.productSize = '',
      this.productColor = kColorWhite,
      this.productPrice = 0,
      this.productImage = '',
      this.quantity = '1',
      this.brand,
      this.madeIn,
      this.onQtyChange,
      this.onClose});
  final String productName;
  final Color productColor;
  final String productSize;
  final int productPrice;
  final String productImage;
  final String quantity;
  final String brand;
  final String madeIn;
  final Function onClose;
  final Function onQtyChange;
  final String id;

  @override
  Widget build(BuildContext context) {
    var controller =
        new MaskedTextController(text: '', mask: '000,000,000,000');
    controller.updateText(productPrice.toString());
    String productPriceText = controller.text;
    return Card(
      child: Container(
        height: ConstScreen.setSizeHeight(420),
        child: Padding(
          padding:
              EdgeInsets.symmetric(vertical: ConstScreen.setSizeHeight(15)),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              // TODO: Image Product
              Expanded(
                flex: 4,
                child: Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: ConstScreen.setSizeWidth(20)),
                  child: Stack(
                    children: <Widget>[
                      //TODO: image
                      CachedNetworkImage(
                        imageUrl: productImage,
                        fit: BoxFit.fill,
                        height: ConstScreen.setSizeHeight(400),
                        width: ConstScreen.setSizeWidth(280),
                        placeholder: (context, url) => Container(
                          child: Center(
                            child: CircularProgressIndicator(),
                          ),
                        ),
                        errorWidget: (context, url, error) => Icon(Icons.error),
                      ),
                      Positioned(
                        top: ConstScreen.setSizeWidth(-20),
                        left: ConstScreen.setSizeWidth(-20),
                        child: IconButton(
                          icon: Icon(
                            Icons.close,
                            size: ConstScreen.setSizeWidth(40),
                            color: kColorBlack.withOpacity(0.8),
                          ),
                          onPressed: () {
                            onClose();
                          },
                        ),
                      )
                    ],
                  ),
                ),
              ),
              //TODO: Detail product
              Expanded(
                flex: 6,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    //// TODO: Name Product
                    Expanded(
                      flex: 4,
                      child: Column(
                        children: <Widget>[
                          Align(
                            alignment: Alignment.topLeft,
                            child: AutoSizeText(
                              productName,
                              textAlign: TextAlign.start,
                              maxLines: 2,
                              minFontSize: 15,
                              style: TextStyle(
                                  fontSize: FontSize.setTextSize(36),
                                  color: kColorBlack,
                                  fontWeight: FontWeight.w500),
                            ),
                          ),
                          //TODO: Brand
                          Align(
                            alignment: Alignment.topLeft,
                            child: AutoSizeText(
                              'Brand: $brand',
                              textAlign: TextAlign.start,
                              maxLines: 2,
                              minFontSize: 15,
                              style: TextStyle(
                                  fontSize: FontSize.setTextSize(34),
                                  color: kColorBlack,
                                  fontWeight: FontWeight.w300),
                            ),
                          ),
                          //TODO: Made In
                          Align(
                            alignment: Alignment.topLeft,
                            child: AutoSizeText(
                              'Made in: $madeIn',
                              textAlign: TextAlign.start,
                              maxLines: 2,
                              minFontSize: 15,
                              style: TextStyle(
                                  fontSize: FontSize.setTextSize(34),
                                  color: kColorBlack,
                                  fontWeight: FontWeight.w300),
                            ),
                          ),
                          // TODO: Size, color Product and Quantity
                          Row(
                            children: <Widget>[
                              // TODO: Product Color
                              Expanded(
                                flex: 1,
                                child: BoxInfo(
                                  color: productColor,
                                ),
                              ),
                              SizedBox(
                                width: ConstScreen.setSizeWidth(5),
                              ),
                              // TODO: Product Size
                              Expanded(
                                flex: 1,
                                child: BoxInfo(
                                  sizeProduct: productSize,
                                ),
                              ),
                              SizedBox(
                                width: ConstScreen.setSizeWidth(180),
                              ),
                              Expanded(
                                flex: 3,
                                child: //TODO: quantity
                                    Padding(
                                  padding: EdgeInsets.symmetric(
                                      vertical: ConstScreen.setSizeWidth(25)),
                                  child: TextFormField(
                                    initialValue: quantity,
                                    textAlign: TextAlign.center,
                                    decoration: InputDecoration(
                                      hintText: 'Qty',
                                      hintStyle: kBoldTextStyle.copyWith(
                                          fontSize: FontSize.s28,
                                          fontWeight: FontWeight.w200),
                                      focusColor: Colors.black,
                                    ),
                                    maxLines: 1,
                                    keyboardType: TextInputType.number,
                                    onChanged: (qty) {
                                      onQtyChange(qty);
                                    },
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: ConstScreen.setSizeWidth(5),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Align(
                        alignment: Alignment.bottomRight,
                        child: AutoSizeText(
                          '$productPriceText VND',
                          maxLines: 1,
                          minFontSize: 10,
                          style: TextStyle(
                              fontSize: FontSize.setTextSize(42),
                              color: kColorBlack,
                              fontWeight: FontWeight.w400),
                          textAlign: TextAlign.end,
                        ),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
// TODO: Quantity
//                      Row(
//                        mainAxisAlignment: MainAxisAlignment.center,
//                        children: <Widget>[
//                          // TODO: Quantity Down Button
//                          Container(
//                            height: ConstScreen.setSizeHeight(60),
//                            width: ConstScreen.setSizeHeight(80),
//                            decoration: BoxDecoration(
//                              border: Border.all(
//                                  color: kColorBlack.withOpacity(0.6)),
//                              borderRadius: BorderRadius.horizontal(
//                                left: Radius.circular(20),
//                              ),
//                            ),
//                            //TODO: DOWN
//                            child: Center(
//                              child: IconButton(
//                                icon: Icon(
//                                  Icons.arrow_back_ios,
//                                ),
//                                iconSize: ConstScreen.setSizeWidth(25),
//                                onPressed: () => onDismissed(counter),
//                              ),
//                            ),
//                          ),
//                          //TODO: Quantity value
//                          Container(
//                            height: ConstScreen.setSizeHeight(60),
//                            width: ConstScreen.setSizeHeight(200),
//                            decoration: BoxDecoration(
//                                border: Border(
//                              top: BorderSide(
//                                  color: kColorBlack.withOpacity(0.6)),
//                              bottom: BorderSide(
//                                  color: kColorBlack.withOpacity(0.6)),
//                            )),
//                            child: Center(
//                              child: Text(
//                                '0',
//                                style: TextStyle(fontSize: FontSize.s28),
//                              ),
//                            ),
//                          ),
//                          // TODO: Quantity Up Button
//                          Container(
//                            height: ConstScreen.setSizeHeight(60),
//                            width: ConstScreen.setSizeHeight(80),
//                            decoration: BoxDecoration(
//                              border: Border.all(
//                                color: kColorBlack.withOpacity(0.6),
//                              ),
//                              borderRadius: BorderRadius.horizontal(
//                                right: Radius.circular(20),
//                              ),
//                            ),
//                            //TODO: UP
//                            child: Center(
//                              child: IconButton(
//                                icon: Icon(
//                                  Icons.arrow_forward_ios,
//                                ),
//                                iconSize: ConstScreen.setSizeWidth(25),
//                                onPressed: () => onDecrement(counter),
//                              ),
//                            ),
//                          ),
//                        ],
//                      ),
