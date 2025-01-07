//
//  TimerViewController.swift
//  UIkitDemo
//
//  Created by Willy Hsu on 2025/1/3.
//

import UIKit

class TimerViewController: UIViewController {
    
    @IBOutlet weak var theView: UIView!
    @IBOutlet weak var theSlider: UISlider!
    @IBOutlet weak var theSegment: UISegmentedControl!
    var theTimer: Timer!
    var originAngle: CGFloat = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        theView.layer.cornerRadius = 10
        theTimer = Timer.scheduledTimer(timeInterval: 0.01, target: self, selector: #selector(rotateView), userInfo: nil, repeats: true)
        start3DRotation()
 
    }
    @IBAction func switchAction(_ sender: UISwitch) {
        if sender.isOn{
            theTimer.fireDate = Date()
        }else {
            var components = DateComponents()
            components.year = 100
            theTimer.fireDate = Calendar.current.date(byAdding: components, to: Date()) ?? Date()
        }
    }
    
    func start3DRotation() {
        let rotation = CABasicAnimation(keyPath: "transform.rotation.y")
        rotation.fromValue = 0
        rotation.toValue = Double.pi * 2
        rotation.duration = 3
        rotation.repeatCount = .infinity
        theView.layer.add(rotation, forKey: "3DRotation")
    }
    
    @objc func rotateView(){
        switch theSegment.selectedSegmentIndex {
        case 0:
            originAngle += CGFloat(theSlider.value)
        case 1:
            originAngle -= CGFloat(theSlider.value)
        default:
            break
            
        }
        
        
        let targetAngle : CGFloat = originAngle * (.pi / 180)
        theView.transform = CGAffineTransform(rotationAngle: targetAngle)
        
    }
    deinit {
        theTimer?.invalidate()
    }
    
}
