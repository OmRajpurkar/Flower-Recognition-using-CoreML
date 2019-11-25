//
//  ViewController.swift
//  WhatFlower
//

import UIKit
import CoreML
import Vision
import SwiftyJSON
import Alamofire
import SDWebImage
import ColorThiefSwift
import Firebase
import FirebaseStorage
import FirebaseFirestore
import Kingfisher

class ViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    @IBOutlet weak var scrollView: UIScrollView!
    let wikipediaURl = "https://en.wikipedia.org/w/api.php"
    var pickedImage : UIImage?
    
    var arrData = [TimeFrame]()
    var ref = DatabaseReference.init()
    
    @IBOutlet weak var imageView: UIImageView!
    
    @IBOutlet weak var infoLabel: UILabel!
    
    @IBAction func addToTimelineButton(_ sender: Any) {
        let currentDateTime = Date()
        self.ref = Database.database().reference()
        self.uploadPhoto(){url in
            
            self.saveImage(imageURL: url!){success in
                if success != nil{
                    print("Successful")
                }
            }
            
        }
    }
    
    @IBOutlet var butt: UIButton!
    
    let imagePicker = UIImagePickerController()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        imagePicker.delegate = self
        imagePicker.sourceType = .camera
        imagePicker.allowsEditing = true
        
        if imageView.image == nil{
            butt.isHidden = true
        }else{
            butt.isHidden = false
        }
        
    }
    
    @objc fileprivate func uploadPhoto(completion: @escaping ((_ url:URL?) -> ())){
        
//        let storage = Storage.storage()
//        var data = Data()
//        data = (pickedImage?.jpegData(compressionQuality: 0.3))! // image file name
//        // Create a storage reference from our storage service
//        let storageRef = storage.reference()
//        var imageRef = storageRef.child("new5.jpeg")
//        _ = imageRef.putData(data, metadata: nil, completion: { (metadata,error ) in
//        guard let metadata = metadata else{
//        print(error)
//        return
//        }
//        })
        
        func randomString(length: Int) -> String {
          let letters = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"
          return String((0..<length).map{ _ in letters.randomElement()! })
        }
        
        let storageRef = Storage.storage().reference().child("\(randomString(length: 10)).jpeg")
        let imgData = (pickedImage?.jpegData(compressionQuality: 0.05))!
        let metaData = StorageMetadata()
        metaData.contentType = "image/jpeg"
        storageRef.putData(imgData, metadata: metaData) { (metadata, error) in
            if error == nil{
                print("Success")
                storageRef.downloadURL { (url, error) in
                    completion(url!)
                }
            }
            else{
                print("Error in Save Image!")
                completion(nil)
            }
        }
    }
    
    
    func saveImage(imageURL:URL, completion: @escaping ((_ url:URL?) -> ())){

        var date = Date()
        let formatter = DateFormatter()
        formatter.dateFormat = "dd MMMM, yyyy 'at' hh:mm:ss a"
        let myString = formatter.string(from: date)
        print(myString)
        
        self.ref.child("timelinedb").childByAutoId().setValue(["date":myString, "text":"Unidentified / Incorrect Flower Recognition", "imageURL":imageURL.absoluteString])
        
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        
        if let userPickedImage = info[.originalImage] as? UIImage {
            
            guard let ciImage = CIImage(image: userPickedImage) else {
                fatalError("Could not convert image to CIImage.")
            }
            
            pickedImage = userPickedImage
            
            detect(flowerImage: ciImage)
        }
        
        imagePicker.dismiss(animated: true, completion: nil)
        
        butt.isHidden = false
        butt.layer.cornerRadius = 15
        
    }
    
    
    func detect(flowerImage: CIImage) {
        
        guard let model = try? VNCoreMLModel(for: FlowerClassifier().model) else {
            fatalError("Can't load model")
        }
        
        let request = VNCoreMLRequest(model: model) { (request, error) in
            guard let result = request.results?.first as? VNClassificationObservation else {
                fatalError("Could not complete classfication")
            }
      
            self.navigationItem.title = result.identifier.capitalized
            
            self.requestInfo(flowerName: result.identifier)
            
        }
        
        let handler = VNImageRequestHandler(ciImage: flowerImage)
        
        do {
            try handler.perform([request])
        }
        catch {
            print(error)
        }
        
        
    }
    
    func requestInfo(flowerName: String) {
        let parameters : [String:String] = ["format" : "json", "action" : "query", "prop" : "extracts|pageimages", "exintro" : "", "explaintext" : "", "titles" : flowerName, "redirects" : "1", "pithumbsize" : "500", "indexpageids" : ""]
        
        
        // https://en.wikipedia.org/w/api.php?format=json&action=query&prop=extracts|pageimages&exintro=&explaintext=&titles=barberton%20daisy&redirects=1&pithumbsize=500&indexpageids
        
        Alamofire.request(wikipediaURl, method: .get, parameters: parameters).responseJSON { (response) in
            if response.result.isSuccess {
                //                print(response.request)
                //
                //                print("Success! Got the flower data")
                let flowerJSON : JSON = JSON(response.result.value!)
                
                let pageid = flowerJSON["query"]["pageids"][0].stringValue
                
                let flowerDescription = flowerJSON["query"]["pages"][pageid]["extract"].stringValue

                //                print("pageid \(pageid)")
                //                print("flower Descript \(flowerDescription)")
                //                print(flowerJSON)
                //
                self.infoLabel.text = flowerDescription
                
                self.imageView.image = self.pickedImage
                    
                    if let currentImage = self.imageView.image {
                        
                        guard let dominantColor = ColorThief.getColor(from: currentImage) else {
                            fatalError("Can't get dominant color")
                        }
                        
                        
                        DispatchQueue.main.async {
                            self.navigationController?.navigationBar.isTranslucent = true
                            self.navigationController?.navigationBar.barTintColor = dominantColor.makeUIColor()
                            
                            
                        }
                    } else {
                        self.imageView.image = self.pickedImage
                        self.infoLabel.text = "Could not get information on flower from Wikipedia."
                    }
                
            }
            else {
                print("Error \(String(describing: response.result.error))")
                self.infoLabel.text = "Connection Issues"
                
            }
        }
    }
    
    
    
    @IBAction func cameraTapped(_ sender: Any) {
        
        self.present(self.imagePicker, animated: true, completion: nil)

    }
    
}




// Helper function inserted by Swift 4.2 migrator.
fileprivate func convertFromUIImagePickerControllerInfoKey(_ input: UIImagePickerController.InfoKey) -> String {
	return input.rawValue
}
