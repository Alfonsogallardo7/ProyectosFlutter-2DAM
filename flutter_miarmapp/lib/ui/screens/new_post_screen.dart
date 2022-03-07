import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_miarmapp/bloc/image_pick_bloc/image_pick_bloc.dart';
import 'package:flutter_miarmapp/bloc/image_pick_bloc/image_pick_event.dart';
import 'package:flutter_miarmapp/bloc/image_pick_bloc/image_pick_state.dart';
import 'package:flutter_miarmapp/bloc/new_post_bloc/new_post_bloc.dart';
import 'package:flutter_miarmapp/bloc/new_post_bloc/new_post_event.dart';
import 'package:flutter_miarmapp/bloc/new_post_bloc/new_post_state.dart';
import 'package:flutter_miarmapp/models/new_post_dto.dart';
import 'package:flutter_miarmapp/repository/constants.dart';
import 'package:flutter_miarmapp/repository/post_repository/post_repository.dart';
import 'package:flutter_miarmapp/repository/post_repository/post_respository_impl.dart';
import 'package:flutter_miarmapp/ui/screens/menu_screen.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';

class NewPostScreen extends StatefulWidget {
  const NewPostScreen({Key? key}) : super(key: key);

  @override
  _NewPostScreenState createState() => _NewPostScreenState();
}

class _NewPostScreenState extends State<NewPostScreen> {
  late PostRepository postRepository;
  bool _isObscure = true;
  final _formKey = GlobalKey<FormState>();
  TextEditingController textoController = TextEditingController();
  TextEditingController tituloController = TextEditingController();
  bool isPublic = true;
  late SharedPreferences _prefs;
  final format = DateFormat("yyyy-MM-dd");

  @override
  void initState() {
    super.initState();
    init();
    postRepository = PostRespositoryImpl();
  }

  void init() async {
    _prefs = await SharedPreferences.getInstance();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) {
          return NewPostBloc(postRepository);
        }),
        BlocProvider(create: (context) {
          return ImagePickBlocBloc();
        })
      ],
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: _createBody(context),
      ),
    );
  }

  Widget _createBody(BuildContext context) {
    return Container(
      margin: MediaQuery.of(context).padding,
      child: Center(
        child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: BlocConsumer<NewPostBloc, NewPostState>(
              listenWhen: (context, state) {
                return state is NewPostSuccessState ||
                    state is NewPostErrorState;
              },
              listener: (context, state) {
                if (state is NewPostSuccessState) {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const MenuScreen()));
                } else if (state is NewPostErrorState) {
                  _showSnackbar(context, state.message);
                }
              },
              buildWhen: (context, state) {
                return state is NewPostInitialState ||
                    state is NewPostLoadingState;
              },
              builder: (context, state) {
                if (state is NewPostInitialState) {
                  return _buildForm(context);
                } else if (state is NewPostLoadingState) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                } else {
                  return _buildForm(context);
                }
              },
            )),
      ),
    );
  }

  void _showSnackbar(BuildContext context, String message) {
    final snackBar = SnackBar(
      content: Text(message),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  Widget _buildForm(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            child: const Text(
              'MiarmaApp',
              style: TextStyle(fontFamily: 'Billabong', fontSize: 64),
            ),
          ),
          SizedBox(
            height: 700,
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  BlocConsumer<ImagePickBlocBloc, ImagePickBlocState>(
                    listenWhen: (context, state) {
                      return state is ImageSelectedSuccessState;
                    },
                    listener: (context, state) {},
                    buildWhen: (context, state) {
                      return state is ImagePickBlocInitial ||
                          state is ImageSelectedSuccessState;
                    },
                    builder: (context, state) {
                      if (state is ImageSelectedSuccessState) {
                        return Column(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(100),
                              child: Image.file(
                                File(state.pickedFile.path),
                                width: 150,
                                height: 150,
                                fit: BoxFit.fill,
                              ),
                            ),
                            ElevatedButton(
                                onPressed: () {
                                  _prefs.setString(Constant.foto_perfil_path,
                                      state.pickedFile.path);
                                },
                                child: const Text('Subir imagen'))
                          ],
                        );
                      }
                      return Center(
                        child: InkWell(
                          onTap: () {
                            BlocProvider.of<ImagePickBlocBloc>(context).add(
                                const SelectImageEvent(ImageSource.gallery));
                          },
                          child: Image.asset(
                            'assets/images/mock-avatar.png',
                            width: 150,
                          ),
                        ),
                      );
                    },
                  ),
                  TextFormField(
                    controller: tituloController,
                    decoration: const InputDecoration(
                        contentPadding: EdgeInsets.all(8.0),
                        hintText: 'Titulo',
                        border: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.grey, width: 5.0))),
                    onSaved: (String? value) {},
                    validator: (String? value) {
                      return (value == null || value.isEmpty)
                          ? 'You need to write your last name'
                          : null;
                    },
                  ),
                  TextFormField(
                    controller: textoController,
                    decoration: const InputDecoration(
                        contentPadding: EdgeInsets.all(8.0),
                        hintText: 'Descripción',
                        border: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.grey, width: 5.0))),
                    onSaved: (String? value) {},
                    validator: (String? value) {
                      return (value == null || value.isEmpty)
                          ? 'You need to write your nick'
                          : null;
                    },
                  ),
                  GestureDetector(
                      onTap: () {
                        if (_formKey.currentState!.validate()) {
                          final newPostDto = NewPostDto(
                              titulo: tituloController.text,
                              texto: textoController.text);
                          BlocProvider.of<NewPostBloc>(context).add(
                              DoNewPostEvent(
                                  newPostDto,
                                  _prefs
                                      .getString(Constant.foto_perfil_path)!));
                        }
                      },
                      child: Container(
                          width: MediaQuery.of(context).size.width,
                          margin: const EdgeInsets.only(
                              top: 20, left: 30, right: 30, bottom: 20),
                          padding: const EdgeInsets.symmetric(
                              horizontal: 50, vertical: 20),
                          decoration: BoxDecoration(
                              border: Border.all(
                                  color: Colors.blue.shade400, width: 2),
                              color: Colors.blue.shade400,
                              borderRadius: BorderRadius.circular(50)),
                          child: Text(
                            'New Post'.toUpperCase(),
                            style: const TextStyle(color: Colors.white),
                            textAlign: TextAlign.center,
                          )))
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
