//
//  ViewController.swift
//  比赛记分器
//
//  Created by cxxxe4680 on 2017/5/17.
//  Copyright © 2017年 20151104680. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UIImagePickerControllerDelegate,UINavigationControllerDelegate {
    var a:Int = 0
    var b:Int = 0
    var c:Int = 1
    var d:Int = 0
    var e:Int = 0
    var array1 : [Int] = [0,0,0]
    var array2 : [Int] = [0,0,0]
    var flagA = 0
    var flagB = 0
    var dlg = 0
    
    @IBOutlet weak var temp: UITextField!
    @IBOutlet weak var temp0: UITextField!
    @IBOutlet weak var temp1: UITextField!
    @IBOutlet weak var temp2: UITextField!
    

    @IBAction func addA(_ sender: Any) {
        a=a+1
        if( b<10 && a==11 || b>=10 && a-b==2 )
        {
            temp2.text="\("第" + String(c) + "局a胜" + String(a) + ":" + String(b))"
            array1[c-1] = a
            array2[c-1] = b
            c=c+1
            a=0
            b=0
            d=d+1
            temp1.text="\(d)"
            if (c == 4)
            {
                temp1.text="\("比赛结束" + String(d) + ":" + String(e))"
                temp.text="\( "a赢  " )"
                c=1;
                d=0;
                e=0;
                temp2.text = "\(e)"
                temp1.text="\(d)"
                
            }
        }else
        {
            temp2.text="\( String(a) + ":" + String(b) )"
            temp1.text="\("第" + String(c) + "局")"
        }
    }

    @IBAction func addB(_ sender: Any) {
        b=b+1
        if( a<10 && b==11 || a>=10 && b-a==2)
        {
            temp1.text="\("第" + String(c) + "局b胜" + String(a) + ":" + String(b))"
            array1[c-1] = a
            array2[c-1] = b
            c=c+1
            a=0
            b=0
            e=e+1
            temp2.text = "\(e)"
            if (c == 4)
            {
                temp0.text="\("比赛结束" + String(d) + ":" + String(e))"
                temp1.text="\( "b赢  " )"
                c=1;
                d=0;
                e=0;
                temp2.text = "\(e)"
                temp1.text="\(d)"
            }
        }else
        {
            temp2.text="\( String(a) + ":" + String(b) )"
            temp1.text="\("第" + String(c) + "局")"
        }
    }

    @IBAction func aj(_ sender: Any) {
        if(a>0)
        {
            a=a-1
            if( a<10 && b==11 || a>=10 && b-a==2)
            {
                temp1.text="\("第" + String(c) + "局b胜" + String(a) + ":" + String(b))"
                array1[c-1] = a
                array2[c-1] = b
                c=c+1
                a=0
                b=0
                e=e+1
                temp2.text = "\(e)"
                if (c == 4)
                {
                    temp1.text="\("比赛结束" + String(d) + ":" + String(e))"
                    temp.text="\( "b赢  " )"
                    c=1;
                    d=0;
                    e=0;
                    temp2.text = "\(e)"
                    temp1.text="\(d)"
                }
            }else
            {
                temp2.text="\( String(a) + ":" + String(b) )"
            }
            
        }
        else if(a==0)
        {
            if(( c>=1 && d>=1))
            {
                a=array1[c-2]-1
                b=array2[c-2]
                c=c-1
                d=d-1
                temp.text="\("第" + String(c) + "局")"
                temp1.text="\(d)"
                temp2.text="\( String(a) + ":" + String(b) )"
            }
            
            
        }
    }

    @IBAction func bj(_ sender: Any) {
        if(b>0)
        {
            b=b-1
            if( b<10 && a==11 || b>=10 && a-b==2 )
            {
                temp.text="\("第" + String(c) + "局a胜" + String(a) + ":" + String(b))"
                array1[c-1] = a
                array2[c-1] = b
                c=c+1
                a=0
                b=0
                d=d+1
                temp1.text="\(d)"
                if (c == 4)
                {
                    temp1.text="\("比赛结束" + String(d) + ":" + String(e))"
                    temp.text="\( "a赢  " )"
                    c=1;
                    d=0;
                    e=0;
                    temp.text = "\(e)"
                    temp.text="\(d)"
                }
                else
                {
                    temp2.text="\( String(a) + ":" + String(b) )"
                }
            }
            
        }
        else if(b==0)
        {
            if(( c>=1 && e>=1))
            {
                a=array1[c-2]
                b=array2[c-2]-1
                c=c-1
                e=e-1
                temp1.text="\("第" + String(c) + "局")"
                temp0.text="\(e)"
                temp2.text="\( String(a) + ":" + String(b) )"
            }
            
        }
    }
    @IBOutlet weak var Aimg: UIImageView!
    @IBOutlet weak var Bimg: UIImageView!

    @IBAction func addimg1(_ sender: Any) {
        if dlg == 0{
            flagA = 1
            flagB = 0
            if UIImagePickerController.isSourceTypeAvailable(.photoLibrary)
            {
                let picker = UIImagePickerController()
                picker.delegate = self
                picker.sourceType = UIImagePickerControllerSourceType.photoLibrary
                self.present(picker,animated: true,completion: {
                    ()->Void in
                })
            }else{
                print("读取相册错误")
            }
        }
    }
    
    

    @IBAction func addimg2(_ sender: Any) {
        if dlg == 0{
            flagB = 1
            flagA = 0
            
            if UIImagePickerController.isSourceTypeAvailable(.photoLibrary)
            {
                let picker = UIImagePickerController()
                picker.delegate = self
                picker.sourceType = UIImagePickerControllerSourceType.photoLibrary
                self.present(picker,animated: true,completion: {
                    ()->Void in
                })
            }else{
                print("读取相册错误")
            }
        }
    }
    
    func imagePickerController(_ picker : UIImagePickerController,
                                   didFinishPickingMediaWithInfo
            info:[String:Any]){
            print(info)
            let image : UIImage!
            image = info[UIImagePickerControllerOriginalImage]as!UIImage
            if(flagA == 1){
                Aimg.image = image
            }
            else if(flagB == 1){
                Bimg.image = image
            }
            
            picker.dismiss(animated:true,completion: {
                ()-> Void in
            })
            
        }
        
    }



