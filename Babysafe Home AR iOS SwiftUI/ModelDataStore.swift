//
//  ModelDataStore.swift
//  Babysafe Home AR iOS SwiftUI
//
//  Created by Patrick Lang on 05.04.22.
//

import Foundation


import Foundation
import SwiftUI

class ModelDataStore: ObservableObject {
    @Published var unlockedDangers: [String] = []
    
    private static func fileURL(datastore: DataStoreFile) throws -> URL {
        try FileManager.default.url(for: .documentDirectory,
                                       in: .userDomainMask,
                                       appropriateFor: nil,
                                       create: false)
            .appendingPathComponent(datastore.filename)
    }
    
    static func load(datastore: DataStoreFile, completion: @escaping (Result<[String], Error>)->Void) {
        DispatchQueue.global(qos: .background).async {
            do {
                let fileURL = try fileURL(datastore: datastore)
                guard let file = try? FileHandle(forReadingFrom: fileURL) else {
                    DispatchQueue.main.async {
                        completion(.success([]))
                    }
                    return
                }
                let unlockedDangers = try JSONDecoder().decode([String].self, from: file.availableData)
                DispatchQueue.main.async {
                    completion(.success(unlockedDangers))
                }
            } catch {
                DispatchQueue.main.async {
                    completion(.failure(error))
                }
            }
        }
    }
    
    static func save(datastore: DataStoreFile, data: [String], completion: @escaping (Result<Int, Error>)->Void) {
        DispatchQueue.global(qos: .background).async {
            do {
                let data = try JSONEncoder().encode(data)
                let outfile = try fileURL(datastore: datastore)
                try data.write(to: outfile)
                DispatchQueue.main.async {
                    completion(.success(data.count))
                }
            } catch {
                DispatchQueue.main.async {
                    completion(.failure(error))
                }
            }
        }
    }
}



enum DataStoreFile: String, CaseIterable, Identifiable {
    case unlockedDangers
    case bannedDangers
    case unlockedArticles

    var id: Self { self }
    
    var filename: String { "\(self.rawValue).data" }
}
