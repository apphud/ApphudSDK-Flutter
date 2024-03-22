import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

/// Implements overlay entry to show progress indicator over any application screen.
class OverlayProgressIndicatorEntry extends OverlayEntry {
  /// Constructor.
  OverlayProgressIndicatorEntry() : super(builder: _builder);

  /// Describes the part of the user interface represented by this widget.
  static Widget _builder(BuildContext context) {
    return Positioned.fill(
      child: GestureDetector(
        onTap: () {},
        child: Stack(
          children: [
            Container(color: Color(0x40000000)),
            Center(child: CircularProgressIndicator()),
          ],
        ),
      ),
    );
  }

  /// Shows indicator.
  void insert(BuildContext context) {
    Overlay.of(context)?.insert(this);
  }
}

/// Abstract state class to be implemented in BlocState class.
abstract class InProgressState {
  bool get inProgress;
}

/// Implements progress indicator widget to show over any application screen.
class OverlayProgressIndicator<B extends Bloc<dynamic, S>,
    S extends InProgressState> extends StatefulWidget {
  /// Child.
  final Widget child;

  /// Instance of BloC to interact with.
  final B? bloc;

  /// Constructor.
  const OverlayProgressIndicator({
    Key? key,
    required this.child,
    this.bloc,
  }) : super(key: key);

  /// Returns state object for the widget.
  @override
  _OverlayProgressIndicatorState createState() =>
      _OverlayProgressIndicatorState<B, S>(bloc);
}

/// State class for the widget.
class _OverlayProgressIndicatorState<B extends Bloc<dynamic, S>,
    S extends InProgressState> extends State<OverlayProgressIndicator> {
  /// Overlay entry to show.
  OverlayProgressIndicatorEntry? _overlayProgressIndicator;

  final B? _bloc;

  _OverlayProgressIndicatorState(this._bloc);

  /// Describes the part of the user interface represented by this widget.
  @override
  Widget build(BuildContext context) {
    return BlocListener<B, S>(
      bloc: _bloc,
      listenWhen: _progressListenerWhen,
      listener: _progressListener,
      child: widget.child,
    );
  }

  /// Determines when toggle state.
  bool _progressListenerWhen(
          InProgressState previous, InProgressState current) =>
      previous.inProgress != current.inProgress;

  /// Listener to obtain state from BLoC.
  void _progressListener(BuildContext context, InProgressState state) {
    if (state.inProgress) {
      _remove();
      _overlayProgressIndicator = OverlayProgressIndicatorEntry();
      _overlayProgressIndicator!.insert(context);
    } else {
      _remove();
    }
  }

  /// Hides indicator.
  void _remove() {
    if (_overlayProgressIndicator != null) {
      _overlayProgressIndicator!.remove();
      _overlayProgressIndicator = null;
    }
  }

  /// Removes indicator.
  @override
  void dispose() {
    _remove();
    super.dispose();
  }
}
