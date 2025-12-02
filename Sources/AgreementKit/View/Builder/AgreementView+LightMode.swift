//
//  File.swift
//
//
//  Created by Maziar Saadatfar on 10/16/23.
//
import Foundation
import SwiftUI
import ControlKitBase

public class LightModeAgreementViewConfig: AgreementViewConfig {
    public override init(lang: CKLanguage) {
        super.init(lang: lang)
        style = .lightMode
        acceptButtonTitleColor = .white
        declineButtonTitleColor = Color(r: 173, g: 173, b: 173)
        acceptButtonBackColor = Color(r: 42, g: 111, b: 196)
        acceptButtonBorderColor = .white
        declineButtonBorderColor = Color(r: 173, g: 173, b: 173)
        termsDescriptionColor = Color(r: 147, g: 147, b: 147)
        termsColor = Color(r: 58, g: 112, b: 160)
        agreementColor = Color(r: 108, g: 108, b: 108)
        contentViewBackColor = .white
    }
}
