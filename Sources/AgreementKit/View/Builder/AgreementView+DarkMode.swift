//
//  File.swift
//
//
//  Created by Maziar Saadatfar on 10/16/23.
//

import Foundation
import SwiftUI
import ControlKitBase

public class DarkModeAgreementViewConfig: AgreementViewConfig {
    public override init(lang: CKLanguage) {
        super.init(lang: lang)
        style = .darkMode
    }
}
