// The Swift Programming Language
// https://docs.swift.org/swift-book

import Foundation

public struct Verbuise {
    var apiKey: String
    var project: String
    var organization: String
    var liveLanguageCode: VerbuiseLanguageCode
    
    var translations: [String: [String: String]]
    
    var liveLanguageName: String
    var liveLanguageISOCode: String

    @available(macOS 10.15, *)
    @available(iOS 15.0, *)
    public init(apiKey: String, project: String, organization: String, liveLanguageCode: VerbuiseLanguageCode) async {
        self.apiKey = apiKey
        self.project = project
        self.organization = organization
        self.liveLanguageCode = liveLanguageCode
        self.liveLanguageName = liveLanguageCode.longName
        self.liveLanguageISOCode = liveLanguageCode.isoCode
        
        let url: URL = URL(string: "https://verbuise.com/example.json")!
        let (data, _) = try! await URLSession.shared.data(from: url)
        self.translations = try! JSONDecoder().decode([String: [String: String]].self, from: data)
    }
    
    public func localize(_ value: String) -> String {
       let keys = value.components(separatedBy: " ")
        
        var translated: String = value
        
        keys.forEach { key in
            let replace = translations[self.liveLanguageISOCode]?[key] ?? "||missing translation key||"
            
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

func convertStringToDictionary(text: String) -> [String: [String:String]]? {
   if let data = text.data(using: .utf8) {
       do {
           let json = try JSONSerialization.jsonObject(with: data, options: .mutableContainers) as? [String: [String:String]]
           return json
       } catch {
           print("Something went wrong")
       }
   }
   return nil
}

// TODO: Date extension

// TODO: Currency extension
