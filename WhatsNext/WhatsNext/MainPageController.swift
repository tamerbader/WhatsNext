//
//  MainPageController.swift
//  WhatsNext
//
//  Created by MetroStar on 8/8/17.
//  Copyright © 2017 TamerBader. All rights reserved.
//

import UIKit

class MainPageController: UIViewController, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
    
    @IBOutlet weak var dayPickerCollection: UICollectionView!

    @IBOutlet weak var headerView: UIView!
    @IBOutlet weak var dayPickerView: UIView!
    @IBOutlet weak var calendarConstraint: NSLayoutConstraint!
    
    var didDropDown:Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViews()
        

    }
    @IBAction func dropCalendar(_ sender: UIButton) {
        
            if (self.didDropDown) {
                
                UIView.animate(withDuration: 0.25, delay: 0, options: .curveEaseOut, animations: {
                    self.calendarConstraint.constant = self.headerView.frame.height + self.dayPickerView.frame.height
                    self.view.layoutIfNeeded()
                }, completion: nil)
                self.didDropDown = false
            } else {
                UIView.animate(withDuration: 0.25, delay: 0, options: .curveEaseOut, animations: {
                    self.calendarConstraint.constant = 0
                    self.view.layoutIfNeeded()
                }, completion: nil)
                self.didDropDown = true
            }
            
    }
    @IBAction func dropDownCalendar(_ sender: UIButton) {
        
        
    }
    
    func setupViews() {
        dayPickerCollection.delegate = self
        dayPickerCollection.dataSource = self
        
    }
    
    @available(iOS 6.0, *)
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell:DayPickerCell = collectionView.dequeueReusableCell(withReuseIdentifier: "dayCell", for: indexPath) as! DayPickerCell
        cell.dayName.text = "SUN"
        
        if (indexPath.row == 3) {
            cell.backgroundColor = UIColor.Green
            cell.dayName.textColor = UIColor.white
            cell.dayNumber.textColor = UIColor.white
            cell.notification.image = #imageLiteral(resourceName: "whitenotification")
        } else {
            cell.backgroundColor = UIColor.LightGray
            cell.dayName.textColor = UIColor.Gray
            cell.dayNumber.textColor = UIColor.Black
            cell.notification.image = #imageLiteral(resourceName: "greennotification")
        }
        return cell
    }
    
    @available(iOS 6.0, *)
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: self.view.frame.width/7, height: self.dayPickerCollection.frame.height)
        
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }

    

    
}
