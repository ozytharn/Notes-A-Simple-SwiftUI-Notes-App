import Foundation

struct Note: Codable, Equatable, Identifiable {
    let id: UUID
    var text: String
    var createdAt: Date
    var updatedAt: Date

    static func make(text: String) -> Note {
        let timestamp = Date()
        return Note(
            id: UUID(),
            text: text,
            createdAt: timestamp,
            updatedAt: timestamp
        )
    }

    var preview: String {
        let trimmed = text.trimmingCharacters(in: .whitespacesAndNewlines)
        return trimmed.isEmpty ? "Untitled note" : trimmed
    }

    var formattedDate: String {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        formatter.timeStyle = .short
        return formatter.string(from: updatedAt)
    }
}

enum SampleNotes {
    static func defaultNotes() -> [Note] {
        let now = Date()
        let notes = [
            "Plan sprint tasks for the upcoming week.",
            "Buy groceries: bread, fruit, and coffee beans.",
            "Remind the team to review the onboarding checklist.",
            "Draft ideas for the hackathon pitch presentation.",
            "Book a dentist appointment before the end of the month."
        ]

        return notes.enumerated().map { index, text in
            let date = Calendar.current.date(byAdding: .day, value: -(index + 1), to: now) ?? now
            return Note(id: UUID(), text: text, createdAt: date, updatedAt: date)
        }
    }
}
