//
//  MovieTrailerViewController.swift
//  CST495-Assignment-1
//
//  Created by Samuel on 2/7/18.
//  Copyright © 2018 Samuel. All rights reserved.
//

import UIKit

class MovieTrailerViewController: UIViewController {

    var movie: [String: Any]!
    
    @IBOutlet weak var webView: UIWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        fetchTrailer()
    }
    
    func fetchTrailer(){
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func onClose(_ sender: Any) {
        dismiss(animated: true, completion: nil)
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
