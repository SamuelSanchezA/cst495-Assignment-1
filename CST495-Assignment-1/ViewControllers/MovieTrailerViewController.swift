//
//  MovieTrailerViewController.swift
//  CST495-Assignment-1
//
//  Created by Samuel on 2/7/18.
//  Copyright © 2018 Samuel. All rights reserved.
//

import UIKit

class MovieTrailerViewController: UIViewController {

    var movie: Movie!
    
    @IBOutlet weak var webView: UIWebView!
    
    @IBOutlet weak var activityIndicatorView: UIActivityIndicatorView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        activityIndicatorView.startAnimating()
        fetchTrailer()
    }
    
    func fetchTrailer(){
        let alertController = UIAlertController(title: "Cannot Get Movies", message: "The Internet Connection appears to be offline", preferredStyle: .alert)
        
        // create a cancel action
        let tryAgainAction = UIAlertAction(title: "Try Again", style: .default) { (action) in
            // handle cancel response here. Doing nothing will dismiss the view.
            self.fetchTrailer()
        }
        // add the cancel action to the alertController
        alertController.addAction(tryAgainAction)
        
        let movieID = movie.id
        let url = URL(string: "https://api.themoviedb.org/3/movie/\(movieID)/videos?api_key=a07e22bc18f5cb106bfe4cc1f83ad8ed&language=en-US")!
        let request = URLRequest(url: url, cachePolicy: .reloadIgnoringLocalCacheData, timeoutInterval: 10)
        let session = URLSession(configuration: .default, delegate: nil, delegateQueue: OperationQueue.main)
        let task = session.dataTask(with: request) { (data, response, error) in
            // This will run when the network request returns
            if let error = error {
                print(error.localizedDescription)
                UIApplication.shared.keyWindow?.rootViewController?.present(alertController, animated: true) {
                    // optional code for what happens after the alert controller has finished presenting
                }
            } else if let data = data {
                let dataDictionary = try! JSONSerialization.jsonObject(with: data, options: []) as! [String: Any]
                
                let videos = dataDictionary["results"] as! [[String: Any]]
                let videoURL = "https://www.youtube.com/watch?v=\(videos[0]["key"] ?? "")"
                let request = URLRequest(url: URL(string: videoURL)!)
                self.webView.loadRequest(request)
            }
        }
        task.resume()
        activityIndicatorView.stopAnimating()
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
