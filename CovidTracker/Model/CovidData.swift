//
//  CovidData.swift
//  CovidTracker
//
//  Created by Rohan Tyagi on 22/12/21.
//

import UIKit

struct CovidData: Codable{
    let AP:AP
    let AR:AR
    let AS:AS
    let BR:BR
    let CH:CH
    let CT:CT
    let DN:DN
    let DL:DL
    let GA:GA
    let GJ:GJ
    let HR:HR
    let HP:HP
    let JK:JK
    let JH:JH
    let KA:KA
    let KL:KL
    let LD:LD
    let MP:MP
    let MH:MH
    let MN:MN
    let ML:ML
    let MZ:MZ
    let NL:NL
    let OR:OR
    let PY:PY
    let PB:PB
    let RJ:RJ
    let SK:SK
    let TN:TN
    let TG:TG
    let TR:TR
    let UP:UP
    let UT:UT
    let WB:WB
    
}

struct AP:Codable{
    let total: total
}

struct AR:Codable{
    let total: total
}
struct AS:Codable{
    let total: total
}
struct BR:Codable{
    let total: total
}
struct CH:Codable{
    let total: total
}
struct CT:Codable{
    let total: total
}
struct DN:Codable{
    let total: total
}
//struct DD:Codable{
//    let total: total
//}
struct DL:Codable{
    let total: total
}
struct GA:Codable{
    let total: total
}
struct GJ:Codable{
    let total: total
}
struct HR:Codable{
    let total: total
}
struct HP:Codable{
    let total: total
}
struct JK:Codable{
    let total: total
}
struct JH:Codable{
    let total: total
}
struct KA:Codable{
    let total: total
}
struct KL:Codable{
    let total: total
}
struct LD:Codable{
    let total: total
}

struct MP:Codable{
    let total: total
}

struct MH:Codable{
    let total: total
}

struct MN:Codable{
    let total: total
}

struct ML:Codable{
    let total: total
}

struct MZ:Codable{
    let total: total
}

struct NL:Codable{
    let total: total
}

struct OR:Codable{
    let total: total
}

struct PY:Codable{
    let total: total
}

struct PB:Codable{
    let total: total
}

struct RJ:Codable{
    let total: total
}

struct SK:Codable{
    let total: total
}

struct TN:Codable{
    let total: total
}

struct TG:Codable{
    let total: total
}

struct TR:Codable{
    let total: total
}

struct UP:Codable{
    let total: total
}

struct UT:Codable{
    let total: total
}

struct WB:Codable{
    let total: total
}

struct total:Codable
{
    let confirmed: Int//UInt64
    let deceased: Int
    let recovered: Int
    let vaccinated1: Int
    let vaccinated2: Int
}
