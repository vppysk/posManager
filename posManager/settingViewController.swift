//
//  settingViewController.swift
//  posManager
//
//  Created by 別府優介 on 2017/12/10.
//  Copyright © 2017年 別府優介. All rights reserved.
//

import UIKit

class settingViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource{
    @IBOutlet weak var inTime1: UITextField!
    @IBOutlet weak var outTime1: UITextField!
    @IBOutlet weak var inTime2: UITextField!
    @IBOutlet weak var outTime2: UITextField!
    @IBOutlet weak var inTime3: UITextField!
    @IBOutlet weak var outTime3: UITextField!
        
    var pickerView1: UIPickerView = UIPickerView()
    var array1 = ["1", "2", "3"]
    
    var pickerView2: UIPickerView = UIPickerView()
    var array2 = ["A", "B", "C"]
    
    var pickerView3: UIPickerView = UIPickerView()
    var array3 = ["1", "2", "3"]
    
    var pickerView4: UIPickerView = UIPickerView()
    var array4 = ["1", "2", "3"]

    var pickerView5: UIPickerView = UIPickerView()
    var array5 = ["1", "2", "3"]
    
    var pickerView6: UIPickerView = UIPickerView()
    var array6 = ["1", "2", "3"]



    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        ////in1
        pickerView1.frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.size.width, height: pickerView1.bounds.size.height)
        pickerView1.tag = 1             // <<<<<<<<<<　追加
        pickerView1.delegate   = self
        pickerView1.dataSource = self
        
        let vi1 = UIView(frame: pickerView1.bounds)
        vi1.backgroundColor = UIColor.white
        vi1.addSubview(pickerView1)
        
        inTime1.inputView = vi1
        
        let toolBar1 = UIToolbar()
        toolBar1.barStyle = UIBarStyle.default
        toolBar1.isTranslucent = true
        toolBar1.tintColor = UIColor.black
        let doneButton1   = UIBarButtonItem(title: "Done", style: UIBarButtonItemStyle.done, target: self, action: #selector(settingViewController.donePressed))
        let spaceButton1  = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.flexibleSpace, target: nil, action: nil)
        toolBar1.setItems([spaceButton1, doneButton1], animated: false)
        toolBar1.isUserInteractionEnabled = true
        toolBar1.sizeToFit()
        inTime1.inputAccessoryView = toolBar1
        
        //out1
        pickerView2.frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.size.width, height: pickerView2.bounds.size.height)
        pickerView2.tag = 2             // <<<<<<<<<<　追加
        pickerView2.delegate   = self
        pickerView2.dataSource = self
        
        let vi2 = UIView(frame: pickerView2.bounds)
        vi2.backgroundColor = UIColor.white
        vi2.addSubview(pickerView2)
        
        outTime1.inputView = vi2
        
        let toolBar2 = UIToolbar()
        toolBar2.barStyle = UIBarStyle.default
        toolBar2.isTranslucent = true
        toolBar2.tintColor = UIColor.black
        let doneButton2   = UIBarButtonItem(title: "Done", style: UIBarButtonItemStyle.done, target: self, action: #selector(settingViewController.donePressed))
        let spaceButton2  = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.flexibleSpace, target: nil, action: nil)
        toolBar2.setItems([spaceButton2, doneButton2], animated: false)
        toolBar2.isUserInteractionEnabled = true
        toolBar2.sizeToFit()
        outTime1.inputAccessoryView = toolBar2
       
        ////////in2
        pickerView3.frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.size.width, height: pickerView1.bounds.size.height)
        pickerView3.tag = 3             // <<<<<<<<<<　追加
        pickerView3.delegate   = self
        pickerView3.dataSource = self
        
        let vi3 = UIView(frame: pickerView3.bounds)
        vi3.backgroundColor = UIColor.white
        vi3.addSubview(pickerView3)
        
        inTime2.inputView = vi3
        
        let toolBar3 = UIToolbar()
        toolBar3.barStyle = UIBarStyle.default
        toolBar3.isTranslucent = true
        toolBar3.tintColor = UIColor.black
        let doneButton3   = UIBarButtonItem(title: "Done", style: UIBarButtonItemStyle.done, target: self, action: #selector(settingViewController.donePressed))
        let spaceButton3  = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.flexibleSpace, target: nil, action: nil)
        toolBar3.setItems([spaceButton3, doneButton3], animated: false)
        toolBar3.isUserInteractionEnabled = true
        toolBar3.sizeToFit()
        inTime2.inputAccessoryView = toolBar3

        ////////out2
        pickerView4.frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.size.width, height: pickerView4.bounds.size.height)
        pickerView4.tag = 4             // <<<<<<<<<<　追加
        pickerView4.delegate   = self
        pickerView4.dataSource = self
        
        let vi4 = UIView(frame: pickerView4.bounds)
        vi4.backgroundColor = UIColor.white
        vi4.addSubview(pickerView4)
        
        outTime2.inputView = vi4
        
        let toolBar4 = UIToolbar()
        toolBar4.barStyle = UIBarStyle.default
        toolBar4.isTranslucent = true
        toolBar4.tintColor = UIColor.black
        let doneButton4   = UIBarButtonItem(title: "Done", style: UIBarButtonItemStyle.done, target: self, action: #selector(settingViewController.donePressed))
        let spaceButton4  = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.flexibleSpace, target: nil, action: nil)
        toolBar4.setItems([spaceButton4, doneButton4], animated: false)
        toolBar4.isUserInteractionEnabled = true
        toolBar4.sizeToFit()
        outTime2.inputAccessoryView = toolBar4
        
        ////////in3
        pickerView5.frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.size.width, height: pickerView5.bounds.size.height)
        pickerView5.tag = 5             // <<<<<<<<<<　追加
        pickerView5.delegate   = self
        pickerView5.dataSource = self
        
        let vi5 = UIView(frame: pickerView5.bounds)
        vi5.backgroundColor = UIColor.white
        vi5.addSubview(pickerView5)
        
        inTime3.inputView = vi5
        
        let toolBar5 = UIToolbar()
        toolBar5.barStyle = UIBarStyle.default
        toolBar5.isTranslucent = true
        toolBar5.tintColor = UIColor.black
        let doneButton5   = UIBarButtonItem(title: "Done", style: UIBarButtonItemStyle.done, target: self, action: #selector(settingViewController.donePressed))
        let spaceButton5  = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.flexibleSpace, target: nil, action: nil)
        toolBar5.setItems([spaceButton5, doneButton5], animated: false)
        toolBar5.isUserInteractionEnabled = true
        toolBar5.sizeToFit()
        inTime3.inputAccessoryView = toolBar5
        
        ////////out3
        pickerView6.frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.size.width, height: pickerView6.bounds.size.height)
        pickerView6.tag = 6             // <<<<<<<<<<　追加
        pickerView6.delegate   = self
        pickerView6.dataSource = self
        
        let vi6 = UIView(frame: pickerView6.bounds)
        vi6.backgroundColor = UIColor.white
        vi6.addSubview(pickerView6)
        
        outTime3.inputView = vi6
        
        let toolBar6 = UIToolbar()
        toolBar6.barStyle = UIBarStyle.default
        toolBar6.isTranslucent = true
        toolBar6.tintColor = UIColor.black
        let doneButton6   = UIBarButtonItem(title: "Done", style: UIBarButtonItemStyle.done, target: self, action: #selector(settingViewController.donePressed))
        let spaceButton6  = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.flexibleSpace, target: nil, action: nil)
        toolBar6.setItems([spaceButton6, doneButton6], animated: false)
        toolBar6.isUserInteractionEnabled = true
        toolBar6.sizeToFit()
        outTime3.inputAccessoryView = toolBar6



    }
    
    // Done
    func donePressed() {
        view.endEditing(true)
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        switch pickerView.tag{    // <<<<<<<<<<　変更
        case 1:return array1[row]
        case 2:return array2[row]
        case 3:return array3[row]
        case 4:return array4[row]
        case 5:return array5[row]
        default:return array6[row]
            }
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        switch pickerView.tag{    // <<<<<<<<<<　変更
        case 1:return array1.count
        case 2:return array2.count
        case 3:return array3.count
        case 4:return array4.count
        case 5:return array5.count
        default:return array6.count
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        switch pickerView.tag{    // <<<<<<<<<<　変更
        case 1:return inTime1.text = array1[row]
        case 2:return outTime1.text = array2[row]
        case 3:return inTime2.text = array3[row]
        case 4:return outTime2.text = array4[row]
        case 5:return inTime3.text = array5[row]        default:return outTime3.text = array6[row]
        }
}





        // Do any additional setup after loading the view.
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
