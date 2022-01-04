//
//  ViewController.swift
//  CovidTracker
//
//  Created by Rohan Tyagi on 22/12/21.
//

import UIKit
import iOSDropDown

class ViewController: UIViewController, CovidManagerDelegate {

    @IBOutlet weak var vaccinated: UILabel!
    @IBOutlet weak var deaths: UILabel!
    @IBOutlet weak var recovered: UILabel!
    @IBOutlet weak var totalCases: UILabel!
    
    @IBOutlet weak var dropDown: DropDown!
    
    var covidManager = CovidManager(name: "")

    override func viewDidLoad() {
        super.viewDidLoad()
//        vaccinated.backgroundColor = .lightGray
        covidManager.delegate=self
        makeDrop()
    }

//extension ViewController: {
//
    func didUpdateData(_ covidManager:CovidManager, covid:CovidModel)
    //remember--covidManager is the one that calls this method and by convention we have to write it in the func as in other func from protocol
    {
        DispatchQueue.main.async {
        self.totalCases.text=String("\(covid.totalCases)")
        self.deaths.text=String("\(covid.deaths)")
        self.recovered.text=String("\(covid.recovered)")
        self.vaccinated.text=String("\(covid.vaccinated2)")
        }
    }
    
    func didFailWithError(error: Error) {
        print(error)
    }
    
    func makeDrop()
    {
        dropDown.optionArray = ["Andhra Pradesh",
                                "Arunachal Pradesh",
                                "Assam",
                                "Bihar",
                                "Chandigarh",
                                "Chhattisgarh",
                                "Dadra and Nagar Haveli",
                                "Delhi",
                                "Goa",
                                "Gujarat",
                                "Haryana",
                                "Himachal Pradesh",
                                "Jammu and Kashmir",
                                "Jharkhand",
                                "Karnataka",
                                "Kerala",
                                "Lakshadweep",
                                "Madhya Pradesh",
                                "Maharashtra",
                                "Manipur",
                                "Meghalaya",
                                "Mizoram",
                                "Nagaland",
                                "Odisha",
                                "Puducherry",
                                "Punjab",
                                "Rajasthan",
                                "Sikkim",
                                "Tamil Nadu",
                                "Telangana",
                                "Tripura",
                                "Uttar Pradesh",
                                "Uttarakhand",
                                "West Bengal"]
        
        dropDown.didSelect { selectedText, index, id in
            let dropText = "\(selectedText)"
            self.dropDown.text = dropText
            self.covidManager.name = dropText
            self.covidManager.performRequest()
        }
        
    }
    

}
//func convert(with sname:String)->String
//        {
//            switch sname{
//            case "Andaman and Nicobar Islands":return "AP"
//            case "Andhra Pradesh":return "AP"
//            case "Arunachal Pradesh":return "AR"
//            case "Assam":return "AS"
//            case "Bihar":return "BR"
//            case "Chandigarh":return "CH"
//            case "Chhattisgarh":return "CT"
//            case "Dadra and Nagar Haveli":return "DN"
//            case "Daman and Diu":return "DD"
//            case "Delhi":return "DL"
//            case "Goa":return "GA"
//            case "Gujarat":return "GJ"
//            case "Haryana":return "HR"
//            case "Himachal Pradesh":return "HP"
//            case "Jammu and Kashmir":return "JK"
//            case "Jharkhand":return "JH"
//            case "Karnataka":return "KA"
//            case "Kerala":return "KL"
//            case "Lakshadweep":return "LD"
//            case "Madhya Pradesh":return "MP"
//            case "Maharashtra":return "MH"
//            case "Manipur":return "MN"
//            case "Meghalaya":return "ML"
//            case "Mizoram":return "MZ"
//            case "Nagaland":return "NL"
//            case "Odisha":return "OR"
//            case "Puducherry":return "PY"
//            case "Punjab":return "PB"
//            case "Rajasthan":return "RJ"
//            case "Sikkim":return "SK"
//            case "Tamil Nadu":return "TN"
//            case "Telangana":return "TG"
//            case "Tripura":return "TR"
//            case "Uttar Pradesh":return "UP"
//            case "Uttarakhand":return "UT"
//            case "West Bengal":return "WB"
//
//            default:
//                return "_Incorrect_"
//            }
//        }
