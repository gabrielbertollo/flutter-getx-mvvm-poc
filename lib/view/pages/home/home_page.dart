import 'package:flutter/material.dart';
import 'package:flutter_getx_mvvm_poc/model/entities/post.dart';
import 'package:flutter_getx_mvvm_poc/view/pages/home/home_controller.dart';
import 'package:flutter_getx_mvvm_poc/view/pages/home/widgets/change_location_widget.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:get/get.dart';

import '../../widgets/post_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final HomeController homeController = Get.find();
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.appBarWelcomeMessage),
        actions: const [
          ChangeLocationWidget(),
        ],
      ),
      body: SafeArea(
        child: Obx(() {
          if (homeController.posts.isEmpty) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          return ListView.builder(
            itemCount: homeController.posts.length,
            itemBuilder: (context, index) {
              final post = homeController.posts[index];
              return PostWidget(post: post);
            },
          );
        }),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          var newPost = await Get.toNamed('/create_post');
          if (newPost != null && newPost is Post) {
            homeController.addPostLocally(
              post: newPost,
              posts: homeController.posts,
            );
          }
          Get.showSnackbar(
            const GetSnackBar(
              message: 'Post added! 🎉',
              backgroundColor: Colors.green,
              duration: Duration(seconds: 4),
              snackStyle: SnackStyle.GROUNDED,
            ),
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
