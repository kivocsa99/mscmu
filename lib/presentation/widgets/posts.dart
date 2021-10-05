import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:motion_toast/motion_toast.dart';
import 'package:motion_toast/resources/arrays.dart';
import '../../application/provider/current_user.provider.dart';
import '../../navigate.dart';
import '../screens/add_post_screen.dart';
import 'package:photo_view/photo_view.dart';
import '../../application/provider/posts.repository.provider.dart';
import '../../application/provider/sharedpref/pref_provider.dart';
import '../../domain/models/postmodel.dart';
import 'shimmer_affect.dart';

class Posts extends HookWidget {
  const Posts({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final current = useProvider(currentUserProvider);
    final prefs = useProvider(sharedPreferences);
    final scrollcontoller = useScrollController();
    final adminavatar = useState("");
    final adminame = useState("");
    final adminyear = useState(0);

    return Column(
      children: [
        const Text(
          "NewsFeed",
          style: TextStyle(
              fontSize: 20, color: Colors.black, fontWeight: FontWeight.bold),
        ),
        const SizedBox(
          height: 10,
        ),
        current.maybeWhen(
            data: (user) {
              adminyear.value = user.yearid!;
              adminame.value = user.name!;
              adminavatar.value = user.avatar!;

              return SizedBox(
                width: 40,
                height: 40,
                child: FittedBox(
                  child: FloatingActionButton(
                    heroTag: "post",
                    child: const Icon(Icons.add),
                    onPressed: () async {
                      if (user.accepted == true) {
                        changeScreen(
                            context,
                            AddPostScreen(
                              avatar: adminavatar.value,
                              name: adminame.value,
                              yearid: adminyear.value,
                            ));
                      } else {
                        MotionToast.error(
                                position: MOTION_TOAST_POSITION.TOP,
                                animationType: ANIMATION.FROM_TOP,
                                title: "Permission Denied",
                                titleStyle: const TextStyle(
                                    fontWeight: FontWeight.bold),
                                description:
                                    "You don't have any permission for adding posts yet !")
                            .show(context);
                      }
                      //TODO else statment and ui for add post
                    },
                  ),
                ),
              );
            },
            orElse: () => const SizedBox.shrink()),
        prefs.when(
            data: (data) {
              final yearid = useProvider(prefChangeNotifierProvider).yearId;
              final posts = useProvider(allPostsProvider(yearid));

              return posts.when(
                  data: (post) {
                    return ListView.custom(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      childrenDelegate: SliverChildBuilderDelegate(
                          (context, index) => PostWidget(
                                postModel: post[index],
                              ),
                          childCount: post.length),
                      controller: scrollcontoller,
                      scrollDirection: Axis.vertical,
                    );
                  },
                  loading: () => ListView.custom(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        childrenDelegate: SliverChildBuilderDelegate(
                            (context, index) => const ShimmerAffect(),
                            childCount: 10),
                        controller: scrollcontoller,
                        scrollDirection: Axis.vertical,
                      ),
                  error: (error, stack) {
                    return Center(
                      child: Text('$error'),
                    );
                  });
            },
            loading: () => const CircularProgressIndicator(),
            error: (error, stack) => Center(
                  child: Text("$error"),
                )),
      ],
    );
  }
}

class PostWidget extends StatelessWidget {
  final PostModel? postModel;
  const PostWidget({Key? key, this.postModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 0.0),
      elevation: 0.0,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        color: Colors.white,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  _PostHeader(
                    post: postModel,
                  ),
                  const SizedBox(height: 10.0),
                  Text(postModel!.title!),
                  const SizedBox(height: 20.0),
                  Text(postModel!.body!),
                ],
              ),
            ),
            postModel?.image != null
                ? Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: GestureDetector(
                      child: Hero(
                        tag: '${postModel!.image}',
                        child: Image.network(postModel!.image!),
                      ),
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (_) {
                          return DetailScreen(
                            imageurl: postModel!.image,
                          );
                        }));
                      },
                    ),
                  )
                : const SizedBox.shrink(),
          ],
        ),
      ),
    );
  }
}

class _PostHeader extends StatelessWidget {
  final PostModel? post;

  const _PostHeader({
    Key? key,
    this.post,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final time = post!.time as Timestamp;
    return Row(
      children: [
        ProfileAvatar(imageUrl: post!.adminavatar),
        const SizedBox(width: 8.0),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                post!.adminname!,
                style: const TextStyle(
                  fontWeight: FontWeight.w600,
                ),
              ),
              Row(
                children: [
                  Text(
                    '${time.toDate()} • ',
                    style: TextStyle(
                      color: Colors.grey[600],
                      fontSize: 12.0,
                    ),
                  ),
                  Icon(
                    Icons.public,
                    color: Colors.grey[600],
                    size: 12.0,
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class ProfileAvatar extends StatelessWidget {
  final String? imageUrl;

  const ProfileAvatar({
    Key? key,
    this.imageUrl,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CircleAvatar(
          radius: 20.0,
          backgroundColor: Colors.lightBlue,
          child: CircleAvatar(
            radius: 20.0,
            backgroundColor: Colors.grey[200],
            backgroundImage: NetworkImage(imageUrl!),
          ),
        ),
      ],
    );
  }
}

class DetailScreen extends StatelessWidget {
  final String? imageurl;
  const DetailScreen({Key? key, this.imageurl}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        child: Center(
          child: PhotoView(
            imageProvider: NetworkImage(imageurl!),
          ),
        ),
        onTap: () {
          Navigator.pop(context);
        },
      ),
    );
  }
}
