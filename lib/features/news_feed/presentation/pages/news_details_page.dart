import 'package:coding_challenge/features/news_feed/data/models/news_model.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter/material.dart';

class NewsDetailsPage extends StatelessWidget {
  const NewsDetailsPage({Key? key, required this.model}) : super(key: key);

  final NewsModel model;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.close),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(model.title ?? ''),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 200,
              width: double.infinity,
              child: model.urlToImage != null
                  ? Image.network(
                      model.urlToImage!,
                      fit: BoxFit.cover,
                    )
                  : const Icon(Icons.no_photography),
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Text(model.description ?? ''),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: ElevatedButton.icon(
                label: const Text(
                  'Read More',
                  style: TextStyle(color: Colors.white),
                ),
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  primary: Colors.green,
                ),
                onPressed: () async {
                  if (await canLaunch(model.url!)) {
                    await launch(
                      model.url!,
                      forceSafariVC: true,
                      forceWebView: true,
                      enableJavaScript: true,
                    );
                  } else {
                    ScaffoldMessenger.of(context)
                      ..hideCurrentSnackBar()
                      ..showSnackBar(
                        const SnackBar(content: Text('Link unavailable')),
                      );
                  }
                },
                icon: const Icon(Icons.read_more),
              ),
            )
          ],
        ),
      ),
    );
  }
}
