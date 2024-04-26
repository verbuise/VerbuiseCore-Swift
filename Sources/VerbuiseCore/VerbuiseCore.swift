// The Swift Programming Language
// https://docs.swift.org/swift-book

import Foundation

private struct VerbuiseKeys {
    var apiKey: String = ""
    var project: String = ""
    var organization: String = ""
}

private var InitiatedProject = VerbuiseKeys()

func VerbuiseInit(apiKey: String, username: String, projectName: String) -> Bool {
    InitiatedProject.apiKey = apiKey
    InitiatedProject.project = projectName
    InitiatedProject.organization = username
    
    // value validation
    
    return true
}

extension String {
    func localize() -> String {
        return self.replacingOccurrences(of: " ", with: "_")
    }
}
