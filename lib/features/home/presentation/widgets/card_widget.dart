import 'dart:developer';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:silk_innovation_utsav/features/home/presentation/cubit/card_cubit.dart';

import 'card_back_widget.dart';
import 'card_front_widget.dart';

class CardWidget extends StatefulWidget {
  final int cardNumber;
  final bool isMatched;
  final int totalClick;
  final int? selectedCard;
  final void Function() increaseClickCallback;
  final int Function() getClickCallback;
  final void Function(int) setClickCount;

  const CardWidget({
    super.key,
    required this.cardNumber,
    required this.totalClick,
    required this.isMatched,
    required this.selectedCard,
    required this.increaseClickCallback,
    required this.getClickCallback,
    required this.setClickCount,
  });

  @override
  State<CardWidget> createState() => _CardWidgetState();
}

class _CardWidgetState extends State<CardWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(
        milliseconds: 300,
      ),
      vsync: this,
    );
    _animation = Tween<double>(begin: 0, end: 1).animate(_controller);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _flipCard() {
    bool isFlippingBack = _controller.isCompleted;
    BlocProvider.of<CardCubit>(context).onCardSelect(
      widget.cardNumber,
      isFlippingBack,
    );
    if (_controller.isDismissed) {
      _controller.forward();
    } else if (_controller.isCompleted) {
      _controller.reverse();
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<CardCubit, CardState>(
      listener: (context, state) {
        if (widget.getClickCallback() == 3) {
          widget.setClickCount(1);
        }
        state.mapOrNull(
          loaded: (value) {
            if (value.selectedCard == null &&
                _controller.isCompleted &&
                value.matchedCard.contains(widget.cardNumber) == false) {
              _controller.reverse();
            }
          },
        );
      },
      child: GestureDetector(
        onTap: () {
          if (widget.getClickCallback() > 2) {
            return;
          }
          if (!widget.isMatched) {
            widget.increaseClickCallback();
            _flipCard();
          }
        },
        child: AnimatedBuilder(
          animation: _animation,
          builder: (context, child) {
            bool isBack = _controller.value < 0.5;
            return Transform(
              transform: Matrix4.identity()
                ..setEntry(3, 2, 0.001) // perspective
                ..rotateY(_controller.value * 3.1415927), // rotate in radians
              alignment: Alignment.center,
              child: isBack
                  ? const CardBack()
                  : Transform(
                      alignment: Alignment.center,
                      transform: Matrix4.identity()..rotateY(3.1415927),
                      child: CardFront(
                        cardNumber: widget.cardNumber,
                        isMatched: widget.isMatched,
                      ),
                    ),
            );
          },
        ),
      ),
    );
  }
}
