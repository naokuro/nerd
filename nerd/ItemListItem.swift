//
//  ItemListItem.swift
//  nerd
//
//  Created by Naoki Onishi on 2019/05/21.
//  Copyright © 2019 Naoki Onishi. All rights reserved.
//

struct ItemListItem : Codable {
    public let id: Int
    public let planName: String
    public let brandName: String
    public let time: String
    public let itemName: String
    public let itemExplain: String
    public let itemImageUrl: String?
    public let itemDetailImageUrl: String?
}
