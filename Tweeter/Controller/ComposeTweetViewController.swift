//
//  ComposeTweetViewController.swift
//  Tweeter
//
//  Created by Vincent Luo on 8/22/19.
//  Copyright © 2019 Vincent Luo. All rights reserved.
//

import UIKit
import Firebase
import FirebaseFirestore
import KMPlaceholderTextView

class ComposeTweetViewController: UIViewController {
    
    @IBOutlet weak var tweetTextView: KMPlaceholderTextView!
    
    var db: Firestore!
    var uid: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        db = Firestore.firestore()
        tweetTextView.becomeFirstResponder()
        
    }

    @IBAction func tweetPressed(_ sender: Any) {
        addTweetToDB()
    }
    
    func addTweetToDB() {
        getUser()
        db.collection("tweets").addDocument(data: [
            "message" : tweetTextView.text!,
            "user" : uid!
        ]) { error in
            if let error = error {
                print("Error adding document: \(error)")
            } else {
                print("Document added")
            }
        }
    }
    
    func getUser() {
        let user = Auth.auth().currentUser
        if let currentUser = user {
            uid = currentUser.uid
        } else {
            print("Failed to get user")
        }
    }
    
}
