//
//  TodoCell.swift
//  Growth List[test4]
//
//  Created by 松下怜平 on 2019/12/08.
//  Copyright © 2019 com.iitech. All rights reserved.
//

import UIKit

class TodoCell: UITableViewCell {

    @IBOutlet weak var todoLabel: UILabel!
    @IBOutlet weak var delete: UIButton!
    @IBOutlet weak var complet: UIButton!
    
    func cellControl(indexPath: IndexPath) {
        self.todoLabel.text = individualContents[indexPath.row]
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
