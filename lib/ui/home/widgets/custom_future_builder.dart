import 'package:flutter/material.dart';

class CustomFutureBuilder<T> extends StatelessWidget {
  const CustomFutureBuilder({
    super.key,
    required this.future,
    required this.onLoaded,
    this.onError,
    this.onLoading,
  });
  final Future<T?> future;
  final Widget Function()? onLoading;
  final Widget Function(T instance) onLoaded;
  final Widget Function(String error)? onError;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: future,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return onLoaded(snapshot.data as T);
          } else if (snapshot.hasError) {
            return Center(
                child: onError?.call(snapshot.error.toString()) ??
                    const Icon(Icons.error));
          } else {
            return onLoading?.call() ??
                const Center(
                  child: CircularProgressIndicator(),
                );
          }
        });
  }
}