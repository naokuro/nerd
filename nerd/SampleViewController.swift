//
// Created by Naoki Onishi on 2019-05-23.
// Copyright (c) 2019 ___FULLUSERNAME___. All rights reserved.
//

import UIKit

class SampleViewController : UIViewController {

    private let itemListViewModel: ItemListViewModel = ItemListViewModel()
    private var itemList: ItemList!

    private var tableView: UITableView = UITableView()

    override func viewDidLoad() {
        super.viewDidLoad()

        // テーブルビューの設定
        setUpTableView: do {
//            self.tableView.frame = view.frame
            self.tableView.delegate = self
            self.tableView.dataSource = self
            self.tableView.register(UINib(nibName: "ItemCell", bundle: nil), forCellReuseIdentifier: "ItemCell")
            self.view.addSubview(self.tableView)
        }

        itemListViewModel.fetchItemList { (itemList) in
            print("▼result fetchItemList")
            print(itemList)
            self.itemList = itemList
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }

    }
}

extension SampleViewController: UITableViewDataSource, UITableViewDelegate {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print("numberOfRowsInSection")
        return self.itemList.items.count
//        return 10
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        print("cellForRowAt")
        let cell = tableView.dequeueReusableCell(withIdentifier: "ItemCell") as! ItemCell
        let item = self.itemList.items[indexPath.row]

        print(item)

        cell.brandName.text = item.brandName
        cell.itemName.text = item.name

        return cell
    }
}