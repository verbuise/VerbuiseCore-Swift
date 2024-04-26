//
//  File.swift
//  
//
//  Created by Jude Wilson on 4/25/24.
//

import Foundation

public enum VerbuiseLanguageCode: CaseIterable {
    case mandarinChinese
    case spanish
    case english
    case hindi
    case bengali
    case portuguese
    case russian
    case japanese
    case westernPunjabi
    case marathi
    case telugu
    case wuChinese
    case turkish
    case korean
    case french
    case german
    case vietnamese
    case tamil
    case yueChinese
    case urdu
    case javanese
    case italian
    case egyptianArabic
    case gujarati
    case iranianPersian
    
    var longName: String {
        switch self {
        case .mandarinChinese:
            return "Mandarin Chinese"
        case .spanish:
            return "Spanish"
        case .english:
            return "English"
        case .hindi:
            return "Hindi"
        case .bengali:
            return "Bengali"
        case .portuguese:
            return "Portuguese"
        case .russian:
            return "Russian"
        case .japanese:
            return "Japanese"
        case .westernPunjabi:
            return "Western Punjabi"
        case .marathi:
            return "Marathi"
        case .telugu:
            return "Telugu"
        case .wuChinese:
            return "Wu Chinese"
        case .turkish:
            return "Turkish"
        case .korean:
            return "Korean"
        case .french:
            return "French"
        case .german:
            return "German"
        case .vietnamese:
            return "Vietnamese"
        case .tamil:
            return "Tamil"
        case .yueChinese:
            return "Yue Chinese"
        case .urdu:
            return "Urdu"
        case .javanese:
            return "Javanese"
        case .italian:
            return "Italian"
        case .egyptianArabic:
            return "Egyptian Arabic"
        case .gujarati:
            return "Gujarati"
        case .iranianPersian:
            return "Iranian Persian"
        }
    }
    
    var isoCode: String {
        switch self {
        case .mandarinChinese: return "zh"
        case .spanish: return "es"
        case .english: return "en"
        case .hindi: return "hi"
        case .bengali: return "bn"
        case .portuguese: return "pt"
        case .russian: return "ru"
        case .japanese: return "ja"
        case .westernPunjabi: return "pa"
        case .marathi: return "mr"
        case .telugu: return "te"
        case .wuChinese: return "zh"
        case .turkish: return "tr"
        case .korean: return "ko"
        case .french: return "fr"
        case .german: return "de"
        case .vietnamese: return "vi"
        case .tamil: return "ta"
        case .yueChinese: return "zh"
        case .urdu: return "ur"
        case .javanese: return "jv"
        case .italian: return "it"
        case .egyptianArabic: return "ar"
        case .gujarati: return "gu"
        case .iranianPersian: return "fa"
        }
    }
    
    var id: Self { self }
}
