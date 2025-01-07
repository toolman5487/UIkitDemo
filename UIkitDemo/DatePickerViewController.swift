//
//  DatePickerViewController.swift
//  UIkitDemo
//
//  Created by Willy Hsu on 2025/1/2.
//

import UIKit

class DatePickerViewController: UIViewController {

    @IBOutlet weak var displayDate: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func datePickAction(_ sender: UIDatePicker) {
        let dateFormater = DateFormatter()
        dateFormater.dateFormat = "yyyy/MMM/dd HH:mm"
        displayDate.text = dateFormater.string(from: sender.date)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
