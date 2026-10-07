import SwiftUI

@main
struct NotesApp: App {
    @StateObject private var store = NotesStore()

    var body: some Scene {
        WindowGroup {
            NavigationStack {
                NotesListView(store: store)
            }
        }
    }
}
