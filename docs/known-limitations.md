# Known Limitations & Project Scope

This document specifies the current software scope, constraints, and known limitations of the TOGA Mobile Cadet module, ensuring clear expectations for evaluators.

---

## 1. High-Fidelity Mock Services & Offline State

To guarantee a fully functional offline experience during the 24-hour evaluation period without requiring complex external database server setups, all core domain repositories utilize mock adapters:

* **Mock Repositories:** Services for Authentication, Study Subjects, and Notifications simulate network request latency (e.g. `Future.delayed` ranging from 200ms to 600ms) but do not connect to live servers.
* **Scope Limits:** 
  * Mock responses return mock data models which are fully rendered in the UI.
  * Local draft notes *do* write directly to an offline Hive box (`notesBox`), so note creations and updates persist reliably across app restarts.
  * However, a complete notes sync with a server is simulated via a mock sync provider due to the absence of a live FastAPI endpoint.

---

## 2. Media & Rich-Text Attachments in Notes

The current implementation of the note drafting feature is optimized for high-performance text-based updates.

* **Scope Limits:**
  * Custom attachments (such as images of flight logs, weather charts, or cadet certificates) are not supported.
  * The text input area uses a standard `TextField` that captures plane text strings.
* **Migration Plan:** Rich text capability can be easily added in a future update by integrating a package like `flutter_quill` and storing JSON-formatted delta strings in the existing Hive note schema.

---

## 3. Web & Desktop Platform Testing

Although the Flutter framework compiles naturally for Web, Windows, macOS, and Linux platforms, the current build targets are highly specialized.

* **Target Target Scope:**
  * Optimization and layouts are specifically tailored to mobile screen dimensions (Android and iOS devices).
  * Some responsive layout helpers (e.g., in `responsive_utils.dart`) exist to support tablet sizes, but running on Web or Desktop may yield minor rendering compromises on extremely wide monitors.
  * **Hive Adapters:** While fully compatible, the storage paths are optimized for mobile sandboxes using standard `path_provider` paths.
