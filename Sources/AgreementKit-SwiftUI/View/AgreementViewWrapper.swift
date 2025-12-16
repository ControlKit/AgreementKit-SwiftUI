//
//  AgreementViewWrapper.swift
//
//
//  Created by Maziar Saadatfar on 10/21/23.
//

import SwiftUI

public struct AgreementViewWrapper: View {
    let viewModel: AgreementViewModel
    let config: AgreementViewConfig
    @Environment(\.dismiss) var dismiss
    
    public init(viewModel: AgreementViewModel, config: AgreementViewConfig) {
        self.viewModel = viewModel
        self.config = config
    }
    
    public var body: some View {
        AgreementView(
            viewModel: viewModel,
            config: config,
            onAccept: {
                viewModel.acceptAction()
                dismiss()
            },
            onDecline: {
                viewModel.declineAction()
                dismiss()
            }
        )
        .onAppear {
            viewModel.viewAction()
        }
    }
}

