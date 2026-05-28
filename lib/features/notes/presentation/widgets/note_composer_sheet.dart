import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_spacing.dart';
import '../../../../shared/widgets/app_button.dart';
import '../../data/models/study_note.dart';
import '../../providers/notes_provider.dart';
import '../../../study/providers/study_provider.dart';

/// Bottom sheet for composing new notes.
class NoteComposerSheet extends ConsumerStatefulWidget {
  const NoteComposerSheet({super.key});

  @override
  ConsumerState<NoteComposerSheet> createState() => _NoteComposerSheetState();
}

class _NoteComposerSheetState extends ConsumerState<NoteComposerSheet> {
  final _contentController = TextEditingController();
  String _selectedSubjectId = 'sub_01';
  String _selectedSubjectName = 'Air Law';
  bool _isSaving = false;

  @override
  void dispose() {
    _contentController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final subjectsAsync = ref.watch(studySubjectsProvider);

    return DraggableScrollableSheet(
      initialChildSize: 0.7,
      minChildSize: 0.5,
      maxChildSize: 0.95,
      expand: false,
      builder: (context, scrollController) {
        return Container(
          decoration: BoxDecoration(
            color: AppColors.surface(context),
            borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
          ),
          child: Column(
            children: [
              // Drag handle
              const SizedBox(height: 12),
              Container(
                width: 36,
                height: 4,
                decoration: BoxDecoration(
                  color: AppColors.border(context),
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
              const SizedBox(height: 20),

              // Subject picker
              SizedBox(
                height: 36,
                child: subjectsAsync.when(
                  data: (subjects) => ListView.separated(
                    scrollDirection: Axis.horizontal,
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    itemCount: subjects.length,
                    separatorBuilder: (_, __) => const SizedBox(width: 8),
                    itemBuilder: (_, i) {
                      final s = subjects[i];
                      final selected = s.id == _selectedSubjectId;
                      return GestureDetector(
                        onTap: () => setState(() {
                          _selectedSubjectId = s.id;
                          _selectedSubjectName = s.subject;
                        }),
                        child: Container(
                          padding: const EdgeInsets.symmetric(horizontal: 14),
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            color: selected
                                ? AppColors.secondary
                                : Colors.transparent,
                            borderRadius: AppSpacing.badgeBorderRadius,
                            border: Border.all(
                              color: selected
                                  ? AppColors.secondary
                                  : AppColors.border(context),
                            ),
                          ),
                          child: Text(
                            s.subject,
                            style: TextStyle(fontFamily: 'PlusJakartaSans', 
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                              color: selected
                                  ? Colors.white
                                  : AppColors.textMuted(context),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                  loading: () => const SizedBox.shrink(),
                  error: (_, __) => const SizedBox.shrink(),
                ),
              ),
              const SizedBox(height: 16),

              // Note content field
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: TextField(
                    controller: _contentController,
                    maxLines: null,
                    expands: true,
                    autofocus: true,
                    textAlignVertical: TextAlignVertical.top,
                    decoration: InputDecoration(
                      hintText: 'Write your note...',
                      border: InputBorder.none,
                      enabledBorder: InputBorder.none,
                      focusedBorder: InputBorder.none,
                      fillColor: Colors.transparent,
                    ),
                    style: TextStyle(fontFamily: 'PlusJakartaSans', 
                      fontSize: 15,
                      color: AppColors.textPrimary(context),
                    ),
                  ),
                ),
              ),

              // Save button
              Padding(
                padding: const EdgeInsets.all(16),
                child: ConstrainedBox(
                  constraints: const BoxConstraints(maxWidth: 500),
                  child: AppButton(
                    label: 'Save Note',
                    isLoading: _isSaving,
                    onPressed: _saveNote,
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Future<void> _saveNote() async {
    if (_contentController.text.trim().isEmpty) return;

    setState(() => _isSaving = true);

    final note = StudyNote(
      id: 'note_${DateTime.now().millisecondsSinceEpoch}',
      subjectId: _selectedSubjectId,
      subjectName: _selectedSubjectName,
      content: _contentController.text.trim(),
      createdAt: DateTime.now(),
      syncStatus: 'pending',
    );

    await ref.read(notesProvider.notifier).addNote(note);

    if (mounted) {
      Navigator.of(context).pop();
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Note saved')),
      );
    }
  }
}
