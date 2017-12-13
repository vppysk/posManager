//
//  SecondViewController.swift
//  posManager
//
//  Created by 別府優介 on 2017/12/10.
//  Copyright © 2017年 別府優介. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController, UITableViewDelegate,  UITableViewDataSource{
    @IBOutlet weak var tableViews: UITableView!

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
        return 0
    }
    
    // 各セルの内容を返すメソッド
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // 再利用可能な cell を得る
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        
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
    }
    
}




