import SwiftUI

struct NotesListView: View {
    @ObservedObject var store: NotesStore

    var body: some View {
        Group {
            if store.notes.isEmpty {
                VStack(spacing: 12) {
                    Image(systemName: "note.text")
                        .font(.system(size: 42))
                        .foregroundColor(.gray)
                    Text("No notes yet")
                        .font(.title3)
                        .fontWeight(.semibold)
                    Text("Tap the plus button to add your first note.")
                        .foregroundStyle(.secondary)
                }
            } else {
                List {
                    ForEach(store.notes.sorted { $0.updatedAt > $1.updatedAt }) { note in
                        NavigationLink(destination: NoteDetailView(store: store, note: note)) {
                            VStack(alignment: .leading, spacing: 8) {
                                Text(note.preview)
                                    .font(.headline)
                                    .lineLimit(2)
                                Text(note.formattedDate)
                                    .font(.caption)
                                    .foregroundStyle(.secondary)
                            }
                            .padding(.vertical, 6)
                        }
                    }
                }
                .listStyle(.plain)
            }
        }
        .navigationTitle("Notes")
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                NavigationLink(destination: AddNoteView(store: store)) {
                    Image(systemName: "plus")
                }
            }
        }
    }
}

#Preview {
    NavigationStack {
        NotesListView(store: NotesStore())
    }
}
