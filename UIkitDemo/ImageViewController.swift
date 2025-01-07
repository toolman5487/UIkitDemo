//
//  ImageViewController.swift
//  UIkitDemo
//
//  Created by Willy Hsu on 2025/1/6.
//

import UIKit

class ImageViewController: UIViewController {
    
    @IBOutlet weak var theLabel: UILabel!
    @IBOutlet weak var theSegment: UISegmentedControl!
    @IBOutlet weak var imageView: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        imageView.image = UIImage(named: "swift_003")
        imageView.contentMode = .scaleAspectFit
        start3DRotation()
        
    }
    
    @IBAction func segmentValueChanged(_ sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex {
        case 0:
            imageView.contentMode = .scaleAspectFit
            theLabel.text = "Fit"
        case 1:
            imageView.contentMode = .scaleAspectFill
            theLabel.text = "Fill"
        case 2:
            imageView.contentMode = .scaleToFill
            theLabel.text = "Stretch"
        default:
            imageView.contentMode = .scaleAspectFit
            theLabel.text = "Fit"
        }
    }
    
    func start3DRotation() {
        // 設置 3D 旋轉動畫
        let rotation = CABasicAnimation(keyPath: "transform.rotation.y")
        rotation.fromValue = 0
        rotation.toValue = Double.pi * 2
        rotation.duration = 3 // 動畫時長
        rotation.repeatCount = .infinity // 無限次數
        imageView.layer.add(rotation, forKey: "3DRotation")
    }
    
}
