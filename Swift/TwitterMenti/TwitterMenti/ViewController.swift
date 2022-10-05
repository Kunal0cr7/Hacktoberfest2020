//
//  ViewController.swift
//  TwitterMenti
//
//  Created by Shaurya Gupta on 2022-08-29.
//

import UIKit
import SwiftyJSON
import CoreML

class ViewController: UIViewController {
    @IBOutlet weak var textInput: UITextField!
    @IBOutlet weak var emojiLabel: UILabel!
    
    private let tweetCount = 100
    
    private let sentimentClassifier: TwitterMenti = {
        
        do {
            let config = MLModelConfiguration()
            return try TwitterMenti(configuration: config)
        } catch {
            fatalError("Coudn't create a Twitter Menti MLModel \(error)")
        }
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func predictPressed(_ sender: UIButton) {
        fetchTweets()
    }
    
    func fetchTweets() {
        let semaphore = DispatchSemaphore (value: 0)
        
        if let textInputText = textInput.text {
            var request = URLRequest(url: URL(string: "https://api.twitter.com/2/tweets/search/recent?max_results=\(tweetCount)&query=\(textInputText)")!, timeoutInterval: Double.infinity)
            
            request.addValue("Bearer AAAAAAAAAAAAAAAAAAAAAMvggQEAAAAAvYGuV2oqqAZ4%2BR1YS4BTP2eE9VE%3D6zi7GaZuj1lyhU0AHeNsXti03qPpg0E6T5cSlDU2hEEYKVMXge", forHTTPHeaderField: "Authorization")
            request.httpMethod = "GET"
            
            let task = URLSession.shared.dataTask(with: request) { data, response, error in
                guard let data = data else {
                    print(String(describing: error))
                    semaphore.signal()
                    return
                }
                // Got JSON
                
                var tweets = [TwitterMentiInput]()
                let dataToJSON: JSON?
                do {
                    dataToJSON = try JSON(data: data)
                    for i in 0..<self.tweetCount {
                        if let tweet = dataToJSON!["data"][i]["text"].string {
                            let tweetForClassification = TwitterMentiInput(text: tweet)
                            tweets.append(tweetForClassification)
                        }
                    }
                    
                    self.makePredictions(with: tweets)
                    
                } catch {
                    print("Error converting type Data to type JSON \(error)")
                }
                semaphore.signal()
            }
            task.resume()
            semaphore.wait()
        }
    }
    
    func makePredictions(with tweets: [TwitterMentiInput]) {
        do {
            let predictions = try self.sentimentClassifier.predictions(inputs: tweets)
            
            var sentimentScore = 0
            
            for prediction in predictions {
                let sentiment = prediction.label
                
                if sentiment == "Pos" {
                    sentimentScore += 1
                } else if sentiment == "Neg" {
                    sentimentScore -= 1
                }
            }
            
            updateUI(with: sentimentScore)
            
        } catch {
            print("Error making predictions \(error)")
        }
    }
    
    func updateUI(with sentimentScore: Int) {
        DispatchQueue.main.async {
            if sentimentScore > 20 {
                self.emojiLabel.text = "😍"
            } else if sentimentScore > 10 {
                self.emojiLabel.text = "😀"
            } else if sentimentScore > 0  {
                self.emojiLabel.text = "🙂"
            } else if sentimentScore == 0  {
                self.emojiLabel.text = "😐"
            } else if sentimentScore > -10  {
                self.emojiLabel.text = "😕"
            } else if sentimentScore > -20  {
                self.emojiLabel.text = "😡"
            } else  {
                self.emojiLabel.text = "🤮"
            }
        }
    }
    
    
}

