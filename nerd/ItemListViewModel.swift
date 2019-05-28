//
//  ItemListViewModel.swift
//  nerd
//
//  Created by Naoki Onishi on 2019/05/21.
//  Copyright © 2019 Naoki Onishi. All rights reserved.
//

import Foundation

struct ItemListViewModel {

//    private let itemList: ItemList

    public func fetchItemList(requestCompletionHandler: @escaping (_ itemList: ItemList) -> Void) {
        print("▼start fetchItemList")

        // 後で別クラスに移動する
        let config: URLSessionConfiguration = URLSessionConfiguration.default
        let session: URLSession = URLSession(configuration: config)

//        let stringUrl = "http://localhost:3000/api/v1/item/list"
        let stringUrl = "http://172.16.31.75:3000/api/v1/item/list"
        //        let stringUrl = "https://qiita.com/api/v2/schema?locale=ja"
        let url: URL = URL(string: stringUrl)!

        let task = session.dataTask(with: url) { (data: Data?, response: URLResponse?, error: Error?) -> Void in
            print("▼start dataTask")
            if error != nil {
                print(error!.localizedDescription)
            }
            guard let data = data else {
                return
            }
            let json = try? JSONDecoder().decode(ItemList.self, from: data)
//            print(json!)
            requestCompletionHandler(json!)
        }
        print("▼before resume")
        task.resume()
        print("▼after resume")
    }
}
