//
//  Item.swift
//  nerd
//
//  Created by Naoki Onishi on 2019/05/21.
//  Copyright © 2019 Naoki Onishi. All rights reserved.
//

public struct Item: Codable {
    public let id: Int
    public let itemState: Int
    public let itemStateName: String
    public let planId: Int
    public let planName: String
    public let brandId: Int
    public let brandName: String
    public let brandKana: String
    public let name: String
    public let sex: Int
    public let priorityReserveItemId: Int
    public let partnershipCompanyId: Int
    public let favorite: Int
    public let imageFile: [ImageFile]

    public struct ImageFile: Codable {
        public let url: String
        public let thumbUrl: String
        public let largeUrl: String

        private enum CodingKeys: String, CodingKey {
            case url
            case thumbUrl = "thumb_url"
            case largeUrl = "large_url"
        }
    }

    private enum CodingKeys: String, CodingKey {
        case id
        case itemState = "item_state"
        case itemStateName = "item_state_name"
        case planId = "plan_id"
        case planName = "plan_name"
        case brandId = "brand_id"
        case brandName = "brand_name"
        case brandKana = "brand_kana"
        case name
        case sex
        case priorityReserveItemId = "priority_reserve_item_id"
        case partnershipCompanyId = "partnership_company_id"
        case favorite
        case imageFile = "image_file"
    }
}