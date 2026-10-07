import Foundation

final class NotesStore: ObservableObject {
    @Published var notes: [Note] = []

    private let storageKey = "notes.app.storage"

    init() {
        load()
    }

    func load() {
        if let data = UserDefaults.standard.data(forKey: storageKey),
           let decodedNotes = try? JSONDecoder().decode([Note].self, from: data) {
            notes = decodedNotes
            if notes.isEmpty {
                notes = SampleNotes.defaultNotes()
                save()
            }
            return
        }

        notes = SampleNotes.defaultNotes()
        save()
    }

    func addNote(text: String) {
        let trimmed = text.trimmingCharacters(in: .whitespacesAndNewlines)
        guard !trimmed.isEmpty else { return }

        let createdNote = Note.make(text: trimmed)
        notes.insert(createdNote, at: 0)
        save()
    }

    func deleteNote(id: UUID) {
        notes.removeAll { $0.id == id }
        save()
    }

    private func save() {
        if let encoded = try? JSONEncoder().encode(notes) {
            UserDefaults.standard.set(encoded, forKey: storageKey)
        }
    }
}
