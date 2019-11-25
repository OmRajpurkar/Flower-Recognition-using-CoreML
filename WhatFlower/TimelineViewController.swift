//
//  TimelineViewController.swift
//  WhatFlower
//
//  Created by OM Rajpurkar on 25/09/19.
//  Copyright © 2019 Angela Yu. All rights reserved.
//

import Foundation
import UIKit
import Firebase

class TimelineViewController: UIViewController {
    
    var scrollView: UIScrollView!
    var timeline: TimelineView!
    var arrData = [TimeFrame]()
    var ref = DatabaseReference.init()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.ref = Database.database().reference()
        getAllFIRData()
        
        // Do any additional setup after loading the view, typically from a nib.
        scrollView = UIScrollView(frame: view.bounds)
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(scrollView)
        
        NSLayoutConstraint.activate([
            NSLayoutConstraint(item: scrollView, attribute: .leading, relatedBy: .equal, toItem: view, attribute: .leading, multiplier: 1.0, constant: 0),
            NSLayoutConstraint(item: scrollView, attribute: .top, relatedBy: .equal, toItem: view, attribute: .top, multiplier: 1.0, constant: 29),
            NSLayoutConstraint(item: scrollView, attribute: .trailing, relatedBy: .equal, toItem: view, attribute: .trailing, multiplier: 1.0, constant: 0),
            NSLayoutConstraint(item: scrollView, attribute: .bottom, relatedBy: .equal, toItem: view, attribute: .bottom, multiplier: 1.0, constant: 0)
            ])
                
        
        
    }
    
    @IBAction func bulletChanged(_ sender: UISegmentedControl) {
        timeline.bulletType = [BulletType.circle, BulletType.hexagon, BulletType.diamond, BulletType.diamondSlash, BulletType.carrot, BulletType.arrow][sender.selectedSegmentIndex]
    }

    override var prefersStatusBarHidden : Bool {
        return true
    }
    
    func getAllFIRData(){
        ref.child("timelinedb").queryOrderedByKey().observe(.value) { (snapshot) in
            self.arrData.removeAll()
            if let snapShot = snapshot.children.allObjects as? [DataSnapshot]{
                for snap in snapShot{
                    if let mainDict = snap.value as? [String:AnyObject]{
                        let date = mainDict["date"] as? String
                        let text = mainDict["text"] as? String
                        let image = mainDict["imageURL"] as? String ?? ""
                        self.arrData.append(TimeFrame(date: date!, text: text!, image: image))
                    }
                }
                self.timeline = TimelineView(bulletType: .circle, timeFrames: self.arrData)
                self.timeline.bulletSize = 16
                self.scrollView.addSubview(self.timeline)
                self.scrollView.addConstraints([
                    NSLayoutConstraint(item: self.timeline, attribute: .leading, relatedBy: .equal, toItem: self.scrollView, attribute: .leading, multiplier: 1.0, constant: 0),
                    NSLayoutConstraint(item: self.timeline, attribute: .bottom, relatedBy: .lessThanOrEqual, toItem: self.scrollView, attribute: .bottom, multiplier: 1.0, constant: 0),
                    NSLayoutConstraint(item: self.timeline, attribute: .top, relatedBy: .equal, toItem: self.scrollView, attribute: .top, multiplier: 1.0, constant: 0),
                    NSLayoutConstraint(item: self.timeline, attribute: .trailing, relatedBy: .equal, toItem: self.scrollView, attribute: .trailing, multiplier: 1.0, constant: 0),
                    NSLayoutConstraint(item: self.timeline, attribute: .width, relatedBy: .equal, toItem: self.scrollView, attribute: .width, multiplier: 1.0, constant: 0)
                    ])

                self.view.sendSubviewToBack(self.scrollView)
            }
        }
    }
        
}

