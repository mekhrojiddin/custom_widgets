// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:news_app/models/status.dart';
//
// import '../news_bloc.dart';
//
// class NewsScreen extends StatelessWidget {
//   const NewsScreen({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return BlocProvider(
//       create: (context) => NewsBloc(),
//       child: Builder(builder: (context) {
//         return Scaffold(
//           body: BlocBuilder<NewsBloc, NewsState>(
//             builder: (context, state) {
//               if (state.status == LoadingStatus.pure) {
//
//                 // context.read<NewsBloc>().add(GetNewsList(
//                 //   onFailure: (message) {}, onSuccvess: () {  },
//                 // ));
//
//                 return const SizedBox();
//               } else if (state.status == LoadingStatus.loading) {
//                 return const Center(child: CupertinoActivityIndicator());
//               } else if (state.status == LoadingStatus.loadedWithSuccess) {
//                 return ListView.separated(
//                   itemBuilder: (_, index) => Container(
//                     padding: const EdgeInsets.all(16),
//                     child: Row(
//                       children: [
//                         ClipRRect(
//                           borderRadius: BorderRadius.circular(12),
//                           child: Image.network(
//                             state.news[0].articles[index].urlToImage,
//                             width: 60,
//                             height: 60,
//                             fit: BoxFit.cover,
//                           ),
//                         ),
//                         const SizedBox(width: 20),
//                         Expanded(
//                           child: Column(
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             children: [
//                               Text(
//                                 state.news[0].articles[index].title,
//                                 style: const TextStyle(
//                                   fontSize: 20,
//                                   fontWeight: FontWeight.w700,
//                                 ),
//                               ),
//                               Text(
//                                 state.news[0].articles[index].description,
//                                 maxLines: 3,
//                                 overflow: TextOverflow.ellipsis,
//                                 style: const TextStyle(
//                                   fontSize: 14,
//                                   fontWeight: FontWeight.w500,
//                                 ),
//                               ),
//                             ],
//                           ),
//                         )
//                       ],
//                     ),
//                   ),
//                   separatorBuilder: (_, __) => const SizedBox(height: 16),
//                   itemCount: state.news[0].articles.length,
//                 );
//               } else {
//                 return const SizedBox();
//               }
//             },
//           ),
//         );
//       }),
//     );
//   }
// }

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:news_app/models/articles_enum.dart';
// import 'package:news_app/news/bloc/news_cibit.dart';
// import 'package:news_app/widgets/new_item.dart';

import '../models/status.dart';
import '../new_item.dart';
import '../news_bloc.dart';

class NewsScreen extends StatelessWidget {
  const NewsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NewsBloc(),
      child: Builder(builder: (context) {
        return Scaffold(
          body: BlocConsumer<NewsBloc, NewsState>(
            listener: (context, state){
              if(state.status == LoadingStatus.loadedWithSuccess){
                ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Chotki")));
              }
              if(state.status == LoadingStatus.loadedWithFailure){
                ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Xatolik")));
              }

            },
            builder: (context, state) {


              if (state.status == LoadingStatus.pure) {
                context.read<NewsBloc>().getNews(onSuccess: () { ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Horosh"),),);}, onFailure: (String errorMessage) {  },);
                return const SizedBox();
              } else if (state.status == LoadingStatus.loading) {
                return const Center(child: CupertinoActivityIndicator());
              } else if (state.status == LoadingStatus.loadedWithSuccess) {
                return ListView.separated(
                  itemBuilder: (_, index) => NewsItem(
                    article: state.news[0].articles[index],
                  ),
                  separatorBuilder: (_, __) => const SizedBox(height: 16),
                  itemCount: state.news[0].articles.length,
                );
              } else {
                return const SizedBox();
              }

            },
          ),
        );
      }),
    );
  }
}