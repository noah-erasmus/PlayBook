//
//  AlertView.swift
//  PlayBook
//
//  Created by Noah Erasmus on 2021/10/28.
//

import Foundation
import SwiftUI

func alertView(msg:String,completion: @escaping (String) -> ()){
    let alert = UIAlertController(title: "Message", message: msg, preferredStyle: .alert)
    
    alert.addTextField{(txt) in
        txt.placeholder = "123456"
    }
    
    alert.addAction(UIAlertAction(title: "Cancel", style: .destructive))
    
    alert.addAction(UIAlertAction(title: "Verify", style: .default, handler: {(_) in
        let code = alert.textFields![0].text ?? ""
        
        if code == "" {
            UIApplication.shared.windows.first?.rootViewController?.present(alert, animated: true)
            return
        }
        completion(code)
    }))
    
    UIApplication.shared.windows.first?.rootViewController?.present(alert, animated: true)
}
