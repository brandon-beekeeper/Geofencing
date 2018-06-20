//
//  DemoScreenViewController.swift
//  Geofencing
//
//  Created by Brandon Vasquez on 5/17/18.
//  Copyright © 2018 Brandon Vasquez. All rights reserved.
//

import UIKit

class NotificationViewController: UIViewController {
    // Setup to allow buttons to make post requests
    let apiCall = Backend()
    
    // Turns notifications back on if user decides to press yes button
    @IBAction func yesButtonPressed(_ sender: Any) {
        apiCall.unmuteNotifications()
    }
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.backBarButtonItem?.isEnabled = false
        

        // Do any additional setup after loading the view.
    }

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
