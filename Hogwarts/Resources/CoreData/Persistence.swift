//
//  Persistence.swift
//  Hogwarts
//
//  Created by Ali Mirzamani on 1/9/24.
//

import CoreData

struct PersistenceController {

    // MARK: - Constants
    static let shared = PersistenceController()

    let container: NSPersistentContainer

    // MARK: - Variables
    var viewContext: NSManagedObjectContext {
        container.viewContext
    }

    // MARK: - Initializers
    init(inMemory: Bool = false) {
        container = NSPersistentContainer(name: "Hogwarts")
        if inMemory {
            container.persistentStoreDescriptions.first!.url = URL(fileURLWithPath: "/dev/null")
        }
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        container.viewContext.automaticallyMergesChangesFromParent = true
    }

    // MARK: - Functions
    func saveContext() {
        do {
            try viewContext.save()
        } catch {
            viewContext.rollback()
            print(error.localizedDescription)
        }
    }

    func isInFavorite(id: String) -> Bool {
        let favorite = getFavorite(id: id)
        return favorite != nil
    }

    func getFavorite(id: String) -> Favorite? {
        let request = NSFetchRequest<Favorite>(entityName: "Favorite")
        request.predicate = NSPredicate(format: "id == %@", id)

        let fetch = try? viewContext.fetch(request)
        return fetch?.first
    }

    func addFavorite(id: String) {
        let new = Favorite(context: viewContext)
        new.id = id

        saveContext()
    }

    func removeFavorite(id: String) {
        guard let favorite = getFavorite(id: id) else { return }
        viewContext.delete(favorite)
        saveContext()
    }
}
