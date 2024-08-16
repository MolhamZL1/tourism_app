import 'package:flutter/material.dart';
import 'package:tourism_app/features/Books/presentation/views/widgets/books_view_body.dart';

class BooksView extends StatelessWidget {
  const BooksView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: BooksViewBody(),
    );
  }
}
