//
//  AgreementViewStyle.swift
//
//
//  Created by Maziar Saadatfar on 10/12/23.
//

import Foundation
import SwiftUI
import ControlKitBase

public enum AgreementViewStyle {
    case darkMode
    case lightMode
    
    public static func getViewConfigWithStyle(style: AgreementViewStyle, lang: CKLanguage) -> AgreementViewConfig {
        switch style {
        case .darkMode:
            DarkModeAgreementViewConfig(lang: lang)
        case .lightMode:
            LightModeAgreementViewConfig(lang: lang)
        }
    }
}
