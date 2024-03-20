//
//  Favorites.swift
//  POPatterns
//
//  Created by Burkan on 20/3/24.
//

import CoreData
import Combine

class FavoritesViewModel: ObservableObject {
    private var cancellables = Set<AnyCancellable>()
    var favorites: [Pattern] = []
    private var viewContext: NSManagedObjectContext
    
    init(context: NSManagedObjectContext = PersistenceController.shared.container.viewContext) {
        self.viewContext = context
        fetchFavorites()
    }
    
    func fetchFavorites() {
        let request: NSFetchRequest<FavoritePattern> = FavoritePattern.fetchRequest()
        do {
            let results = try viewContext.fetch(request)
            
            self.favorites = results.compactMap { result in
                guard let idString = result.id, let id = Int(idString) else { return nil }
                return Pattern(id: id, name: result.name ?? "", descriptions: result.descriptions ?? "", imageName: result.imageName ?? "", isFavorite: true)
            }
            
        } catch {
            print("Failed to fetch favorites: \(error)")
        }
    }
    
    func addFavorite(pattern: Pattern) {
        if isFavorite(pattern: pattern) {
            // Проверка на избранных
            return
        }
        let newFavorite = FavoritePattern(context: viewContext)
        newFavorite.id = String(pattern.id)
        newFavorite.name = pattern.name
        newFavorite.descriptions = pattern.descriptions
        newFavorite.imageName = pattern.imageName
        do {
            try viewContext.save()
            fetchFavorites()
        } catch {
            print("Failed to save context: \(error)")
        }
    }
    
    func removeFavorite(pattern: Pattern) {
        let request: NSFetchRequest<FavoritePattern> = FavoritePattern.fetchRequest()
        request.predicate = NSPredicate(format: "id == %@", String(pattern.id))
        do {
            let results = try viewContext.fetch(request)
            if let objectToDelete = results.first {
                viewContext.delete(objectToDelete)
                try viewContext.save()
                fetchFavorites()
            }
        } catch {
            print("Failed to delete favorite: \(error)")
        }
    }
    
    func isFavorite(pattern: Pattern) -> Bool {
        return favorites.contains { $0.id == pattern.id }
    }
}
