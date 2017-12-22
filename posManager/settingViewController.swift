//
//  settingViewController.swift
//  posManager
//
//  Created by 別府優介 on 2017/12/10.
//  Copyright © 2017年 別府優介. All rights reserved.
//

import UIKit
import RealmSwift

class settingViewController: UIViewController{
    
    @IBOutlet weak var nameTextField: UITextField!
    
    
    @IBOutlet weak var inTime1: UITextField!
    @IBOutlet weak var outTime1: UITextField!
    @IBOutlet weak var inTime2: UITextField!
    @IBOutlet weak var outTime2: UITextField!
    @IBOutlet weak var inTime3: UITextField!
    @IBOutlet weak var outTime3: UITextField!
    
    let realm = try! Realm()
    var task:Setting!   // 追加する
        
    var toolBarI1:UIToolbar!
    var toolBarI2:UIToolbar!
    var toolBarI3:UIToolbar!
    var toolBarO1:UIToolbar!
    var toolBarO2:UIToolbar!
    var toolBarO3:UIToolbar!
    
    let datePickerViewI1:UIDatePicker = UIDatePicker()
    let datePickerViewI2:UIDatePicker = UIDatePicker()
    let datePickerViewI3:UIDatePicker = UIDatePicker()
    let datePickerViewO1:UIDatePicker = UIDatePicker()
    let datePickerViewO2:UIDatePicker = UIDatePicker()
    let datePickerViewO3:UIDatePicker = UIDatePicker()

    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let tapGesture: UITapGestureRecognizer = UITapGestureRecognizer(target:self, action:#selector(dismissKeyboard))
        self.view.addGestureRecognizer(tapGesture)
        
        let formatter = DateFormatter()
        formatter.dateFormat  = "H:mm";
        
       
        
        let inTime1String:String = formatter.string(from: task.InTime1 as Date)
        let inTime2String:String = formatter.string(from: task.InTime2 as Date)
        let inTime3String:String = formatter.string(from: task.InTime3 as Date)
        let outTime1String:String = formatter.string(from: task.OutTime1 as Date)
        let outTime2String:String = formatter.string(from: task.OutTime2 as Date)
        let outTime3String:String = formatter.string(from: task.OutTime3 as Date)
        
        nameTextField.text = task.name
        
        //時間表示
        inTime1.text = inTime1String
        datePickerViewI1.date = task.InTime1 as Date
        inTime2.text = inTime2String
        datePickerViewI2.date = task.InTime2 as Date
        inTime3.text = inTime3String
        datePickerViewI3.date = task.InTime3 as Date
        outTime1.text = outTime1String
        datePickerViewO1.date = task.OutTime1 as Date
        outTime2.text = outTime2String
        datePickerViewO2.date = task.OutTime2 as Date
        outTime3.text = outTime3String
        datePickerViewO3.date = task.OutTime3 as Date
        //datepicker上のtoolbarのdoneボタン
        
        //inTime1
        toolBarI1 = UIToolbar()
        toolBarI1.sizeToFit()
        let toolBarBtnI1 = UIBarButtonItem(title: "DONE", style: .plain, target: self, action: #selector(settingViewController.doneBtn))
        toolBarI1.items = [toolBarBtnI1]
        inTime1.inputAccessoryView = toolBarI1
        
        //outTime1
        toolBarO1 = UIToolbar()
        toolBarO1.sizeToFit()
        let toolBarBtnO1 = UIBarButtonItem(title: "DONE", style: .plain, target: self, action: #selector(settingViewController.doneBtn))
        toolBarO1.items = [toolBarBtnO1]
        outTime1.inputAccessoryView = toolBarO1
        
        //inTime2
        toolBarI2 = UIToolbar()
        toolBarI2.sizeToFit()
        let toolBarBtnI2 = UIBarButtonItem(title: "DONE", style: .plain, target: self, action: #selector(settingViewController.doneBtn))
        toolBarI2.items = [toolBarBtnI2]
        inTime2.inputAccessoryView = toolBarI2

        //outTime2
        toolBarO2 = UIToolbar()
        toolBarO2.sizeToFit()
        let toolBarBtnO2 = UIBarButtonItem(title: "DONE", style: .plain, target: self, action: #selector(settingViewController.doneBtn))
        toolBarO2.items = [toolBarBtnO2]
        outTime2.inputAccessoryView = toolBarO2
        
        //inTime3
        toolBarI3 = UIToolbar()
        toolBarI3.sizeToFit()
        let toolBarBtnI3 = UIBarButtonItem(title: "DONE", style: .plain, target: self, action: #selector(settingViewController.doneBtn))
        toolBarI3.items = [toolBarBtnI3]
        inTime3.inputAccessoryView = toolBarI3
        
        //outTime3
        toolBarO3 = UIToolbar()
        toolBarO3.sizeToFit()
        let toolBarBtnO3 = UIBarButtonItem(title: "DONE", style: .plain, target: self, action: #selector(settingViewController.doneBtn))
        toolBarO3.items = [toolBarBtnO3]
        outTime3.inputAccessoryView = toolBarO3
}
    
    
    //inTime1
    //textFieldが選択されたらdatepickerを表示
    @IBAction func inTime1Editing(_ sender: UITextField) {
        var _: Int
        datePickerViewI1.datePickerMode = UIDatePickerMode.time
        datePickerViewI1.minuteInterval = 15
        sender.inputView = datePickerViewI1
        datePickerViewI1.addTarget(self, action: #selector(settingViewController.datePickerI1ValueChanged(_:)), for: UIControlEvents.valueChanged)
    }
    
    //datepickerが選択されたらtextfieldに表示
    func datePickerI1ValueChanged(_ sender:UIDatePicker) {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat  = "H:mm";
        inTime1.text = dateFormatter.string(from:sender.date)
    }

    //outTime1
    @IBAction func outTime1Editing(_ sender: UITextField) {
        var _: Int
        datePickerViewO1.datePickerMode = UIDatePickerMode.time
        datePickerViewO1.minuteInterval = 15
        sender.inputView = datePickerViewO1
        datePickerViewO1.addTarget(self, action: #selector(settingViewController.datePickerO1ValueChanged(_:)), for: UIControlEvents.valueChanged)
    }
    func datePickerO1ValueChanged(_ sender:UIDatePicker) {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat  = "H:mm";
        outTime1.text = dateFormatter.string(from:sender.date)
    }
    
    //inTime2
    @IBAction func inTime2Editing(_ sender: UITextField) {
        var _: Int
        datePickerViewI2.datePickerMode = UIDatePickerMode.time
        datePickerViewI2.minuteInterval = 15
        sender.inputView = datePickerViewI2
        datePickerViewI2.addTarget(self, action: #selector(settingViewController.datePickerI2ValueChanged(_:)), for: UIControlEvents.valueChanged)
    }
    func datePickerI2ValueChanged(_ sender:UIDatePicker) {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat  = "H:mm";
        inTime2.text = dateFormatter.string(from:sender.date)
    }

    //outTime2
    @IBAction func outTime2Editing(_ sender: UITextField) {
        var _: Int
       datePickerViewO2.datePickerMode = UIDatePickerMode.time
        datePickerViewO2.minuteInterval = 15
        sender.inputView = datePickerViewO2
        datePickerViewO2.addTarget(self, action: #selector(settingViewController.datePickerO2ValueChanged(_:)), for: UIControlEvents.valueChanged)
    }
    func datePickerO2ValueChanged(_ sender:UIDatePicker) {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat  = "H:mm";
        outTime2.text = dateFormatter.string(from:sender.date)
    }
    
    //inTime3
    @IBAction func inTime3Editing(_ sender: UITextField) {
        var _: Int
        datePickerViewI3.datePickerMode = UIDatePickerMode.time
        datePickerViewI3.minuteInterval = 15
        sender.inputView = datePickerViewI3
        datePickerViewI3.addTarget(self, action: #selector(settingViewController.datePickerI3ValueChanged(_:)), for: UIControlEvents.valueChanged)
    }
    func datePickerI3ValueChanged(_ sender:UIDatePicker) {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat  = "H:mm";
        inTime3.text = dateFormatter.string(from:sender.date)
    }

    //outTime3
    @IBAction func outTime3Editing(_ sender: UITextField) {
        var _: Int
        datePickerViewO3.datePickerMode = UIDatePickerMode.time
        datePickerViewO3.minuteInterval = 15
        sender.inputView = datePickerViewO3
        datePickerViewO3.addTarget(self, action: #selector(settingViewController.datePickerO3ValueChanged(_:)), for: UIControlEvents.valueChanged)
    }
    func datePickerO3ValueChanged(_ sender:UIDatePicker) {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat  = "H:mm";
        outTime3.text = dateFormatter.string(from:sender.date)
    }

    
    
    
    
    
    //doneボタン
    func doneBtn() {
        view.endEditing(true)
    }
    
   


    @IBAction func nameText(_ sender: Any) {
        nameTextField.endEditing(true)
    }

        // Do any additional setup after loading the view.
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
     // Dispose of any resources that can be recreated.
        
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        try! realm.write {
            
            
            self.task.name = self.nameTextField.text!
           
           
            self.task.InTime1 = self.datePickerViewI1.date as NSDate 
            self.task.InTime2 = self.datePickerViewI2.date as NSDate
            self.task.InTime3 = self.datePickerViewI3.date as NSDate
            self.task.OutTime1 = self.datePickerViewO1.date as NSDate
            self.task.OutTime2 = self.datePickerViewO1.date as NSDate
            self.task.OutTime3 = self.datePickerViewO1.date as NSDate
            
            self.realm.add(self.task, update: true)

           
        }
        
        super.viewWillDisappear(animated)
    }
    
    func dismissKeyboard(){
        // キーボードを閉じる
        view.endEditing(true)
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

    //@IBAction func nameTextField(_ sender: Any) {
        //nameTextField.resignFirstResponder()
        
    //}
    
   }
