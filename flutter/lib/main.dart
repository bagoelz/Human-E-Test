import 'package:feedsubscriber/blocs/feed/feed_bloc.dart';
import 'package:feedsubscriber/blocs/subscriber/subscriber_bloc.dart';
import 'package:feedsubscriber/models/feed.dart';
import 'package:feedsubscriber/repositories/feed_repositories.dart';
import 'package:feedsubscriber/theme/theme_constant.dart';
import 'package:feedsubscriber/theme/theme_manager.dart';
import 'package:feedsubscriber/widgets/FeedTile.dart';
import 'package:feedsubscriber/widgets/bottomLoader.dart';
import 'package:feedsubscriber/widgets/searchBox.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(MyApp());
}

ThemeManager _themeManager = ThemeManager();

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void dispose() {
    _themeManager.removeListener(themeListener);
    super.dispose();
  }

  @override
  void initState() {
    _themeManager.addListener(themeListener);
    super.initState();
  }

  themeListener() {
    if (mounted) {
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider<FeedRepository>(
      create: (context) => FeedRepository(),
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
              create: (context) =>
                  FeedBloc(feedRepository: context.read<FeedRepository>())
                    ..add(FeedFetched())),
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: ThemaSaya.appName,
          theme: ThemaSaya.lightTheme,
          darkTheme: ThemaSaya.darkTheme,
          themeMode: _themeManager.themeMode,
          home: HomePage(),
        ),
      ),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
  }

  @override
  void dispose() {
    _scrollController
      ..removeListener(_onScroll)
      ..dispose();
    super.dispose();
  }

  void _onScroll() {
    if (_isBottom) context.read<FeedBloc>().add(FeedFetched());
  }

  bool get _isBottom {
    if (!_scrollController.hasClients) return false;
    final maxScroll = _scrollController.position.maxScrollExtent;
    final currentScroll = _scrollController.offset;
    return currentScroll >= (maxScroll * 0.9);
  }

  @override
  Widget build(BuildContext context) {
    TextTheme _textTheme = Theme.of(context).textTheme;

    return Scaffold(
        appBar: const CustomAppBar(),
        body: BlocBuilder<FeedBloc, FeedState>(
          builder: (context, state) {
            switch (state.status) {
              case FeedStatus.failure:
                return const Center(child: Text('failed to fetch posts'));
              case FeedStatus.success:
                if (state.feeds.isEmpty) {
                  return const Center(child: Text('no posts'));
                }
                return Column(
                  children: [
                    Container(height: 50, child: const FeedSearchBox(),padding: EdgeInsets.only(left: 5,right: 5),),
                    Container(
                      height: MediaQuery.of(context).size.height - 148,
                      child: ListView.separated(
                        separatorBuilder: (context, index) => Divider(),
                        itemBuilder: (BuildContext context, int index) {
                          return index >= state.feeds.length
                              ? BottomLoader()
                              : FeedTile(feeder: state.feeds[index]);
                        },
                        itemCount: state.hasReachedMax
                            ? state.feeds.length
                            : state.feeds.length + 1,
                        controller: _scrollController,
                      ),
                    ),
                  ],
                );
              default:
                return const Center(child: CircularProgressIndicator());
            }
          },
        ));
  }
}

class CustomAppBar extends StatelessWidget with PreferredSizeWidget {
  const CustomAppBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0.0,
      leading: IconButton(
        icon: Icon(Icons.person, color: Colors.white),
        onPressed: () {},
      ),
      centerTitle: false,
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            ThemaSaya.appName,
            style: Theme.of(context).textTheme.bodyText1!.copyWith(
                  color: Colors.white,
                ),
          ),
        ],
      ),
      actions: [
        Row(
          children: [
            Text(
              _themeManager.themeMode == ThemeMode.light ? 'Light' : 'Dark',
              style: Theme.of(context).textTheme.bodyText1!.copyWith(
                    color: Colors.white,
                  ),
            ),
            Switch.adaptive(
                value: _themeManager.themeMode == ThemeMode.system
                    ? true
                    : _themeManager.themeMode == ThemeMode.dark
                        ? true
                        : false,
                onChanged: (newValue) {
                  _themeManager.toggleTheme(newValue);
                }),
          ],
        )
      ],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(56);
}
