//
//  ViewController.swift
//  0327
//
//  Created by cxxxe4680 on 2017/3/27.
//  Copyright © 2017年 cxxxe4680. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    import UIKit
    
    enum ScoreType{
        case Common  //普通分数面板
        case Best    //最高分面板
    }
    
    protocol ScoreViewProtocol{
        
        func changeScore(value s:Int)
    }
    
    class ScoreView:UIView, ScoreViewProtocol
    {
        var label:UILabel!
        
        let defaultFrame = CGRectMake(0,0,100,30)
        var stype:String!  //显示”最高分“还是”分数“
        var score:Int = 0{
            didSet{
                //分数变化，标签内容也要变化
                label.text = "\(stype):\(score)"
            }
        }
        
        //传入分数面板的类型，用于控制标签的显示
        init(stype:ScoreType)
        {
            label = UILabel(frame:defaultFrame)
            label.textAlignment = NSTextAlignment.Center
            
            super.init(frame:defaultFrame)
            
            self.stype = (stype == ScoreType.Common ? "分数":"最高分")
            
            backgroundColor = UIColor.orangeColor()
            label.font = UIFont(name:"微软雅黑", size:16)
            label.textColor = UIColor.whiteColor()
            self.addSubview(label)
        }
        
        required init(coder aDecoder: NSCoder) {
            super.init(coder: aDecoder)
        }

}

