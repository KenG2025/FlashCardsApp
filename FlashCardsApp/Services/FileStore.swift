//
//  FileStore.swift
//  FlashCardsApp
//
//  Created by Ken Gonzalez on 1/16/26.
//

import Foundation

enum FileStoreError: Error {
    case invalidDocumentsDirectory
}

struct FileStore {
    private let fileName: String

    init(fileName: String = "decks.json") {
        self.fileName = fileName
    }

    private func fileURL() throws -> URL {
        guard let docs = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first else {
            throw FileStoreError.invalidDocumentsDirectory
        }
        return docs.appendingPathComponent(fileName)
    }

    func load<T: Decodable>(_ type: T.Type) throws -> T {
        let url = try fileURL()
        let data = try Data(contentsOf: url)
        return try JSONDecoder().decode(T.self, from: data)
    }

    func save<T: Encodable>(_ value: T) throws {
        let url = try fileURL()
        let data = try JSONEncoder().encode(value)

        // Atomic write prevents partial/corrupt files
        try data.write(to: url, options: [.atomic])
    }

    // Helpful for demos / resetting
    func deleteFile() throws {
        let url = try fileURL()
        if FileManager.default.fileExists(atPath: url.path) {
            try FileManager.default.removeItem(at: url)
        }
    }
}
