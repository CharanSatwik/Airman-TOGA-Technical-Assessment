import 'package:flutter_test/flutter_test.dart';
import 'package:airman_toga/core/utils/status_utils.dart';

void main() {
  group('StatusUtils.getStatus', () {
    test('should return "Not Started" when progress is 0', () {
      expect(StatusUtils.getStatus(0), 'Not Started');
    });

    test('should return "In Progress" when progress is between 1 and 99', () {
      expect(StatusUtils.getStatus(1), 'In Progress');
      expect(StatusUtils.getStatus(50), 'In Progress');
      expect(StatusUtils.getStatus(99), 'In Progress');
    });

    test('should return "Completed" when progress is 100', () {
      expect(StatusUtils.getStatus(100), 'Completed');
    });

    test('should throw ArgumentError when progress is less than 0', () {
      expect(() => StatusUtils.getStatus(-1), throwsArgumentError);
    });

    test('should throw ArgumentError when progress is greater than 100', () {
      expect(() => StatusUtils.getStatus(101), throwsArgumentError);
    });
  });
}
