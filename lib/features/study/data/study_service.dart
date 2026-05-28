import '../../../core/network/api_response.dart';
import 'package:airman_toga/features/study/data/models/study_subject.dart';
import 'package:airman_toga/features/study/data/models/chapter.dart';

/// Study service with mock subject and chapter data.
class StudyService {
  /// Returns 7 mock study subjects after 700ms delay.
  Future<ApiResponse<List<StudySubject>>> getSubjects() async {
    await Future.delayed(const Duration(milliseconds: 700));

    final subjects = [
      const StudySubject(
        id: 'sub_01',
        subject: 'Air Law',
        progress: 100,
        lessonsCompleted: 25,
        totalLessons: 25,
        quizScore: 92,
      ),
      const StudySubject(
        id: 'sub_02',
        subject: 'Navigation',
        progress: 72,
        lessonsCompleted: 18,
        totalLessons: 25,
        quizScore: 78,
      ),
      const StudySubject(
        id: 'sub_03',
        subject: 'Meteorology',
        progress: 56,
        lessonsCompleted: 14,
        totalLessons: 25,
        quizScore: 81,
      ),
      const StudySubject(
        id: 'sub_04',
        subject: 'Aircraft General Knowledge',
        progress: 88,
        lessonsCompleted: 22,
        totalLessons: 25,
        quizScore: 85,
      ),
      const StudySubject(
        id: 'sub_05',
        subject: 'Flight Performance & Planning',
        progress: 40,
        lessonsCompleted: 10,
        totalLessons: 25,
        quizScore: 68,
      ),
      const StudySubject(
        id: 'sub_06',
        subject: 'Human Performance',
        progress: 0,
        lessonsCompleted: 0,
        totalLessons: 20,
        quizScore: 0,
      ),
      const StudySubject(
        id: 'sub_07',
        subject: 'Communications',
        progress: 32,
        lessonsCompleted: 8,
        totalLessons: 25,
        quizScore: 74,
      ),
    ];

    return ApiResponse(success: true, data: subjects);
  }

  /// Synchronously returns chapters for a given subject.
  static List<Chapter> getChaptersSync(String subjectId) {
    final chapterMap = <String, List<Chapter>>{
      'sub_01': [
        const Chapter(
          id: 'ch_01_01',
          chapterName: 'ICAO Standards',
          completed: true,
        ),
        const Chapter(
          id: 'ch_01_02',
          chapterName: 'Rules of the Air',
          completed: true,
        ),
        const Chapter(
          id: 'ch_01_03',
          chapterName: 'Airspace Classification',
          completed: true,
        ),
        const Chapter(
          id: 'ch_01_04',
          chapterName: 'Licensing Requirements',
          completed: true,
        ),
        const Chapter(
          id: 'ch_01_05',
          chapterName: 'Air Traffic Services',
          completed: true,
        ),
      ],
      'sub_02': [
        const Chapter(
          id: 'ch_02_01',
          chapterName: 'Map Reading',
          completed: true,
        ),
        const Chapter(
          id: 'ch_02_02',
          chapterName: 'Dead Reckoning',
          completed: true,
        ),
        const Chapter(
          id: 'ch_02_03',
          chapterName: 'Radio Navigation',
          completed: true,
        ),
        const Chapter(
          id: 'ch_02_04',
          chapterName: 'Flight Planning',
          completed: false,
        ),
        const Chapter(
          id: 'ch_02_05',
          chapterName: 'GPS Navigation',
          completed: false,
        ),
      ],
      'sub_03': [
        const Chapter(
          id: 'ch_03_01',
          chapterName: 'Atmosphere',
          completed: true,
        ),
        const Chapter(
          id: 'ch_03_02',
          chapterName: 'Wind & Turbulence',
          completed: true,
        ),
        const Chapter(
          id: 'ch_03_03',
          chapterName: 'Clouds & Precipitation',
          completed: false,
        ),
        const Chapter(
          id: 'ch_03_04',
          chapterName: 'Weather Hazards',
          completed: false,
        ),
        const Chapter(
          id: 'ch_03_05',
          chapterName: 'METAR & TAF Reading',
          completed: false,
        ),
      ],
    };

    return chapterMap[subjectId] ??
        [
          Chapter(
            id: '${subjectId}_ch_gen_01',
            chapterName: 'Introduction',
            completed: true,
          ),
          Chapter(
            id: '${subjectId}_ch_gen_02',
            chapterName: 'Core Concepts',
            completed: false,
          ),
          Chapter(
            id: '${subjectId}_ch_gen_03',
            chapterName: 'Advanced Topics',
            completed: false,
          ),
          Chapter(
            id: '${subjectId}_ch_gen_04',
            chapterName: 'Practice Questions',
            completed: false,
          ),
        ];
  }

  /// Returns chapters for a given subject after 500ms delay.
  Future<ApiResponse<List<Chapter>>> getChapters(String subjectId) async {
    await Future.delayed(const Duration(milliseconds: 500));
    final chapters = getChaptersSync(subjectId);
    return ApiResponse(success: true, data: chapters);
  }
}
