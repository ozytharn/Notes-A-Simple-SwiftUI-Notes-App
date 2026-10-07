# Notes App

A lightweight SwiftUI notes app created to match the recruitment task requirements: home list, create note, detailed note view, delete option, and local storage.

## App flow

1. Launch the app to view the Notes list screen.
2. Tap the plus button in the top-right to navigate to the Add Note screen.
3. Enter note text and tap Save. Empty notes are blocked.
4. Tap any note to open the detail screen and review its created/updated date.
5. Use the Delete action to remove a note and return to the list.

## Storage approach

This app uses `UserDefaults` for lightweight persistent storage. Notes are encoded as JSON and saved locally so they remain available after the app restarts.

## Assumptions

- The app keeps a single source of truth in the shared `NotesStore`.
- If no saved notes exist, the app seeds five example notes so the list always has content on first launch.
- The UI prioritizes clarity and simplicity, with no advanced note behaviors beyond the required features.

## Screenshots

Add screenshots here after running the app in the Xcode simulator:

- List screen
- Add note screen
- Detail view
- Delete confirmation

Example placeholders:

- `Screenshots/notes-list.png`
- `Screenshots/add-note.png`
- `Screenshots/note-detail.png`
