import 'dart:async';

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:projeto_movies_clean_arciteture/src/features/movies/domain/entities/review_entity.dart';
import 'package:projeto_movies_clean_arciteture/src/features/movies/presentation/cubits/review/review_cubit.dart';

class ModalCardEditCreateReview {
  ModalCardEditCreateReview({
    Key? key,
    this.reviewEntity,
    this.idReview,
    required this.isEdit,
  });

  final ReviewEntity? reviewEntity;
  final int? idReview;
  final bool isEdit;

  TextEditingController controllerName = TextEditingController();
  TextEditingController controllerReview = TextEditingController();

  Future<void> modalBottomSheet(BuildContext context) {
    return showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(16),
          topRight: Radius.circular(16),
        ),
      ),
      builder: (BuildContext context) {
        return Container(
          padding:
              EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                const SizedBox(
                  height: 16,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(isEdit ? "Editar Review" : "Criar Review",
                        style: const TextStyle()),
                    IconButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        icon: const Icon(Icons.close))
                  ],
                ),
                const SizedBox(
                  height: 16,
                ),
                TextFormField(
                  textCapitalization: TextCapitalization.words,
                  decoration: const InputDecoration(
                    hintText: "Seu nome",
                  ),
                  controller: controllerName,
                ),
                TextFormField(
                  textCapitalization: TextCapitalization.words,
                  decoration: const InputDecoration(
                    hintText: "Seu review sobre o app",
                  ),
                  controller: controllerReview,
                ),
                if (isEdit)
                  Column(
                    children: [
                      const SizedBox(
                        height: 24,
                      ),
                      ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.black),
                          onPressed: () {
                            context
                                .read<ReviewCubit>()
                                .updateReview(
                                  ReviewEntity(
                                    review: controllerReview.text,
                                  ),
                                )
                                .then((value) => AwesomeDialog(
                                      context: context,
                                      animType: AnimType.scale,
                                      dialogType: DialogType.success,
                                      title: 'Editado com Sucesso',
                                      headerAnimationLoop: false,
                                      btnOkOnPress: () {},
                                    ).show());
                          },
                          child: const Text(
                            "Salvar Review",
                            style: TextStyle(color: Colors.white),
                          )),
                      const SizedBox(
                        height: 25,
                      ),
                      TextButton(
                        child: const Text(
                          "Deletar Review",
                          style: TextStyle(color: Colors.red),
                        ),
                        onPressed: () {
                          Navigator.of(context).pop();
                          context.read<ReviewCubit>().deleteReview(
                                reviewEntity!,
                              );
                        },
                      ),
                      const SizedBox(
                        height: 65,
                      ),
                    ],
                  )
                else
                  Column(
                    children: [
                      const SizedBox(
                        height: 50,
                      ),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.black),
                        onPressed: () {
                          context
                              .read<ReviewCubit>()
                              .addReview(
                                ReviewEntity(
                                  nameReview: controllerName.text.trim(),
                                  review: controllerReview.text,
                                ),
                              )
                              .then((value) => AwesomeDialog(
                                    context: context,
                                    animType: AnimType.scale,
                                    dialogType: DialogType.success,
                                    title: 'Criado com Sucesso',
                                    headerAnimationLoop: false,
                                    btnOkOnPress: () {},
                                  ).show());
                        },
                        child: const Text(
                          "Criar Review",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                      const SizedBox(
                        height: 64,
                      ),
                    ],
                  )
              ],
            ),
          ),
        );
      },
    );
  }
}
