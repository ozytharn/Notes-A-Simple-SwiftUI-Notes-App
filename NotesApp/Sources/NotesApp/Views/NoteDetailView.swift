import SwiftUI

struct NoteDetailView: View {
    @ObservedObject var store: NotesStore
    let note: Note

    @Environment(\.dismiss) private var dismiss
    @State private var showDeleteAlert = false

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 18) {
                Text(note.preview)
                    .font(.title2)
                    .fontWeight(.semibold)

                Label(note.formattedDate, systemImage: "calendar")
                    .font(.subheadline)
                    .foregroundStyle(.secondary)

                Divider()

                Text(note.text)
                    .font(.body)
                    .lineSpacing(8)
                    .frame(maxWidth: .infinity, alignment: .leading)
            }
            .padding()
        }
        .navigationTitle("Note")
        .toolbar {
            ToolbarItem(placement: .topBarTrailing) {
                Button(role: .destructive, action: { showDeleteAlert = true }) {
                    Label("Delete", systemImage: "trash")
                }
            }
        }
        .alert("Delete this note?", isPresented: $showDeleteAlert) {
            Button("Cancel", role: .cancel) {}
            Button("Delete", role: .destructive) {
                store.deleteNote(id: note.id)
                dismiss()
            }
        }
    }
}

#Preview {
    NavigationStack {
        NoteDetailView(
            store: NotesStore(),
            note: Note(id: UUID(), text: "This is a sample note content for preview.", createdAt: Date(), updatedAt: Date())
        )
    }
}
