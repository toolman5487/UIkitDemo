//
//  ViewController.swift
//  UIkitDemo
//
//  Created by Willy Hsu on 2024/12/31.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func goDatePicker(_ sender: Any) {
        goDatePicker()
    }
 
    func goDatePicker() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let nextVC = storyboard.instantiateViewController(withIdentifier: "DatePickerViewController")
        nextVC.modalPresentationStyle = .fullScreen
        self.present(nextVC, animated: true)
    }
}
