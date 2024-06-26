// The Swift Programming Language
// https://docs.swift.org/swift-book

import Foundation
import SwiftUI

public class Verbuise {
    var apiKey: String
    var project: String
    var organization: String
    public var liveLanguageCode: VerbuiseLanguageCode!
    
    var translations: [String: [String: String]]?
    
    var liveLanguageName: String
    var liveLanguageISOCode: String
    
    public var translationsLoaded = false

    @available(macOS 10.15, *)
    @available(iOS 15.0, *)
    public init(apiKey: String, project: String, organization: String, liveLanguageCode: VerbuiseLanguageCode) {
        self.apiKey = apiKey
        self.project = project
        self.organization = organization
        self.liveLanguageCode = liveLanguageCode
        self.liveLanguageName = liveLanguageCode.longName
        self.liveLanguageISOCode = liveLanguageCode.isoCode
        
        fetchTranslations { translations, error in
            if let error = error {
                print("Error: \(error)")
            } else if let translations = translations {
                self.translations = translations
                print("Fetched Translations: \(translations)")
                self.translationsLoaded = true
            }
        }
    }
    
    public func localize(_ value: String) -> String {
        guard translationsLoaded else {
            return "Translations not ready"
        }
        
       let keys = value.components(separatedBy: " ")
        
        var translated: String = value
        
        keys.forEach { key in
            let replace = translations![liveLanguageCode.isoCode]?[key] ?? "||missing translation key||"
            
            translated = translated.replacingOccurrences(of: key, with: replace)
        }
        
        return translated
    }
    
    // TODO: Fetch translations from API
    

    // TODO: Use this function to translate string from fetched translations
    static func translate(string: String, lang: VerbuiseLanguageCode) -> String {
        return ""
    }
}

public extension String {
    func localize(_ vb: Verbuise, _ code: VerbuiseLanguageCode) -> String {
        guard vb.translationsLoaded else {
            return "Translations not ready"
        }
        
       let keys = self.components(separatedBy: " ")
        
        var translated: String = self
        
        keys.forEach { key in
            let replace = vb.translations![code.isoCode]?[key] ?? "||missing translation key||"
            
            translated = translated.replacingOccurrences(of: key, with: replace)
        }
        
        return translated
    }
}

// TODO: Date extension

// TODO: Currency extension

func fetchTranslations(completion: @escaping ([String: [String: String]]?, Error?) -> Void) {
    
    let url = URL(string: "https://verbuise.com/example.json")!
    let task = URLSession.shared.dataTask(with: url) { data, response, error in
        if let error = error {
            completion(nil, error)
            return
        }
        guard let data = data else {
            completion(nil, NSError(domain: "Error: No data", code: 0, userInfo: nil))
            return
        }
        do {
            let translations = try JSONDecoder().decode([String: [String: String]].self, from: data)
            completion(translations, nil)
        } catch let decodeError {
            completion(nil, decodeError)
        }
    }
    task.resume()
}
