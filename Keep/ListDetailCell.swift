//
//  ListDetailCell.swift
//  Keep
//
//  Created by Luna An on 2/20/17.
//  Copyright © 2017 Mimicatcodes. All rights reserved.
//

import UIKit
import MGSwipeTableCell

class ListDetailCell:MGSwipeTableCell {
    
    var tapAction: ((UITableViewCell) -> Void)?
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var checkBoxImgView: UIImageView!
    @IBOutlet weak var moveButton: UIButton!
    @IBAction func moveButtonTapped(_ sender: UIButton) { tapAction?(self) }
    
}
