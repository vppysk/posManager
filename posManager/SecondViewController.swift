//
//  SecondViewController.swift
//  posManager
//
//  Created by 別府優介 on 2017/12/10.
//  Copyright © 2017年 別府優介. All rights reserved.
//

import UIKit
import RealmSwift

class SecondViewController: UIViewController, UITableViewDelegate,  UITableViewDataSource{
    @IBOutlet weak var tableViews: UITableView!

    // Realmインスタンスを取得する
    let realm = try! Realm()  // ←追加
    var taskArray = try! Realm().objects(Setting.self).sorted(byKeyPath: "InTime1", ascending: false)  // ←追加
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        tableViews.delegate = self
        tableViews.dataSource = self
    }   

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    // データの数（＝セルの数）を返すメソッド
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

        return taskArray.count
    }
    
    // 各セルの内容を返すメソッド
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // 再利用可能な cell を得る
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! CustomCell
        
        let task = taskArray[indexPath.row]
        
        // Cellに値を設定する
        cell.name.text = task.name
        
        cell.time1.text = "①\(task.InTime1)~\(task.OutTime1)"
        if task.InTime2 != ""{
        cell.time2.isHidden = false;
        cell.time2.text = "②\(task.InTime2)~\(task.OutTime2)"
        }
        else {
            cell.time2.isHidden = true;
        }
        if task.InTime3 != ""{
        cell.time3.isHidden = false;
        cell.time3.text = "③\(task.InTime3)~\(task.OutTime3)"
        }
        else {
            cell.time3.isHidden = true;
        }
        
    
        return cell
    }
    
    // MARK: UITableViewDelegateプロトコルのメソッド
    // 各セルを選択した時に実行されるメソッド
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "cellSegue",sender: nil)
    }
    
    // セルが削除が可能なことを伝えるメソッド
    func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath)-> UITableViewCellEditingStyle {
        return UITableViewCellEditingStyle.delete
    }
    // Delete ボタンが押された時に呼ばれるメソッド
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == UITableViewCellEditingStyle.delete {
            // データベースから削除する  // ←以降追加する
            try! realm.write {
                self.realm.delete(self.taskArray[indexPath.row])
                tableView.deleteRows(at: [indexPath as IndexPath], with: UITableViewRowAnimation.fade)
            }
        }
    }
    // segue で画面遷移するに呼ばれる
    override func prepare(for segue: UIStoryboardSegue, sender: Any?){
        let SettingViewController:settingViewController = segue.destination as! settingViewController
        
        if segue.identifier == "cellSegue" {
            let indexPath = self.tableViews.indexPathForSelectedRow
            SettingViewController.task = taskArray[indexPath!.row]
        } else {
            let task = Setting()
            
            //Stringで
            //task.InTime1 = NSDate()
            //task.InTime2 = NSDate()
            //task.InTime3 = NSDate()
            //task.OutTime1 = NSDate()
            //task.OutTime2 = NSDate()
            //task.OutTime3 = NSDate()
            
            if taskArray.count != 0 {
                task.id = taskArray.max(ofProperty: "id")! + 1
            }
            
            SettingViewController.task = task
        }
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tableViews.reloadData()
    }
    
}




