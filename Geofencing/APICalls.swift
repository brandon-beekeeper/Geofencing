//
//  APICalls.swift
//  Geofencing
//
//  Created by Brandon Vasquez on 6/17/18.
//  Copyright © 2018 Brandon Vasquez. All rights reserved.
//

import Foundation

class Backend {
// API setup__________________________________________________________________________
// This creates a post request that mutes notificaitons for 12 hours
func muteNotifications() {
    let url = URL(string: "https://usecasedev.us.beekeeper.io/api/2/users/me/settings/notifications")!
    var request = URLRequest(url: url)
    request.httpMethod = "POST"
    
    // Adding Headers
    request.addValue("application/json", forHTTPHeaderField: "content-type")
    request.addValue("Token a32b1b34-ed58-44fe-b1c5-aa2cc815ae88", forHTTPHeaderField: "Authorization")
    request.addValue("application/json", forHTTPHeaderField: "Accept")
    
    // Setting up post body
    let post = ["mute_group_chats": "12",
                "mute_push_notifications": "12"]
    
    do {
        let jsonBody = try JSONSerialization.data(withJSONObject: post, options: [])
        request.httpBody = jsonBody
    } catch {}
    
    // Setting up data task
    let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
        guard let data = data else { return }
        do {
            let json = try JSONSerialization.jsonObject(with: data, options: [])
            print(json)
        } catch {}
    }
    task.resume()
}
// This function createss a post request that unmutes notifications
 func unmuteNotifications() {
    let url = URL(string: "https://usecasedev.us.beekeeper.io/api/2/users/me/settings/notifications")!
    var request = URLRequest(url: url)
    request.httpMethod = "POST"
    
    // Adding Headers
    request.addValue("application/json", forHTTPHeaderField: "content-type")
    request.addValue("Token a32b1b34-ed58-44fe-b1c5-aa2cc815ae88", forHTTPHeaderField: "Authorization")
    request.addValue("application/json", forHTTPHeaderField: "Accept")
    
    // Setting up post body
    let post = ["mute_group_chats": "0",
                "mute_push_notifications": "0"]
    
    do {
        let jsonBody = try JSONSerialization.data(withJSONObject: post, options: [])
        request.httpBody = jsonBody
    } catch {}
    
    // Setting up data task
    let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
        guard let data = data else { return }
        do {
            let json = try JSONSerialization.jsonObject(with: data, options: [])
            print(json)
        } catch {}
    }
    task.resume()
}
}


