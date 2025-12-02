//
//  AgreementResponse.swift
//
//
//  Created by Maziar Saadatfar on 10/12/23.
//

import Foundation
import ControlKitBase
public struct AgreementResponse: Codable {
    public var data: AgreementModel
}
public struct AgreementModel: Codable {
    public let id: String
    public let agreement_title: LocalString?
    public let title: LocalString?
    public let description: LocalString?
    public let accept_button_title: LocalString?
    public let decline_button_title: LocalString?
    public let version: Int?
    public let created_at: String?
    init(id: String, agreement_title: LocalString?, title: LocalString?, description: LocalString?, accept_button_title: LocalString?, decline_button_title: LocalString?, version: Int?, created_at: String?) {
        self.id = id
        self.agreement_title = agreement_title
        self.title = title
        self.description = description
        self.accept_button_title = accept_button_title
        self.decline_button_title = decline_button_title
        self.version = version
        self.created_at = created_at
    }
}
