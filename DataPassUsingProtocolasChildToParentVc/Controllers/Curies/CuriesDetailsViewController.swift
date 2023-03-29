//
//  CuriesDetailsViewController.swift
//  DataPassUsingProtocolasChildToParentVc
//
//  Created by Akash Belekar on 28/03/23.
//

import UIKit
protocol TableCellColorDelegate{
    func backgroundColor()
}
class CuriesDetailsViewController: UIViewController {
    @IBOutlet weak var nameLbl:UILabel!
    @IBOutlet weak var herlLbl:UILabel!

    var obj = CurriesResponse.init()
    var colorDelegate:TableCellColorDelegate?
    override func viewDidLoad() {
        super.viewDidLoad()
        nameLbl.text = obj.name
        herlLbl.isUserInteractionEnabled = true
        herlLbl.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(tapped(_ :))))
        herlLbl.text = obj.hrel
        herlLbl.textColor = .blue
    }
    @objc func tapped(_ sender:UITapGestureRecognizer){
        let url = self.obj.hrel
        print("url",url!)
        if let urls = URL(string: url!) {
            print("urls",urls)
            UIApplication.shared.open(urls)
        }
    }
    @IBAction func backBtn(){
        dismiss(animated: true)
    }
    @IBAction func marksBtn(){
        colorDelegate?.backgroundColor()
        dismiss(animated: true)
        
    }
}
