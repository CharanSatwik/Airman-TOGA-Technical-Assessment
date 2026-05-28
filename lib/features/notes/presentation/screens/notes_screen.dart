import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/utils/responsive_utils.dart';
import '../../../../shared/widgets/skeleton_loader.dart';
import '../../../../shared/widgets/error_state.dart';
import '../../../../shared/widgets/empty_state.dart';
import '../../providers/notes_provider.dart';
import '../widgets/note_card.dart';
import '../widgets/note_composer_sheet.dart';

/// Notes screen with list of notes and composer sheet.
class NotesScreen extends ConsumerWidget {
  const NotesScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final notesAsync = ref.watch(notesProvider);
    final padding = ResponsiveUtils.responsivePadding(context);
    final columns = ResponsiveUtils.responsiveColumns(context);

    return Scaffold(
      backgroundColor: AppColors.background(context),
      appBar: AppBar(
        title: const Text('Notes'),
        actions: [
          TextButton.icon(
            onPressed: () {
              showModalBottomSheet(
                context: context,
                isScrollControlled: true,
                backgroundColor: Colors.transparent,
                builder: (_) => const NoteComposerSheet(),
              );
            },
            icon: const Icon(Icons.add, size: 18),
            label: const Text('New Note'),
          ),
        ],
      ),
      body: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 600),
          child: notesAsync.when(
            loading: () => ListView.separated(
              padding: padding,
              itemCount: 3,
              separatorBuilder: (_, __) => const SizedBox(height: 10),
              itemBuilder: (_, __) => const SkeletonLoader(height: 120),
            ),
            error: (err, _) => ErrorState(
              message: 'Failed to load notes',
              onRetry: () => ref.invalidate(notesProvider),
            ),
            data: (notes) {
              if (notes.isEmpty) {
                return const EmptyState(
                  message: 'No notes yet. Tap + to add one.',
                  icon: Icons.note_add_outlined,
                );
              }

              if (columns > 1) {
                return GridView.builder(
                  padding: padding,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: columns,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                    childAspectRatio: 2.0,
                  ),
                  itemCount: notes.length,
                  itemBuilder: (_, i) => NoteCard(
                    note: notes[i],
                    onSync: () =>
                        ref.read(notesProvider.notifier).syncNote(notes[i].id),
                    onRetry: () =>
                        ref.read(notesProvider.notifier).retrySync(notes[i].id),
                    onDelete: () => _confirmDelete(context, ref, notes[i].id),
                  ),
                );
              }

              return ListView.separated(
                padding: padding,
                itemCount: notes.length,
                separatorBuilder: (_, __) => const SizedBox(height: 10),
                itemBuilder: (_, i) => NoteCard(
                  note: notes[i],
                  onSync: () =>
                      ref.read(notesProvider.notifier).syncNote(notes[i].id),
                  onRetry: () =>
                      ref.read(notesProvider.notifier).retrySync(notes[i].id),
                  onDelete: () => _confirmDelete(context, ref, notes[i].id),
                ),
              );
            },
          ),
        ),
      ),
    );
  }

  void _confirmDelete(BuildContext context, WidgetRef ref, String noteId) {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        backgroundColor: AppColors.surface(ctx),
        title: Text(
          'Delete Note',
          style: TextStyle(
            fontFamily: 'PlusJakartaSans',
            color: AppColors.textPrimary(ctx),
          ),
        ),
        content: Text(
          'Are you sure you want to delete this study note?',
          style: TextStyle(
            fontFamily: 'PlusJakartaSans',
            color: AppColors.textMuted(ctx),
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(ctx),
            child: Text(
              'Cancel',
              style: TextStyle(color: AppColors.textMuted(ctx)),
            ),
          ),
          TextButton(
            onPressed: () {
              ref.read(notesProvider.notifier).deleteNote(noteId);
              Navigator.pop(ctx);
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Note deleted successfully'),
                  duration: Duration(seconds: 2),
                ),
              );
            },
            style: TextButton.styleFrom(foregroundColor: AppColors.danger),
            child: const Text('Delete'),
          ),
        ],
      ),
    );
  }
}
