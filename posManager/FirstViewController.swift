//
//  FirstViewController.swift
//  posManager
//
//  Created by 別府優介 on 2017/12/10.
//  Copyright © 2017年 別府優介. All rights reserved.
//

import UIKit
import RealmSwift

// ユーティリティメソッド CGPoint同士の足し算を+で書けるようにする
func -(_ left:CGPoint, _ right:CGPoint)->CGPoint{
    return CGPoint(x:left.x - right.x, y:left.y - right.y)
}
// ユーティリティメソッド CGPoint同士の引き算を-で書けるようにする
func +(_ left:CGPoint, _ right:CGPoint)->CGPoint{
    return CGPoint(x:left.x + right.x, y:left.y + right.y)
}



class FirstViewController: UIViewController {
    // タッチ開始時のUIViewのorigin
    var orgOrigin: CGPoint!
    // タッチ開始時の親ビュー上のタッチ位置
    var orgParentPoint : CGPoint!
    
    
    // Viewのパンジェスチャーに反応し、処理するためのメソッド
    func handlePanGesture(sender: UIPanGestureRecognizer){
        switch sender.state {
        case UIGestureRecognizerState.began:
            // タッチ開始:タッチされたビューのoriginと親ビュー上のタッチ位置を記録しておく
            orgOrigin = sender.view?.frame.origin
            orgParentPoint = sender.translation(in: self.view)
            break
        case UIGestureRecognizerState.changed:
            // 現在の親ビュー上でのタッチ位置を求める
            let newParentPoint = sender.translation(in: self.view)
            // パンジャスチャの継続:タッチ開始時のビューのoriginにタッチ開始からの移動量を加算する
            sender.view?.frame.origin = orgOrigin + newParentPoint - orgParentPoint
            break
        default:
            break
        }
    }
    
  

    override func viewDidLoad() {
        super.viewDidLoad()
       
        let view1 = UILabel(frame: CGRect(x:100,y:100,width:80,height:40))
        view1.backgroundColor = UIColor.red
        view1.text = "name"
        view1.textColor = UIColor.white
        view1.isUserInteractionEnabled = true
        
        
        view1.addGestureRecognizer(
            UIPanGestureRecognizer(target:self, action:#selector(handlePanGesture)))
        self.view.addSubview(view1)
        
                   }
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

