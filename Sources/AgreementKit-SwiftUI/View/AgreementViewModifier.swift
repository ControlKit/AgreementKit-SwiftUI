//
//  AgreementViewModifier.swift
//
//
//  Created by Maziar Saadatfar on 10/21/23.
//

import SwiftUI

public struct AgreementViewModifier: ViewModifier {
    @Binding var isPresented: Bool
    let agreementKit: AgreementKit
    let config: AgreementServiceConfig
    @State private var agreementView: AgreementViewWrapper?
    
    public func body(content: Content) -> some View {
        content
            .sheet(isPresented: $isPresented) {
                if let agreementView = agreementView {
                    agreementView
                }
            }
            .task {
                if isPresented {
                    agreementView = await agreementKit.configure(config: config)
                }
            }
    }
}

public extension View {
    func agreementSheet(
        isPresented: Binding<Bool>,
        agreementKit: AgreementKit,
        config: AgreementServiceConfig
    ) -> some View {
        self.modifier(AgreementViewModifier(
            isPresented: isPresented,
            agreementKit: agreementKit,
            config: config
        ))
    }
}

