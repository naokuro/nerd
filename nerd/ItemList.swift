//
//  ItemList.swift
//  nerd
//
//  Created by Naoki Onishi on 2019/05/21.
//  Copyright © 2019 Naoki Onishi. All rights reserved.
//

struct ItemList : Codable {
    public let items: [Item]
    public let quantity: Int
}
