//
//  CovidManager.swift
//  CovidTracker
//
//  Created by Rohan Tyagi on 22/12/21.
//

import UIKit


protocol CovidManagerDelegate{
    func didUpdateData(_ covidManager:CovidManager, covid:CovidModel)
    func didFailWithError(error: Error)
}

struct CovidManager{

    var name: String
    
    var delegate:CovidManagerDelegate?
    
    func performRequest()
    {
        if let url = URL(string: "https://data.incovid19.org/v4/min/data.min.json")
        {
            let session = URLSession(configuration: .default)
            
            let task = session.dataTask(with: url) { data, response, error in
                if error != nil{
                    self.delegate?.didFailWithError(error: error!)
                    return
                }
                if let safeData=data{
                    if let covid = self.parseJSON(safeData)
                    {
                        self.delegate?.didUpdateData(self,covid: covid)
                        
                    }
                }
            }
            task.resume()
        }
    }
    
    func parseJSON(_ covidData: Data)->CovidModel?
    {
        let decoder = JSONDecoder()
        do {
            let decodedData = try decoder.decode(CovidData.self, from: covidData)
            
            return returnMember(decodedData)
            
        }catch{
            delegate?.didFailWithError(error: error)
            return nil
        }
    }
    
    func returnMember(_ decodedData:CovidData)->CovidModel?
    {
        let covid:CovidModel?
        
        switch name{
        case "Andhra Pradesh":
            let totalCases=decodedData.AP.total.confirmed
            let recovered=decodedData.AP.total.recovered
            let deaths=decodedData.AP.total.deceased
            let vaccinated1=decodedData.AP.total.vaccinated2
            let vaccinated2=decodedData.AP.total.vaccinated2
            
            covid=CovidModel(totalCases: totalCases, deaths: deaths, recovered: recovered, vaccinated1: vaccinated1, vaccinated2: vaccinated2)
            
        case "Arunachal Pradesh":
            let totalCases=decodedData.AR.total.confirmed
            let recovered=decodedData.AR.total.recovered
            let deaths=decodedData.AR.total.deceased
            let vaccinated1=decodedData.AR.total.vaccinated2
            let vaccinated2=decodedData.AR.total.vaccinated2
            
            covid=CovidModel(totalCases: totalCases, deaths: deaths, recovered: recovered, vaccinated1: vaccinated1, vaccinated2: vaccinated2)
//        case "Arunachal Pradesh":
//            let totalCases=decodedData..total.confirmed
//            let recovered=decodedData..total.recovered
//            let deaths=decodedData..total.deceased
//            let vaccinated1=decodedData..total.vaccinated2
//            let vaccinated2=decodedData..total.vaccinated2
//
//            covid=CovidModel(totalCases: totalCases, deaths: deaths, recovered: recovered, vaccinated1: vaccinated1, vaccinated2: vaccinated2)
        case "Assam":
            let totalCases=decodedData.AS.total.confirmed
            let recovered=decodedData.AS.total.recovered
            let deaths=decodedData.AS.total.deceased
            let vaccinated1=decodedData.AS.total.vaccinated2
            let vaccinated2=decodedData.AS.total.vaccinated2
            
            covid=CovidModel(totalCases: totalCases, deaths: deaths, recovered: recovered, vaccinated1: vaccinated1, vaccinated2: vaccinated2)
        case "Bihar":
            let totalCases=decodedData.BR.total.confirmed
            let recovered=decodedData.BR.total.recovered
            let deaths=decodedData.BR.total.deceased
            let vaccinated1=decodedData.BR.total.vaccinated2
            let vaccinated2=decodedData.BR.total.vaccinated2
            
            covid=CovidModel(totalCases: totalCases, deaths: deaths, recovered: recovered, vaccinated1: vaccinated1, vaccinated2: vaccinated2)
        case "Chandigarh":
            let totalCases=decodedData.CH.total.confirmed
            let recovered=decodedData.CH.total.recovered
            let deaths=decodedData.CH.total.deceased
            let vaccinated1=decodedData.CH.total.vaccinated2
            let vaccinated2=decodedData.CH.total.vaccinated2
            
            covid=CovidModel(totalCases: totalCases, deaths: deaths, recovered: recovered, vaccinated1: vaccinated1, vaccinated2: vaccinated2)
        case "Chhattisgarh":
            let totalCases=decodedData.CT.total.confirmed
            let recovered=decodedData.CT.total.recovered
            let deaths=decodedData.CT.total.deceased
            let vaccinated1=decodedData.CT.total.vaccinated2
            let vaccinated2=decodedData.CT.total.vaccinated2
            
            covid=CovidModel(totalCases: totalCases, deaths: deaths, recovered: recovered, vaccinated1: vaccinated1, vaccinated2: vaccinated2)
        case "Dadra and Nagar Haveli":
            let totalCases=decodedData.DN.total.confirmed
            let recovered=decodedData.DN.total.recovered
            let deaths=decodedData.DN.total.deceased
            let vaccinated1=decodedData.DN.total.vaccinated2
            let vaccinated2=decodedData.DN.total.vaccinated2
            
            covid=CovidModel(totalCases: totalCases, deaths: deaths, recovered: recovered, vaccinated1: vaccinated1, vaccinated2: vaccinated2)
//        case "Daman and Diu"
//            let totalCases=decodedData..total.confirmed
//            let recovered=decodedData..total.recovered
//            let deaths=decodedData..total.deceased
//            let vaccinated1=decodedData..total.vaccinated2
//            let vaccinated2=decodedData..total.vaccinated2
//
//            covid=CovidModel(totalCases: totalCases, deaths: deaths, recovered: recovered, vaccinated1: vaccinated1, vaccinated2: vaccinated2)"DD"
        case "Delhi":
            let totalCases=decodedData.DL.total.confirmed
            let recovered=decodedData.DL.total.recovered
            let deaths=decodedData.DL.total.deceased
            let vaccinated1=decodedData.DL.total.vaccinated2
            let vaccinated2=decodedData.DL.total.vaccinated2
            
            covid=CovidModel(totalCases: totalCases, deaths: deaths, recovered: recovered, vaccinated1: vaccinated1, vaccinated2: vaccinated2)
        case "Goa":
            let totalCases=decodedData.GA.total.confirmed
            let recovered=decodedData.GA.total.recovered
            let deaths=decodedData.GA.total.deceased
            let vaccinated1=decodedData.GA.total.vaccinated2
            let vaccinated2=decodedData.GA.total.vaccinated2
            
            covid=CovidModel(totalCases: totalCases, deaths: deaths, recovered: recovered, vaccinated1: vaccinated1, vaccinated2: vaccinated2)
        case "Gujarat":
            let totalCases=decodedData.GJ.total.confirmed
            let recovered=decodedData.GJ.total.recovered
            let deaths=decodedData.GJ.total.deceased
            let vaccinated1=decodedData.GJ.total.vaccinated2
            let vaccinated2=decodedData.GJ.total.vaccinated2
            
            covid=CovidModel(totalCases: totalCases, deaths: deaths, recovered: recovered, vaccinated1: vaccinated1, vaccinated2: vaccinated2)
        case "Haryana":
            let totalCases=decodedData.HR.total.confirmed
            let recovered=decodedData.HR.total.recovered
            let deaths=decodedData.HR.total.deceased
            let vaccinated1=decodedData.HR.total.vaccinated2
            let vaccinated2=decodedData.HR.total.vaccinated2
            
            covid=CovidModel(totalCases: totalCases, deaths: deaths, recovered: recovered, vaccinated1: vaccinated1, vaccinated2: vaccinated2)
        case "Himachal Pradesh":
            let totalCases=decodedData.HP.total.confirmed
            let recovered=decodedData.HP.total.recovered
            let deaths=decodedData.HP.total.deceased
            let vaccinated1=decodedData.HP.total.vaccinated2
            let vaccinated2=decodedData.HP.total.vaccinated2
            
            covid=CovidModel(totalCases: totalCases, deaths: deaths, recovered: recovered, vaccinated1: vaccinated1, vaccinated2: vaccinated2)
        case "Jammu and Kashmir":
            let totalCases=decodedData.JK.total.confirmed
            let recovered=decodedData.JK.total.recovered
            let deaths=decodedData.JK.total.deceased
            let vaccinated1=decodedData.JK.total.vaccinated2
            let vaccinated2=decodedData.JK.total.vaccinated2
            
            covid=CovidModel(totalCases: totalCases, deaths: deaths, recovered: recovered, vaccinated1: vaccinated1, vaccinated2: vaccinated2)
        case "Jharkhand":
            let totalCases=decodedData.JH.total.confirmed
            let recovered=decodedData.JH.total.recovered
            let deaths=decodedData.JH.total.deceased
            let vaccinated1=decodedData.JH.total.vaccinated2
            let vaccinated2=decodedData.JH.total.vaccinated2
            
            covid=CovidModel(totalCases: totalCases, deaths: deaths, recovered: recovered, vaccinated1: vaccinated1, vaccinated2: vaccinated2)
        case "Karnataka":
            let totalCases=decodedData.KA.total.confirmed
            let recovered=decodedData.KA.total.recovered
            let deaths=decodedData.KA.total.deceased
            let vaccinated1=decodedData.KA.total.vaccinated2
            let vaccinated2=decodedData.KA.total.vaccinated2
            
            covid=CovidModel(totalCases: totalCases, deaths: deaths, recovered: recovered, vaccinated1: vaccinated1, vaccinated2: vaccinated2)
        case "Kerala":
            let totalCases=decodedData.KL.total.confirmed
            let recovered=decodedData.KL.total.recovered
            let deaths=decodedData.KL.total.deceased
            let vaccinated1=decodedData.KL.total.vaccinated2
            let vaccinated2=decodedData.KL.total.vaccinated2
            
            covid=CovidModel(totalCases: totalCases, deaths: deaths, recovered: recovered, vaccinated1: vaccinated1, vaccinated2: vaccinated2)
        case "Lakshadweep":
            let totalCases=decodedData.LD.total.confirmed
            let recovered=decodedData.LD.total.recovered
            let deaths=decodedData.LD.total.deceased
            let vaccinated1=decodedData.LD.total.vaccinated2
            let vaccinated2=decodedData.LD.total.vaccinated2
            
            covid=CovidModel(totalCases: totalCases, deaths: deaths, recovered: recovered, vaccinated1: vaccinated1, vaccinated2: vaccinated2)
        case "Madhya Pradesh":
            let totalCases=decodedData.MP.total.confirmed
            let recovered=decodedData.MP.total.recovered
            let deaths=decodedData.MP.total.deceased
            let vaccinated1=decodedData.MP.total.vaccinated2
            let vaccinated2=decodedData.MP.total.vaccinated2
            
            covid=CovidModel(totalCases: totalCases, deaths: deaths, recovered: recovered, vaccinated1: vaccinated1, vaccinated2: vaccinated2)
        case "Maharashtra":
            let totalCases=decodedData.MH.total.confirmed
            let recovered=decodedData.MH.total.recovered
            let deaths=decodedData.MH.total.deceased
            let vaccinated1=decodedData.MH.total.vaccinated2
            let vaccinated2=decodedData.MH.total.vaccinated2
            
            covid=CovidModel(totalCases: totalCases, deaths: deaths, recovered: recovered, vaccinated1: vaccinated1, vaccinated2: vaccinated2)
        case "Manipur":
            let totalCases=decodedData.MN.total.confirmed
            let recovered=decodedData.MN.total.recovered
            let deaths=decodedData.MN.total.deceased
            let vaccinated1=decodedData.MN.total.vaccinated2
            let vaccinated2=decodedData.MN.total.vaccinated2
            
            covid=CovidModel(totalCases: totalCases, deaths: deaths, recovered: recovered, vaccinated1: vaccinated1, vaccinated2: vaccinated2)
        case "Meghalaya":
            let totalCases=decodedData.ML.total.confirmed
            let recovered=decodedData.ML.total.recovered
            let deaths=decodedData.ML.total.deceased
            let vaccinated1=decodedData.ML.total.vaccinated2
            let vaccinated2=decodedData.ML.total.vaccinated2
            
            covid=CovidModel(totalCases: totalCases, deaths: deaths, recovered: recovered, vaccinated1: vaccinated1, vaccinated2: vaccinated2)
        case "Mizoram":
            let totalCases=decodedData.MZ.total.confirmed
            let recovered=decodedData.MZ.total.recovered
            let deaths=decodedData.MZ.total.deceased
            let vaccinated1=decodedData.MZ.total.vaccinated2
            let vaccinated2=decodedData.MZ.total.vaccinated2
            
            covid=CovidModel(totalCases: totalCases, deaths: deaths, recovered: recovered, vaccinated1: vaccinated1, vaccinated2: vaccinated2)
        case "Nagaland":
            let totalCases=decodedData.NL.total.confirmed
            let recovered=decodedData.NL.total.recovered
            let deaths=decodedData.NL.total.deceased
            let vaccinated1=decodedData.NL.total.vaccinated2
            let vaccinated2=decodedData.NL.total.vaccinated2
            
            covid=CovidModel(totalCases: totalCases, deaths: deaths, recovered: recovered, vaccinated1: vaccinated1, vaccinated2: vaccinated2)
        case "Odisha":
            let totalCases=decodedData.OR.total.confirmed
            let recovered=decodedData.OR.total.recovered
            let deaths=decodedData.OR.total.deceased
            let vaccinated1=decodedData.OR.total.vaccinated2
            let vaccinated2=decodedData.OR.total.vaccinated2
            
            covid=CovidModel(totalCases: totalCases, deaths: deaths, recovered: recovered, vaccinated1: vaccinated1, vaccinated2: vaccinated2)
        case "Puducherry":
            let totalCases=decodedData.PY.total.confirmed
            let recovered=decodedData.PY.total.recovered
            let deaths=decodedData.PY.total.deceased
            let vaccinated1=decodedData.PY.total.vaccinated2
            let vaccinated2=decodedData.PY.total.vaccinated2
            
            covid=CovidModel(totalCases: totalCases, deaths: deaths, recovered: recovered, vaccinated1: vaccinated1, vaccinated2: vaccinated2)
        case "Punjab":
            let totalCases=decodedData.PB.total.confirmed
            let recovered=decodedData.PB.total.recovered
            let deaths=decodedData.PB.total.deceased
            let vaccinated1=decodedData.PB.total.vaccinated2
            let vaccinated2=decodedData.PB.total.vaccinated2
            
            covid=CovidModel(totalCases: totalCases, deaths: deaths, recovered: recovered, vaccinated1: vaccinated1, vaccinated2: vaccinated2)
        case "Rajasthan":
            let totalCases=decodedData.RJ.total.confirmed
            let recovered=decodedData.RJ.total.recovered
            let deaths=decodedData.RJ.total.deceased
            let vaccinated1=decodedData.RJ.total.vaccinated2
            let vaccinated2=decodedData.RJ.total.vaccinated2
            
            covid=CovidModel(totalCases: totalCases, deaths: deaths, recovered: recovered, vaccinated1: vaccinated1, vaccinated2: vaccinated2)
        case "Sikkim":
            let totalCases=decodedData.SK.total.confirmed
            let recovered=decodedData.SK.total.recovered
            let deaths=decodedData.SK.total.deceased
            let vaccinated1=decodedData.SK.total.vaccinated2
            let vaccinated2=decodedData.SK.total.vaccinated2
            
            covid=CovidModel(totalCases: totalCases, deaths: deaths, recovered: recovered, vaccinated1: vaccinated1, vaccinated2: vaccinated2)
        case "Tamil Nadu":
            let totalCases=decodedData.TN.total.confirmed
            let recovered=decodedData.TN.total.recovered
            let deaths=decodedData.TN.total.deceased
            let vaccinated1=decodedData.TN.total.vaccinated2
            let vaccinated2=decodedData.TN.total.vaccinated2
            
            covid=CovidModel(totalCases: totalCases, deaths: deaths, recovered: recovered, vaccinated1: vaccinated1, vaccinated2: vaccinated2)
        case "Telangana":
            let totalCases=decodedData.TG.total.confirmed
            let recovered=decodedData.TG.total.recovered
            let deaths=decodedData.TG.total.deceased
            let vaccinated1=decodedData.TG.total.vaccinated2
            let vaccinated2=decodedData.TG.total.vaccinated2
            
            covid=CovidModel(totalCases: totalCases, deaths: deaths, recovered: recovered, vaccinated1: vaccinated1, vaccinated2: vaccinated2)
        case "Tripura":
            let totalCases=decodedData.TR.total.confirmed
            let recovered=decodedData.TR.total.recovered
            let deaths=decodedData.TR.total.deceased
            let vaccinated1=decodedData.TR.total.vaccinated2
            let vaccinated2=decodedData.TR.total.vaccinated2
            
            covid=CovidModel(totalCases: totalCases, deaths: deaths, recovered: recovered, vaccinated1: vaccinated1, vaccinated2: vaccinated2)
        case "Uttar Pradesh":
            let totalCases=decodedData.UP.total.confirmed
            let recovered=decodedData.UP.total.recovered
            let deaths=decodedData.UP.total.deceased
            let vaccinated1=decodedData.UP.total.vaccinated2
            let vaccinated2=decodedData.UP.total.vaccinated2
            
            covid=CovidModel(totalCases: totalCases, deaths: deaths, recovered: recovered, vaccinated1: vaccinated1, vaccinated2: vaccinated2)
        case "Uttarakhand":
            let totalCases=decodedData.UT.total.confirmed
            let recovered=decodedData.UT.total.recovered
            let deaths=decodedData.UT.total.deceased
            let vaccinated1=decodedData.UT.total.vaccinated2
            let vaccinated2=decodedData.UT.total.vaccinated2
            
            covid=CovidModel(totalCases: totalCases, deaths: deaths, recovered: recovered, vaccinated1: vaccinated1, vaccinated2: vaccinated2)
        case "West Bengal":
            let totalCases=decodedData.WB.total.confirmed
            let recovered=decodedData.WB.total.recovered
            let deaths=decodedData.WB.total.deceased
            let vaccinated1=decodedData.WB.total.vaccinated2
            let vaccinated2=decodedData.WB.total.vaccinated2
            
            covid=CovidModel(totalCases: totalCases, deaths: deaths, recovered: recovered, vaccinated1: vaccinated1, vaccinated2: vaccinated2)

        default:
            covid=CovidModel(totalCases: 0, deaths: 0, recovered: 0, vaccinated1: 0, vaccinated2: 0)
        }
        
        return covid
    }
}

