//
//  PersistanceManager.swift
//  GHFollowers
//
//  Created by Edson Brandon on 06/12/24.
//

import Foundation

enum PersistanceActionType {
    case add, remove
}

enum PersistanceManager {
    
    static private let defaults = UserDefaults.standard
    
    enum Keys {
        static let favorites = "favorites"
    }
    
    static func update(with favorite: Follower, actionType: PersistanceActionType, completion: @escaping (GFError?) -> Void) {
        retrieveFavorites { result in
            switch result{
            case .success(let favorites):
                var retrievedFavorites = favorites
                
                switch actionType {
                case .add:
                    guard !retrievedFavorites.contains(favorite) else {
                        completion(.alreadyFavorite)
                        return
                    }
                    
                    retrievedFavorites.append(favorite)
                    break
                case .remove:
                    retrievedFavorites.removeAll { $0.login == favorite.login}
                    break
                }
                
                completion(saveFavorites(favorites: retrievedFavorites))
                break
            case .failure(let error):
                completion(error)
                break
            }
        }
    }
    
    static func retrieveFavorites(completion: @escaping (Result<[Follower], GFError>) -> Void) {
        guard let favoritesData = defaults.object(forKey: Keys.favorites) as? Data else {
            completion(.success([]))
            return
        }
        
        do {
            let decoder         = JSONDecoder()
            let favorites       = try decoder.decode([Follower].self, from: favoritesData)
            completion(.success(favorites))
        } catch {
            completion(.failure(.unableToFavorite))
        }
    }
    
    static func saveFavorites(favorites: [Follower]) -> GFError? {
        do {
            let encoder = JSONEncoder()
            let encodedFavorites = try encoder.encode(favorites)
            defaults.set(encodedFavorites, forKey: Keys.favorites)
            return nil
        } catch {
            return .unableToFavorite
        }
    }
}
