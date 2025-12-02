// The Swift Programming Language
// https://docs.swift.org/swift-book
import Foundation
import SwiftUI
import Combine
import ControlKitBase

public let agreementKit_Version: String = "1.0.0"
public class AgreementKit: Agreementable {
    public var agreementService: GenericServiceProtocol
    public init(agreementService: GenericServiceProtocol = GenericService()) {
        self.agreementService = agreementService
    }
    
    // SwiftUI method - returns a view that can be presented
    @MainActor
    public func configure(config: AgreementServiceConfig) async -> AgreementViewWrapper? {
        let request = AgreementRequest(
            name: config.name,
            appId: config.appId,
            sdkVersion: config.sdkVersion
        )
        if let result = try? await self.getAgreement(request: request),
           let response = result.value {
            let viewModel = DefaultAgreementViewModel(
                serviceConfig: config,
                response: response
            )
            let presenter = AgreementViewPresenter(data: viewModel.response.data, config: config.viewConfig)
            return AgreementViewWrapper(
                viewModel: viewModel,
                config: presenter.config
            )
        }
        return nil
    }
}
