// ignore_for_file: public_member_api_docs, sort_constructors_first
// ignore_for_file: camel_case_types, prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'package:e_commerce_comic/models/comic_model.dart';

import '../../utils/constants.dart';

// ignore: must_be_immutable
class CardItem extends StatefulWidget {
  CardItem({Key? key, required this.data, this.isFavotite = false})
      : super(key: key);
  final ComicModelDatum data;
  bool isFavotite;
  @override
  State<CardItem> createState() => _CardItemState();
}

class _CardItemState extends State<CardItem> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Container(
              width: MediaQuery.of(context).size.width,
              clipBehavior: Clip.antiAlias,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(
                    "${Constant.baseUrl}${widget.data.attributes.images.data[0].attributes.url}",
                  ),
                  fit: BoxFit.cover,
                ),
                borderRadius: const BorderRadius.all(
                  Radius.circular(
                    6.0,
                  ),
                ),
              ),
              child: Stack(
                children: [
                  Positioned(
                    right: 6.0,
                    top: 8.0,
                    child: CircleAvatar(
                        radius: 14.0,
                        backgroundColor: Colors.white,
                        child: IconButton(
                          onPressed: () {
                            widget.isFavotite = !widget.isFavotite;
                            setState(() {});
                          },
                          icon: Icon(
                            Icons.favorite,
                            color: widget.isFavotite ? Colors.red : Colors.grey,
                            size: 14.0,
                          ),
                        )),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 8.0,
          ),
          Text(
            widget.data.attributes.comicName,
            style: const TextStyle(
              fontSize: 16.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(
            height: 4.0,
          ),
          Text(
            widget.data.attributes.author.data.attributes.name,
            style: const TextStyle(
              fontSize: 12.0,
            ),
          ),
          const SizedBox(
            height: 4.0,
          ),
          Text(
            NumberFormat.currency(
                    locale: 'id', symbol: 'IDR ', decimalDigits: 0)
                .format(
              double.tryParse(widget.data.attributes.price),
            ),
            style: const TextStyle(
              fontSize: 16.0,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
