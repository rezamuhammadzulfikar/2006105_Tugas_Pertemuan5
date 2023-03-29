import 'package:flutter/material.dart';

class NewsDetailScreen extends StatefulWidget {
  const NewsDetailScreen({super.key, required this.newsId});

  final String newsId;

  @override
  State<NewsDetailScreen> createState() => _NewsDetailScreenState();
}

// class _NewsDetailScreenState extends State<NewsDetailScreen> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Center(
//         child: Text(
//           widget.newsId,
//         ),
//       ),
//     );
//   }
// }
class _NewsDetailScreenState extends State<NewsDetailScreen> {
  int like = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "F L U T T E R",
        ),
      ),
      body: Column(children: [
        Image.network(
          "https://picsum.photos/300",
          width: double.infinity,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 20,
              ),
              const Text(
                "F L U T T E R",
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 28,
              ),
              const Text(
                'merupakan sebuah platform yang umumnya digunakan oleh para pengembang aplikasi untuk membantu mereka membuat aplikasi multiplatform namun hanya dengan satu basis coding. Aplikasi yang dihasilkan jika para developer menggunakan Flutter akan dapat digunakan di berbagai platform seperti Android, iOS, Website maupun desktop.',
                textAlign: TextAlign.justify,
              ),
              const SizedBox(height: 10),
              Row(
                children: [
                  const Icon(
                    Icons.favorite,
                    color: Color.fromRGBO(246, 219, 17, 1),
                  ),
                  const SizedBox(height: 20),
                  Text(' Like : $like')
                ],
              )
            ],
          ),
        ),
      ]),
      floatingActionButton: FloatingActionButton.small(
        hoverColor: Colors.black,
        onPressed: () {
          setState(() {
            like++;
          });
          print(like);
        },
        child: const Icon(Icons.favorite),
      ),
    );
  }
}
