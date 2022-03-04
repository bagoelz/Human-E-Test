
import 'package:flutter/material.dart';

class FeedSearchBox extends StatelessWidget {
  const FeedSearchBox({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          Expanded(
            child: TextField(
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  hintText: 'Search',
                  suffixIcon:
                      Icon(Icons.search, color: Theme.of(context).primaryColor),
                  contentPadding:
                      const EdgeInsets.only(left: 20.0, bottom: 5.0, top: 12.5),
                  focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.white),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: const  BorderSide(color: Colors.white),
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                onChanged: (value) {}),
          ),
        ],
      ),
    );
  }
}