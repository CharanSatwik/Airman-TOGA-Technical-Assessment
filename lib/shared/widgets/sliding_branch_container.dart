import 'package:flutter/material.dart';

/// A custom branch Navigator container that provides smooth, hardware-accelerated,
/// side-by-side sliding transitions when switching bottom navigation branches.
class SlidingBranchContainer extends StatefulWidget {
  /// The index of the active branch Navigator.
  final int currentIndex;

  /// The list of branch Navigator widgets to manage.
  final List<Widget> children;

  /// The duration of the slide transition animation.
  final Duration duration;

  /// The animation curve for the slide transition.
  final Curve curve;

  const SlidingBranchContainer({
    super.key,
    required this.currentIndex,
    required this.children,
    this.duration = const Duration(milliseconds: 350),
    this.curve = Curves.easeInOutCubic,
  });

  @override
  State<SlidingBranchContainer> createState() => _SlidingBranchContainerState();
}

class _SlidingBranchContainerState extends State<SlidingBranchContainer>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late Animation<Offset> _slideAnimation;
  int _currentIndex = 0;
  int _previousIndex = 0;
  bool _isAnimating = false;

  @override
  void initState() {
    super.initState();
    _currentIndex = widget.currentIndex;
    _previousIndex = widget.currentIndex;
    
    _controller = AnimationController(
      vsync: this,
      duration: widget.duration,
    );

    _controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        setState(() {
          _isAnimating = false;
          _previousIndex = _currentIndex;
        });
      }
    });

    _slideAnimation = Tween<Offset>(
      begin: Offset.zero,
      end: Offset.zero,
    ).animate(CurvedAnimation(parent: _controller, curve: widget.curve));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  void didUpdateWidget(covariant SlidingBranchContainer oldWidget) {
    super.didUpdateWidget(oldWidget);
    
    if (widget.currentIndex != _currentIndex) {
      _previousIndex = _currentIndex;
      _currentIndex = widget.currentIndex;
      _isAnimating = true;

      // Determine sliding direction
      // Right-to-left if new index is higher than previous index.
      final isRightToLeft = _currentIndex > _previousIndex;
      final beginOffset = isRightToLeft ? const Offset(1.0, 0.0) : const Offset(-1.0, 0.0);

      _slideAnimation = Tween<Offset>(
        begin: beginOffset,
        end: Offset.zero,
      ).animate(CurvedAnimation(
        parent: _controller,
        curve: widget.curve,
      ));

      _controller.forward(from: 0.0);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: List.generate(widget.children.length, (index) {
        final isCurrent = index == _currentIndex;
        final isPrevious = index == _previousIndex;

        // Keep inactive branches offstage so we preserve their navigation
        // and scroll state, but avoid layout and rendering overhead.
        if (!isCurrent && !isPrevious) {
          return Offstage(
            offstage: true,
            child: TickerMode(
              enabled: false,
              child: widget.children[index],
            ),
          );
        }

        // Prevent users from interacting with the previous screen while it is sliding out.
        final Widget childWidget = IgnorePointer(
          ignoring: !isCurrent,
          child: TickerMode(
            enabled: isCurrent || isPrevious,
            child: widget.children[index],
          ),
        );

        if (_isAnimating) {
          if (isCurrent) {
            // New active branch sliding into center
            return SlideTransition(
              position: _slideAnimation,
              child: childWidget,
            );
          } else if (isPrevious) {
            // Old active branch sliding out of center
            final isRightToLeft = _currentIndex > _previousIndex;
            final endOffset = isRightToLeft ? const Offset(-1.0, 0.0) : const Offset(1.0, 0.0);

            return SlideTransition(
              position: _controller.drive(
                Tween<Offset>(
                  begin: Offset.zero,
                  end: endOffset,
                ).chain(CurveTween(curve: widget.curve)),
              ),
              child: childWidget,
            );
          }
        }

        // Static layout when not animating
        return childWidget;
      }),
    );
  }
}
