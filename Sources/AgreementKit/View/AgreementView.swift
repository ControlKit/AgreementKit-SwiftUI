//
//  AgreementView.swift
//
//
//  Created by Maziar Saadatfar on 10/21/23.
//

import SwiftUI
import Foundation

public struct AgreementView: View {
    let viewModel: AgreementViewModel
    let config: AgreementViewConfig
    let onAccept: () -> Void
    let onDecline: () -> Void
    
    @State private var attributedDescription: AttributedString?
    
    public init(viewModel: AgreementViewModel, 
                config: AgreementViewConfig,
                onAccept: @escaping () -> Void,
                onDecline: @escaping () -> Void) {
        self.viewModel = viewModel
        self.config = config
        self.onAccept = onAccept
        self.onDecline = onDecline
    }
    
    public var body: some View {
        ZStack {
            config.contentViewBackColor
                .ignoresSafeArea()
            
            VStack(spacing: 0) {
                // Agreement Label
                HStack {
                    Text(config.agreement)
                        .font(config.agreementFont)
                        .foregroundColor(config.agreementColor)
                        .frame(maxWidth: .infinity, alignment: .leading)
                    Spacer()
                }
                .padding(.horizontal, 24)
                .padding(.top, 80)
                .frame(height: 30)
                
                // Terms Label
                HStack {
                    Text(config.terms)
                        .font(config.termsFont)
                        .foregroundColor(config.termsColor)
                        .frame(maxWidth: .infinity, alignment: .leading)
                    Spacer()
                }
                .padding(.horizontal, 24)
                .padding(.top, 70)
                .frame(height: 50)
                
                // Description View
                ScrollView {
                    VStack {
                        if let attributedDescription = attributedDescription {
                            Text(attributedDescription)
                                .font(config.termsDescriptionFont)
                                .foregroundColor(config.termsDescriptionColor)
                                .frame(maxWidth: .infinity, alignment: .leading)
                        } else {
                            Text(config.termsDescription)
                                .font(config.termsDescriptionFont)
                                .foregroundColor(config.termsDescriptionColor)
                                .frame(maxWidth: .infinity, alignment: .leading)
                        }
                    }
                    .padding(.horizontal, 24)
                }
                .padding(.top, 40)
                
                // Buttons
                HStack(spacing: 0) {
                    // Decline Button
                    Button(action: onDecline) {
                        Text(config.declineButtonTitle)
                            .font(config.declineButtonFont)
                            .foregroundColor(config.declineButtonTitleColor)
                            .frame(width: 120, height: 48)
                            .background(config.declineButtonBackColor)
                            .overlay(
                                RoundedRectangle(cornerRadius: config.declineButtonRadius)
                                    .stroke(config.declineButtonBorderColor, lineWidth: config.declineButtonBorderWidth)
                            )
                            .cornerRadius(config.declineButtonRadius)
                    }
                    .padding(.leading, 24)
                    
                    Spacer()
                    
                    // Accept Button
                    Button(action: onAccept) {
                        Text(config.acceptButtonTitle)
                            .font(config.acceptButtonFont)
                            .foregroundColor(config.acceptButtonTitleColor)
                            .frame(width: 120, height: 48)
                            .background(config.acceptButtonBackColor)
                            .overlay(
                                RoundedRectangle(cornerRadius: config.acceptButtonRadius)
                                    .stroke(config.acceptButtonBorderColor, lineWidth: config.acceptButtonBorderWidth)
                            )
                            .cornerRadius(config.acceptButtonRadius)
                    }
                    .padding(.trailing, 24)
                }
                .padding(.top, 20)
                .padding(.bottom, 30)
            }
        }
        .onAppear {
            processDescription()
        }
    }
    
    private func processDescription() {
        if config.termsDescription.starts(with: "<") {
            // Try to parse as HTML
            if let data = config.termsDescription.data(using: .utf8, allowLossyConversion: true) {
                let options: [NSAttributedString.DocumentReadingOptionKey: Any] = [
                    .documentType: NSAttributedString.DocumentType.html,
                    .characterEncoding: String.Encoding.utf8.rawValue
                ]
                if let nsAttributedString = try? NSAttributedString(data: data, options: options, documentAttributes: nil) {
                    if #available(iOS 15.0, *) {
                        attributedDescription = AttributedString(nsAttributedString)
                    }
                }
            }
        }
    }
}

#Preview {
    AgreementView(
        viewModel: DefaultAgreementViewModel(
            serviceConfig: AgreementServiceConfig(
                name: "ffff",
                appId: "sdsdaads",
                language: .english
            ),
            response: AgreementResponse(
                data: AgreementModel(
                    id: "dfsfsdf",
                    agreement_title: nil,
                    title: nil,
                    description: nil,
                    accept_button_title: nil,
                    decline_button_title: nil,
                    version: nil,
                    created_at: nil
                )
            )
        ),
        config: AgreementViewConfig(lang: .english),
        onAccept: { },
        onDecline: { }
    )
}
