//
//  GoalsViewController.swift
//  Fincart
//
//  Created by Vinay Kharb on 10/1/17.
//  Copyright © 2017 Aman Taneja. All rights reserved.
//

import UIKit

class GoalsViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    @IBOutlet weak var collectionView1: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        collectionView1.register(UINib(nibName: "GoalsCollectionCell", bundle: Bundle.main), forCellWithReuseIdentifier: "GoalsCollectionCell")
        
//        let pastelView = PastelView(frame: view.bounds)
//        
//        // Custom Direction
//        pastelView.startPastelPoint = .bottomLeft
//        pastelView.endPastelPoint = .topRight
//        
//        // Custom Duration
//        pastelView.animationDuration = 1.0
//        
//        // Custom Color
//        pastelView.setColors([UIColor(red: 41/255, green: 208/255, blue: 253/255, alpha: 1.0),
//                              UIColor(red: 39/255, green: 196/255, blue: 253/255, alpha: 1.0),
//                              UIColor(red: 34/255, green: 175/255, blue: 253/255, alpha: 1.0),
//                              UIColor(red: 32/255, green: 150/255, blue: 253/255, alpha: 1.0),
//                              UIColor(red: 26/255, green: 126/255, blue: 243/255, alpha: 1.0),
//                              UIColor(red: 123/255, green: 192/255, blue: 253/255, alpha: 1.0)])
//        
//        pastelView.startAnimation()
//        view.insertSubview(pastelView, at: 0)
        
        // Do any additional setup after loading the view.
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch collectionView.tag {
        case 0, 2:
            return 4
        
        case 1:
            return 4
        default:
            return 0
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "GoalsCollectionCell", for: indexPath) as! GoalsCollectionCell
        return cell
    }

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print(indexPath.row.description)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView1.frame.width/2-10, height: 80)
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
