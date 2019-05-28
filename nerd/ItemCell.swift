//
//  ItemListItemView.swift
//  nerd
//
//  Created by Naoki Onishi on 2019/05/22.
//  Copyright © 2019 Naoki Onishi. All rights reserved.
//

import UIKit
import Kingfisher

class ItemCell : UITableViewCell {
    
    @IBOutlet weak var planName: UILabel!
    @IBOutlet weak var brandName: UILabel!
    @IBOutlet weak var time: UILabel!
    @IBOutlet weak var itemName: UILabel!
    @IBOutlet weak var itemImage: UIImageView!
    @IBOutlet weak var itemDetailImage: UIImageView!
    
    private var itemListItem: ItemListItem?
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.loadNib()
    }

    func setData(itemListItem: ItemListItem) {
        let url = URL(string: itemListItem.itemImageUrl!)
        self.itemImage.kf.setImage(with: url)
        self.itemName.text = itemListItem.itemName
        self.brandName.text = itemListItem.brandName
        self.planName.text = itemListItem.planName
        self.time.text = ""
        self.itemDetailImage = nil
    }

    private func loadNib() {
        guard let view = UINib(nibName: String(describing: type(of: self)), bundle: nil).instantiate(withOwner: self, options: nil).first as? UIView else {
            return
        }
        view.frame = self.bounds
        self.addSubview(view)

//        let bundle = Bundle(for: type(of: self))
//        let nib = UINib(nibName: String(describing: type(of: self)), bundle: bundle)
//        if let view = nib.instantiate(withOwner: self, options: nil).first as? UIView {
//            view.frame = self.bounds
//            self.addSubview(view)
//        }
    }
}
