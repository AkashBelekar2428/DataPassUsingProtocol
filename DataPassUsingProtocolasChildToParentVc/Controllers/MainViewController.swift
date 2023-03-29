//
//  MainViewController.swift
//  DataPassUsingProtocolasChildToParentVc
//
//  Created by Akash Belekar on 28/03/23.
//

import UIKit

class MainViewController: UIViewController,updateDataDelegate,updateCuriesDataDelegate,TableCellColorDelegate,changeBackgroundcolorDelegate{
    
    @IBOutlet weak var backgroundView:UIView!
    
    var newspaperVC = NewspapersViewController()
    var curiesVC = CuriesViewController()
    var index = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        newspaperVC = NewspapersViewController.init()
        curiesVC = CuriesViewController.init()

        
    }
    @IBAction func segmentBtn(_ sender:UISegmentedControl){
        
        switch sender.selectedSegmentIndex{
        case 0:
            print(sender.selectedSegmentIndex)
            addChild(newspaperVC)
            let frame = backgroundView.frame
            newspaperVC.view.frame = frame
            newspaperVC.delegate = self
            view.addSubview(newspaperVC.view)
            newspaperVC.didMove(toParent: self)
            
        case 1:
            print(sender.selectedSegmentIndex)
            addChild(curiesVC)
            let frame = backgroundView.frame
            curiesVC.view.frame = frame
            curiesVC.delegate = self
            view.addSubview( curiesVC.view)
            curiesVC.didMove(toParent: self)
            
        default :
            print("No Indexpath Found")
        }
        
    }
    func newDataInsert(ObjData: UserResponse,index:Int) {
        self.index = index
        let vc = NewsPaperDetailsViewController()
        vc.modalPresentationStyle  = .fullScreen
        vc.obj = ObjData
        vc.delegte = self
        present(vc, animated: true)
    }
    func dataUpdated(objData: CurriesResponse, index: Int) {
        self.index = index
        let vc = CuriesDetailsViewController()
        vc.modalPresentationStyle = .fullScreen
        vc.obj = objData
        vc.colorDelegate = self
        present(vc, animated: true)
    }
    func backgroundColor() {
     if curiesVC != nil{
         curiesVC.curiesModel?.curies![self.index].isSelected = true
         self.curiesVC.curiesTbl.reloadData()
         
        }
    }
    func backgroundChange() {
        if newspaperVC != nil{
            newspaperVC.newspaperModel[self.index].isSelected = true
            newspaperVC.newspaperTbl.reloadData()
        }
    }
    
    
}
