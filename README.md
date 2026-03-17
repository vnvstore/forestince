# Forestince — Facility Management Prototype

A mobile prototype built for Taigoa that helps companies manage and request forest facilities
efficiently.

## 1. Project Overview

This repository contains a Flutter mobile prototype for facility management. The prototype
demonstrates a working flow for listing facilities and submitting facility requests using a mock
service.

Tech Stack: Flutter, Dart, Riverpod (or BLoC — tùy anh chọn).

Target Platform: Mobile (iOS / Android).

## 2. Architectural Decisions (Chứng minh tư duy Senior)

Instead of only coding the UI, the focus was on building a scalable and maintainable foundation:

- Layered architecture: Separated the code into UI, Business Logic (Providers/Controllers), and Data
  layers.
- Repository pattern & Mock Service: A `MockFacilityService` simulates real-world API interactions
  so the UI stays independent of the data source and can be wired to a real backend later.
- State management: Riverpod (or BLoC) to handle complex UI states (Loading, Success, Empty, Error)
  gracefully.

Why these decisions?

- Keeps UI independent from data implementation details.
- Makes future integration with a real backend straightforward.
- Improves testability and maintainability.

## 3. Use Cases Implemented

- Main Dashboard: High-level overview of facilities and their status.
- Facility Request Flow: Complete flow from user input to simulated submission, including validation
  and asynchronous handling.

## 4. AI-Assisted Workflow (Phần quan trọng nhất)

AI tools were leveraged to speed development while maintaining quality:

- GitHub Copilot: Used for rapid UI prototyping and generating repetitive boilerplate code, allowing
  focus on architecture and logic.
- Gemini CLI / LLMs:
    - Data modeling: Prompts generated realistic seeded JSON data for facilities so the prototype
      feels "alive".
    - Logic refactoring: LLMs suggested optimizations and edge cases for the booking flow.
    - AI validation: Generated code was manually reviewed and adjusted to follow Flutter best
      practices and architectural constraints.

Outcome: AI usage helped reduce development time (estimated ~30–40%), enabling delivery of a
structured prototype within a short timeframe.

## 5. Prioritization & Trade-offs (Sự thực tế của Senior)

What was prioritized:

- Architecture, clean code, and a functional data flow (Input -> Service -> UI).

What was left out:

- Pixel-perfect production polish (e.g., custom animations).
- Persistent local storage.

These trade-offs were deliberate to focus on delivering a working prototype and an "AI-native
workflow".

## 6. Setup Instructions

1. Clone the repo.
2. Install dependencies and run the app.

Run these commands in a terminal:

```bash
git clone <repo-url>
cd forestince
flutter pub get
flutter run
```

(Replace `<repo-url>` with the repository URL.)

---

If you want, I can also:

- Add a short contributing guide or checklist for testing flows.
- Expand the README with screenshots from the `design/` folder.
- Generate a CHANGELOG or simple roadmap section.

Tell me which of these you'd like next.
