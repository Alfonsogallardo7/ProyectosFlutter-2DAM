import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_miarmapp/bloc/me_bloc/me_bloc.dart';
import 'package:flutter_miarmapp/bloc/me_bloc/me_event.dart';
import 'package:flutter_miarmapp/bloc/me_bloc/me_state.dart';
import 'package:flutter_miarmapp/models/me_response.dart';
import 'package:flutter_miarmapp/repository/me_repository/me_repository.dart';
import 'package:flutter_miarmapp/repository/me_repository/me_repository_impl.dart';
import 'package:flutter_miarmapp/ui/screens/error_page.dart';
import 'package:flutter_miarmapp/ui/screens/login_screen.dart';
import 'package:flutter_miarmapp/ui/widgets/home_app_bar.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  late MeRepository meRepository;

  @override
  void initState() {
    super.initState();
    meRepository = MeRespositoryImpl();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const HomeAppBar(),
        body: BlocProvider(
          create: (context) {
            return MeBloc(meRepository)..add(FetchMeWithType());
          },
          child: _createPopular(context),
        ));
  }

  Widget _createPopular(BuildContext context) {
    return BlocBuilder<MeBloc, MeState>(
      builder: (context, state) {
        if (state is MeInitial) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is MeFetchError) {
          return ErrorPage(
            message: state.message,
            retry: () {
              context.watch<MeBloc>().add(FetchMeWithType());
            },
          );
        } else if (state is MeFetched) {
          return _createMeViewItem(context, state.me);
        } else {
          return const Text('Not support');
        }
      },
    );
  }

  /*Widget _createPopularView(BuildContext context, MeResponse me) {
    //final contentHeight = 4.0 * (MediaQuery.of(context).size.width / 2.4) / 3;
    return Column(
      children: [
        SizedBox(
          height: MediaQuery.of(context).size.height / 1.33,
          child: ListView.separated(
            itemBuilder: (BuildContext context, int index) {
              return _createPostViewItem(context, post[index]);
            },
            scrollDirection: Axis.vertical,
            separatorBuilder: (context, index) => const VerticalDivider(
              color: Colors.transparent,
              width: 6.0,
            ),
            itemCount: me.length,
          ),
        ),
      ],
    );
  }*/

  Widget _createMeViewItem(BuildContext context, MeResponse me) {
    final width = MediaQuery.of(context).size.width / 2.6;
    return SafeArea(
      child: Column(
        children: [
          Column(
            children: [
              Row(
                children: [
                  Container(
                    margin: const EdgeInsets.only(top: 12),
                    width: 90.0,
                    height: 90.0,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                          fit: BoxFit.cover,
                          image: NetworkImage(me.fotoPerfil.replaceAll(
                              'http://localhost:8080/',
                              'http://10.0.2.2:8080/'))),
                    ),
                  ),
                  Column(
                    children: [
                      Row(
                        children: [
                          Column(
                            children: const [
                              TextButton(
                                onPressed: null,
                                child: Text(
                                  "3",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black,
                                      fontSize: 17,
                                      fontFamily: 'Helvetica'),
                                ),
                              ),
                              Text(
                                "Posts",
                                style: TextStyle(
                                    fontSize: 15.0, fontFamily: 'Helvetica'),
                              ),
                            ],
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          Column(
                            children: [
                              TextButton(
                                onPressed: () {
                                  Navigator.of(context).push(MaterialPageRoute(
                                      builder: (context) =>
                                          const LoginScreen()));
                                },
                                child: const Text(
                                  "1.174",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black,
                                      fontSize: 17,
                                      fontFamily: 'Helvetica'),
                                ),
                              ),
                              const Text(
                                "Followers",
                                style: TextStyle(
                                    fontSize: 15.0, fontFamily: 'Helvetica'),
                              ),
                            ],
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              TextButton(
                                  onPressed: () {
                                    Navigator.of(context).push(
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                const LoginScreen()));
                                  },
                                  child: const Text("832",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black,
                                          fontSize: 17,
                                          fontFamily: 'Helvetica'))),
                              const Text(
                                "Following",
                                style: TextStyle(
                                    fontSize: 15.0, fontFamily: 'Helvetica'),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
                mainAxisAlignment: MainAxisAlignment.spaceAround,
              ),
              Row(
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(left: 10.0, top: 8.0),
                    child: Text(
                      "${me.nombre} ${me.apellidos}",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
              Row(
                children: const [
                  Padding(
                    padding:
                        EdgeInsets.only(left: 10.0, top: 2.0, bottom: 10.0),
                    child: Text("Software Engineer"),
                  )
                ],
              ),
              Container(
                  height: 35,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: Colors.grey.shade200),
                  ),
                  width: 320,
                  child: TextButton(
                      onPressed: () {},
                      child: const Text(
                        "Edit Profile",
                        style: TextStyle(color: Colors.black),
                      )))
            ],
          ),
          const Divider(
            height: 10,
          ),
          Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.grid_on_outlined)),
                  IconButton(
                      onPressed: () {}, icon: const Icon(Icons.person_search)),
                ],
              ),
              SingleChildScrollView(
                child: BlocProvider(
                  create: (context) {
                    return MeBloc(meRepository)..add(FetchMeWithType());
                  },
                  child: _createPublicationsMe(context),
                ),
              )
            ],
          )
        ],
      ),
    );
  }

  Widget _createPublicationsMe(BuildContext context) {
    return BlocBuilder<MeBloc, MeState>(
      builder: (context, state) {
        if (state is MeInitial) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is MeFetchError) {
          return ErrorPage(
            message: state.message,
            retry: () {
              context.watch<MeBloc>().add(FetchMeWithType());
            },
          );
        } else if (state is MeFetched) {
          return _createPopularView(context, state.me.listaPublicaciones);
        } else {
          return const Text('Not support');
        }
      },
    );
  }

  Widget _createPopularView(
      BuildContext context, List<ListaPublicaciones> listaPublicaciones) {
    return Column(
      children: [
        SizedBox(
          height:MediaQuery.of(context).size.height / 2.3,
          child: GridView.builder( 
            gridDelegate:   SliverGrid(crossAxisAlignment: 3),
            itemBuilder: (BuildContext context, int index) {
              return _createPublicationsMeViewItem(
                  context, listaPublicaciones[index]);
            },
            scrollDirection: Axis.vertical,
            padding: const EdgeInsets.only(top:5 , bottom:16),
            shrinkWrap: true,
            itemCount: listaPublicaciones.length,
        
          ),
        ),
      ],
    );
  }

  Widget _createPublicationsMeViewItem(
      BuildContext context, ListaPublicaciones listaPublicaciones) {
    final width = MediaQuery.of(context).size.width / 2.6;
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.4,
      width: double.infinity,
      child: CachedNetworkImage(
        placeholder: (context, url) => const Center(
          child: CircularProgressIndicator(),
        ),
        imageUrl: listaPublicaciones.fichero
            .replaceAll('http://localhost:8080/', 'http://10.0.2.2:8080/'),
        fit: BoxFit.cover,
      ),
    );
  }
}
