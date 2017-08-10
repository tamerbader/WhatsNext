//
//  MainPageController.swift
//  WhatsNext
//
//  Created by MetroStar on 8/8/17.
//  Copyright © 2017 TamerBader. All rights reserved.
//

import UIKit

class MainPageController: UIViewController, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout, UICollectionViewDataSource, UITableViewDelegate, UITableViewDataSource {
    
    var days:[Day] = [Day]()
    
    
    @IBOutlet weak var dayPickerCollection: UICollectionView!
    
    @IBOutlet weak var headerView: UIView!
    @IBOutlet weak var dayPickerView: UIView!
    @IBOutlet weak var calendarConstraint: NSLayoutConstraint!
    
    @IBOutlet weak var taskTable: UITableView!
    var didDropDown:Bool = false
    
    var selectedDay:Int!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViews()
        
        for i in 0 ... 7 {
            let newDay:Day = Day(timestamp: Calendar.current.date(byAdding: .day, value: i - 3, to: Date())!)
            newDay.addTask(newTask: Task(description: "New Task", beginningTime: Date()))
            days.append(newDay)
            
        }
        selectedDay = 3
        
        dayPickerCollection.reloadData()
        
        
        
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
    
    func setupViews() {
        dayPickerCollection.delegate = self
        dayPickerCollection.dataSource = self
        
        taskTable.delegate = self
        taskTable.dataSource = self
        
        taskTable.estimatedRowHeight = 200
        
        
    }
    
    @available(iOS 6.0, *)
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell:DayPickerCell = collectionView.dequeueReusableCell(withReuseIdentifier: "dayCell", for: indexPath) as! DayPickerCell
        let currentDay: Day = days[indexPath.row]
        
        cell.dayName.text = currentDay.Weekday
        cell.dayNumber.text = "\(currentDay.DayNumber)"
        
        
        if let day = selectedDay {
            
            if (indexPath.row == day) {
                cell.backgroundColor = UIColor.Green
                cell.dayName.textColor = UIColor.white
                cell.dayNumber.textColor = UIColor.white
                if (currentDay.Tasks.count > 0) {
                    cell.notification.image = #imageLiteral(resourceName: "whitenotification")
                } else {
                    cell.notification.image = nil
                    
                }
            } else {
                cell.backgroundColor = UIColor.LightGray
                cell.dayName.textColor = UIColor.Gray
                cell.dayNumber.textColor = UIColor.Black
                if (currentDay.Tasks.count > 0) {
                    cell.notification.image = #imageLiteral(resourceName: "greennotification")
                } else {
                    cell.notification.image = nil
                    
                }
            }
            
        } else {
            cell.backgroundColor = UIColor.LightGray
            cell.dayName.textColor = UIColor.Gray
            cell.dayNumber.textColor = UIColor.Black
            if (currentDay.Tasks.count > 0) {
                cell.notification.image = #imageLiteral(resourceName: "greennotification")
            } else {
                cell.notification.image = nil
                
            }
        }
        
        return cell
    }
    
    @available(iOS 6.0, *)
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return days.count
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        selectedDay = indexPath.row
        OperationQueue.main.addOperation {
            self.dayPickerCollection.reloadData()
        }
    }
    
    @available(iOS 2.0, *)
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = Bundle.main.loadNibNamed("TaskCell", owner: self, options: nil)?.first as! TaskCell
        
        
        cell.taskName.text = "Meeting with Janett"
        cell.taskTime.text = "1 - 2pm"
        cell.userImage.image = #imageLiteral(resourceName: "profileImage")
        cell.userImage.layer.cornerRadius  = cell.userImage.frame.width / 2
        return cell
    }
    
    @available(iOS 2.0, *)
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return days.count
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: self.view.frame.width/7, height: self.dayPickerCollection.frame.height)
        
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    
    
    
}
