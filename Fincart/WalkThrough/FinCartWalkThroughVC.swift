//
//  WalkThroughVC.swift
//  Fincart
//
//  Created by Kamal on 11/03/18.
//  Copyright © 2018 Aman Taneja. All rights reserved.
//

import Foundation
import UIKit

class FinCartWalkThroughVC: UIViewController, UIPageViewControllerDataSource, UIPageViewControllerDelegate{
    
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    var _pageViewController: UIPageViewController?
    let _headerTitles = ["PLAN", "INVEST", "PROSPER"]
    let _pageImages = ["ic_plan", "ic_invest_img", "ic_prosper_security"]
    let _message = [String(format: "%@\r\r%@", arguments: ["How much to invest!", "Answer few simple numberless question and get customised financial plan!"]), String(format: "%@\r\r%@", arguments: ["Paperless account opening with e-KYC!", "Recommends best suited mutual fund scheme to help you achieve your goals Buy mutual fund online!"]), String(format: "%@\r\r%@", arguments: ["Live Portfolio tracking 24 * 7", "Watch your investment grow with Fincart!"])]
    var pages = [UIViewController]()
    var currentIndex: Int?
    private var pendingIndex: Int?
    
    
    @IBOutlet weak var newUserOutlet: UIButton!

    @IBOutlet weak var existingUserOutlet: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupPageViewController()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func newUserAction(_ sender: Any) {
        appDelegate.showRegistrationScreen()
    }
    
    @IBAction func existingUserAction(_ sender: UIButton) {
        appDelegate.showLoginScreen()
    }
    
    
    func pageViewController(_ pageViewController: UIPageViewController, willTransitionTo pendingViewControllers: [UIViewController]) {
        pendingIndex = pages.index(of: pendingViewControllers.first!)
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, didFinishAnimating finished: Bool, previousViewControllers: [UIViewController], transitionCompleted completed: Bool) {
        if completed {
            currentIndex = pendingIndex
            let pageControl = UIPageControl.appearance()
            pageControl.pageIndicatorTintColor = UIColor(red: 196/255, green: 34/255, blue: 76/255, alpha: 1)
            pageControl.currentPageIndicatorTintColor = UIColor(red: 244/255, green: 113/255, blue: 248/255, alpha: 1)
            switch currentIndex!{
            case 0:
                pageControl.pageIndicatorTintColor = UIColor(red: 196/255, green: 34/255, blue: 76/255, alpha: 1)
                pageControl.currentPageIndicatorTintColor = UIColor(red: 244/255, green: 113/255, blue: 248/255, alpha: 1)
                break;
            case 1:
                pageControl.pageIndicatorTintColor = UIColor(red: 38/255, green: 156/255, blue: 126/255, alpha: 1)
                pageControl.currentPageIndicatorTintColor = UIColor(red: 125/255, green: 251/255, blue: 237/255, alpha: 1)
                break;
            case 2:
                pageControl.pageIndicatorTintColor = UIColor(red: 30/255, green: 97/255, blue: 208/255, alpha: 1)
                pageControl.currentPageIndicatorTintColor = UIColor(red: 135/255, green: 185/255, blue: 245/255, alpha: 1)
                break;
            default:
                break;
            }
        }
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        let currentIndex = pages.index(of: viewController)!
        if currentIndex == 0 {
            return nil
        }
        let previousIndex = abs((currentIndex - 1) % pages.count)
        return pages[previousIndex]
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        let currentIndex = pages.index(of: viewController)!
        if currentIndex == pages.count-1 {
            return nil
        }
        let nextIndex = abs((currentIndex + 1) % pages.count)
        return pages[nextIndex]
    }
    
    func presentationCount(for pageViewController: UIPageViewController) -> Int {
        return _headerTitles.count
    }
    
    func presentationIndex(for pageViewController: UIPageViewController) -> Int {
        return 0
    }
    
    private func setupPageViewController() {
        _pageViewController = storyboard!.instantiateViewController(withIdentifier: "finCartWalkThroughPageController") as? UIPageViewController
        _pageViewController!.dataSource = self
        _pageViewController!.delegate = self
        
        //let startingViewController = viewControllerAtIndex(index: 0)
        pages.append(viewControllerAtIndex(index: 0)!)
        pages.append(viewControllerAtIndex(index: 1)!)
        pages.append(viewControllerAtIndex(index: 2)!)
        _pageViewController!.setViewControllers([pages[0]], direction: UIPageViewControllerNavigationDirection.forward, animated: true, completion: nil)
        
        // Change the size of page view controller
        _pageViewController!.view.frame = CGRect(x:0, y:0, width:self.view.frame.size.width, height:self.view.frame.size.height - 50)
        
        addChildViewController(_pageViewController!)
        view.addSubview(_pageViewController!.view)
        _pageViewController!.didMove(toParentViewController: self)
    }
    
    private func viewControllerAtIndex(index: NSInteger) -> UIViewController? {
        if ((_headerTitles.count == 0) || (index >= _headerTitles.count)) {
            return nil
        }
        let pageContentViewController = storyboard!.instantiateViewController(withIdentifier: "finCartWalkThroughContentVC") as! FinCartWalkThroughContentVC
        pageContentViewController.headerText = _headerTitles[index]
        pageContentViewController.messageText = _message[index]
        pageContentViewController.imageString = _pageImages[index]
        pageContentViewController.pageIndex = index
        return pageContentViewController
    }
}
