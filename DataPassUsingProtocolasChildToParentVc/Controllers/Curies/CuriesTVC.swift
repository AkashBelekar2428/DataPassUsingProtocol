//
//  CuriesTVC.swift
//  DataPassUsingProtocolasChildToParentVc
//
//  Created by Akash Belekar on 28/03/23.
//

import UIKit

class CuriesTVC: UITableViewCell{
   
    @IBOutlet weak var herlLbl:UILabel!
    @IBOutlet weak var nameLbl:UILabel!

    var obj = CuriesDetailsViewController.init()
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
}
