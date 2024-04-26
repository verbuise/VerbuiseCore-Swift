// The Swift Programming Language
// https://docs.swift.org/swift-book

import Foundation

private struct VerbuiseKeys {
    var apiKey: String = ""
    var project: String = ""
    var organization: String = ""
}

private var InitiatedProject = VerbuiseKeys()

public struct Verbuise {
    var apiKey: String
    var project: String
    var organization: String
    var liveLanguageCode: VerbuiseLanguageCode
    
    private var liveLanguageName: String

    init(apiKey: String, project: String, organization: String, liveLanguageCode: VerbuiseLanguageCode) {
        self.apiKey = apiKey
        self.project = project
        self.organization = organization
        self.liveLanguageCode = liveLanguageCode
        self.liveLanguageName = VerbuiseLanguageName(from: liveLanguageCode)
    }
    
    // TODO: Fetch translations from API
    
    // TODO: Use this function to translate string from fetched translations
    static func translate(string: String, lang: VerbuiseLanguageCode) -> String {
        return ""
    }
}

public extension String {
    func localize(_ vb: Verbuise) -> String {
        return String("\(self.replacingOccurrences(of: " ", with: "_"))")
    }
}

// TODO: Date extension

// TODO: Currency extension
