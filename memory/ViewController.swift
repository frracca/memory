//
//  ViewController.swift
//  memory
//
//  Created by francis on 13/11/2016.
//  Copyright © 2016 francis. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var image=["image1","image2","image3","image4","image5","image6","image7","image8","image9","image10",
               "image1","image2","image3","image4","image5","image6","image7","image8","image9","image10"]
    
    func permute(_ t: [String])->[String]{
        var r=t
        for k in 0..<(r.count){
            let sup=r.count-k
            let i=k+Int(arc4random_uniform(UInt32(sup)))
            let tampon=r[i]
            r[i]=r[k]
            r[k]=tampon
        }
      return r
    }

    @IBAction func choixJoueur(_ sender: UISegmentedControl) {
    }
    override func viewDidLoad() {
        super.viewDidLoad()
                // Do any additional setup after loading the view, typically from a nib.
        self.image=permute(self.image)
    }

    var im0=UIImage(named:"dos.png")
    //var im1=UIImage(named:"image1.png")
    //var im2=UIImage(named:"image2.png")

    var cpt=0
    var returned:Array<UIButton>=Array()
    
    var imVisible:Array<UIImage>=Array()
    
    
    
    
    
    @IBAction func clic(_ sender: UIButton) {
               if cpt<2
               {let im=UIImage(named:image[sender.tag]+".png")
                sender.setImage(im, for: .normal)
                cpt=cpt+1
                returned.append(sender)
                imVisible.append(sender.currentImage!)

        }
    }
    
    @IBOutlet weak var score1: UILabel!
    @IBOutlet weak var score2: UILabel!
    
    @IBAction func changeJoueur(_ sender: UISegmentedControl) {
        if (cpt==2){
            cpt=0
            if (imVisible[0].isEqual(imVisible[1])){
                if (sender.selectedSegmentIndex==1){
                    score1.tag+=1
                    score1.text=String(score1.tag)
                }
                else{
                    score2.tag+=1
                    score2.text=String(score2.tag)
                    }
            }
            else{
                returned[0].setImage(im0,for: .normal)
                returned[1].setImage(im0,for: .normal)
         
            }
            returned.removeAll()
            imVisible.removeAll()
        
        }
    }


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

