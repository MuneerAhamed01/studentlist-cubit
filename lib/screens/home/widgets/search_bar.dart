import 'package:flutter/material.dart';

class SearchBar extends StatelessWidget {
  const SearchBar({
    Key? key,
    required this.onChanged
  }) : super(key: key);
  final void Function(String)? onChanged;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 176, left: 4, right: 4),
      child: SizedBox(
        child: TextField(
          onChanged: onChanged,
          cursorColor: Colors.black,
          style: const TextStyle(height: 0.8),
          decoration: deocrationSearchBar(),
        ),
      ),
    );
  }

  InputDecoration deocrationSearchBar() {
    return InputDecoration(
        // prefixIconColor: Colors.black,
        enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.transparent),
            borderRadius: BorderRadius.circular(15)),
        focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.transparent),
            borderRadius: BorderRadius.circular(15)),
        prefixIcon: const Icon(
          Icons.search,
          color: Colors.black,
        ),
        border: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.white),
          borderRadius: BorderRadius.circular(15),
        ),
        filled: true,
        hintStyle: TextStyle(
          color: Colors.grey[800],
          fontSize: 14,
        ),
        hintText: "Search",
        fillColor: Colors.white);
  }
}
