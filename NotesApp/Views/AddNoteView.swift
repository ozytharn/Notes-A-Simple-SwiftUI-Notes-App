import SwiftUI

struct AddNoteView: View {
    @ObservedObject var store: NotesStore
    @Environment(\.dismiss) private var dismiss

    @State private var noteText = ""
    @State private var showValidationAlert = false

    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            Text("New note")
                .font(.title2)
                .fontWeight(.semibold)

            TextEditor(text: $noteText)
                .frame(minHeight: 220)
                .padding(12)
                .overlay(
                    RoundedRectangle(cornerRadius: 12)
                        .stroke(Color.gray.opacity(0.4), lineWidth: 1)
                )
                .padding(.top, 4)

            Button(action: saveNote) {
                Text("Save note")
                    .frame(maxWidth: .infinity)
            }
            .buttonStyle(.borderedProminent)
            .tint(.blue)
        }
        .padding()
        .navigationTitle("Add Note")
        .alert("Please enter some text before saving.", isPresented: $showValidationAlert) {
            Button("OK", role: .cancel) {}
        }
    }

    private func saveNote() {
        let trimmed = noteText.trimmingCharacters(in: .whitespacesAndNewlines)
        guard !trimmed.isEmpty else {
            showValidationAlert = true
            return
        }

        store.addNote(text: trimmed)
        dismiss()
    }
}

#Preview {
    NavigationStack {
        AddNoteView(store: NotesStore())
    }
}
