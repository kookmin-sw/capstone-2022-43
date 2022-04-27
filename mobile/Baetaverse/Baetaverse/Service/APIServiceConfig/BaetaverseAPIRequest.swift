//
//  BaetaverseAPIRequest.swift
//  Baetaverse
//
//  Created by JeongTaek Han on 2022/03/29.
//

import Foundation

protocol BaetaverseAPIRequest: APIRequest, BaetaverseAPIRequestHostInfo { }

protocol BaetaverseAPIRequestGET: APIRequestGET, BaetaverseAPIRequestHostInfo { }

protocol BaetaverseAPIRequestPOST: APIRequestPOST, BaetaverseAPIRequestHostInfo { }
