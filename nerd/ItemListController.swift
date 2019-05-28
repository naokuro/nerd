//
//  ItemListController.swift
//  nerd
//
//  Created by Naoki Onishi on 2019/05/21.
//  Copyright © 2019 Naoki Onishi. All rights reserved.
//

import UIKit

class ItemListController: UIViewController  {
//    class ItemListController: UIViewController, UITableViewDataSource, UITableViewDelegate  {

    @IBOutlet weak var tableView: UITableView!
    
    private let itemListViewModel: ItemListViewModel = ItemListViewModel()
    private var itemList: ItemList!

    override func viewDidLoad() {
        super.viewDidLoad()

        // テーブルビューの設定
        setUpTableView: do {
//            self.tableView.frame = view.frame
            self.tableView.delegate = self
            self.tableView.dataSource = self
            self.tableView.register(UINib(nibName: "ItemCell", bundle: nil), forCellReuseIdentifier: "ItemCell")
        }

//        itemListViewModel.fetchItemList { [weak self] itemList in
//            print("▼result fetchItemList")
//            print(itemList)
//            self?.itemList = itemList
//            DispatchQueue.main.async {
//                self?.tableView.reloadData()
//            }
//        }

        itemListViewModel.fetchItemList { (itemList) in
            print("▼result fetchItemList")
            print(itemList)
            self.itemList = itemList
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }

    }

//    private func setupLayout(model: ItemList) {
//        guard let items: [Item] = model.items else {
//            return
//        }
//        items.forEach { item in
//            let itemListItemView = ItemListItemView()
//            let itemListItem: ItemListItem = ItemListItem(id: item.id, brandName: item.brandName, name: item.name, imageUrl: item.imageFile.first?.url)
//            itemListItemView.setData(itemListItem: itemListItem)
//            self.itemStackView.addArrangedSubview(ItemListItemView())
//        }
//    }

}

extension ItemListController: UITableViewDataSource, UITableViewDelegate {

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