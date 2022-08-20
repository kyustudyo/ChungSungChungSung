//
//  FitnessTestStandard.swift
//  ChungSungChungSung
//
//  Created by Somin Park on 2022/08/18.
//

import Foundation

enum TestAge {
    case one, two, three, four, five, six, seven, eight, nine, ten, eleven, twelve, thirteen
    init?(age: Int) {
        switch age {
        case 0..<26: self = .one
        case 26..<31: self = .two
        case 31..<36: self = .three
        case 36..<41: self = .four
        case 41..<44: self = .five
        case 44..<47: self = .six
        case 47..<50: self = .seven
        case 50..<52: self = .eight
        case 52..<54: self = .nine
        case 54..<56: self = .ten
        case 56..<58: self = .eleven
        case 58..<60: self = .twelve
        case 60..<99: self = .thirteen
        case _: return nil
        }
    }
}

enum TestType: String {
    case running = "3km 달리기"
    case pushup = "팔굽혀펴기(2분)"
    case situp = "윗몸일으키기"
}

struct FitnessTest {
    let type: TestType
    let standard: [String : (Int, Int)]
}


let testStandard: [TestAge: [FitnessTest]] = [.one: [FitnessTest(type: .running, standard: ["특급" : (1, 12 * 60 + 30), "1급" : (12 * 60 + 46, 13 * 60 + 52)]), FitnessTest(type: .pushup, standard: ["특급": (44,89), "1급": (24, 43)]), FitnessTest(type: .situp, standard: ["특급": (44,89), "1급": (24, 43)])]]


func calculateLevel(testType: TestType, minutes: Int?, seconds: Int?, count: Int?) -> String {
    let age = UserDefaults.standard.integer(forKey: "age")
    var totalTime = 0
    if minutes != nil && seconds != nil {
        totalTime = minutes! * 60 + seconds!
    }
    let testAge = TestAge(age: age)!
    let testAll = testStandard[testAge]!
    for i in testAll {
       if i.type == testType {
           for (key, value) in i.standard {
               if totalTime >= value.0 && totalTime <= value.1 {
                   return key
               }else if count ?? 0 >= value.0 && count ?? 0 <= value.1 {
                   return key
               }
           }
        }
    }
    return "없음"
}

func getMaxStandard(testType: TestType, level: String) -> Int {
    let age = UserDefaults.standard.integer(forKey: "age")
    let testAge = TestAge(age: age)!
    let testAll = testStandard[testAge]!
    for i in testAll {
       if i.type == testType {
           for (key, value) in i.standard {
               if key == level {
                   return value.1
               }
           }
        }
    }
    return 0
}

/*
public class FitnessTestStandard {
    static func calculateLevel2(age: Int, type: String, count: Int?, minutes: Int?, seconds: Int?) -> [String, Int] {
        var totalTime: Int = 0
        if minutes != nil && seconds != nil {
            totalTime = minutes! * 60 + seconds!
        }
        if type == "running" {
            if age < 26 {
                if totalTime <= 12 * 6 + 30 {
                    return ["특급", (12 * 6 + 30)]
                }else if totalTime <= 13 * 6 + 32 {
                    return ["1급", (13 * 6 + 32)]
                }else if totalTime <= 14 * 6 + 34 {
                    return ["2급", 14 * 6 + 34]
                }else if totalTime <= 15 * 6 + 36 {
                    return ["3급", 15 * 6 + 36]
                }else {
                    return ["불합격"
                }
            }else if age < 31 {
                if totalTime <= 12 * 6 + 45 {
                    return "특급"
                }else if totalTime <= 13 * 6 + 52 {
                    return "1급"
                }else if totalTime <= 14 * 6 + 59 {
                    return "2급"
                }else if totalTime <= 16 * 6 + 6 {
                    return "3급"
                }else {
                    return "불합격"
                }
            }else if age < 36 {
                if totalTime <= 13 * 6 {
                    return "특급"
                }else if totalTime <= 14 * 6 + 12 {
                    return "1급"
                }else if totalTime <= 15 * 6 + 24 {
                    return "2급"
                }else if totalTime <= 16 * 6 + 36 {
                    return "3급"
                }else {
                    return "불합격"
                }
            }else if age < 41 {
                if totalTime <= 13 * 6 + 15 {
                    return "특급"
                }else if totalTime <= 14 * 6 + 32 {
                    return "1급"
                }else if totalTime <= 15 * 6 + 49 {
                    return "2급"
                }else if totalTime <= 17 * 6 + 6 {
                    return "3급"
                }else {
                    return "불합격"
                }
            }else if age < 44 {
                if totalTime <= 13 * 6 + 30 {
                    return "특급"
                }else if totalTime <= 14 * 6 + 49 {
                    return "1급"
                }else if totalTime <= 16 * 6 + 7 {
                    return "2급"
                }else if totalTime <= 17 * 6 + 26 {
                    return "3급"
                }else {
                    return "불합격"
                }
            }else if age < 47 {
                if totalTime <= 13 * 6 + 45 {
                    return "특급"
                }else if totalTime <= 15 * 6 + 5 {
                    return "1급"
                }else if totalTime <= 16 * 6 + 26 {
                    return "2급"
                }else if totalTime <= 17 * 6 + 46 {
                    return "3급"
                }else {
                    return "불합격"
                }
            }else if age < 50 {
                if totalTime <= 14 * 6 {
                    return "특급"
                }else if totalTime <= 15 * 6 + 25 {
                    return "1급"
                }else if totalTime <= 16 * 6 + 51 {
                    return "2급"
                }else if totalTime <= 18 * 6 + 16 {
                    return "3급"
                }else {
                    return "불합격"
                }
            }else if age < 52 {
                if totalTime <= 14 * 6 + 15 {
                    return "특급"
                }else if totalTime <= 15 * 6 + 42 {
                    return "1급"
                }else if totalTime <= 17 * 6 + 9 {
                    return "2급"
                }else if totalTime <= 18 * 6 + 36 {
                    return "3급"
                }else {
                    return "불합격"
                }
            }else if age < 54 {
                if totalTime <= 14 * 6 + 30 {
                    return "특급"
                }else if totalTime <= 16 * 6 + 2 {
                    return "1급"
                }else if totalTime <= 17 * 6 + 34 {
                    return "2급"
                }else if totalTime <= 19 * 6 + 6 {
                    return "3급"
                }else {
                    return "불합격"
                }
            }else if age < 56 {
                if totalTime <= 14 * 6 + 45 {
                    return "특급"
                }else if totalTime <= 16 * 6 + 19 {
                    return "1급"
                }else if totalTime <= 17 * 6 + 52 {
                    return "2급"
                }else if totalTime <= 19 * 6 + 26 {
                    return "3급"
                }else {
                    return "불합격"
                }
            }else if age < 58 {
                if totalTime <= 15 * 6 + 10 {
                    return "특급"
                }else if totalTime <= 16 * 6 + 46 {
                    return "1급"
                }else if totalTime <= 18 * 6 + 23 {
                    return "2급"
                }else if totalTime <= 19 * 6 + 59 {
                    return "3급"
                }else {
                    return "불합격"
                }
            }else if age < 60 {
                if totalTime <= 15 * 6 + 35 {
                    return "특급"
                }else if totalTime <= 17 * 6 + 13 {
                    return "1급"
                }else if totalTime <= 18 * 6 + 51 {
                    return "2급"
                }else if totalTime <= 20 * 6 + 29 {
                    return "3급"
                }else {
                    return "불합격"
                }
            }else {
                if totalTime <= 16 * 6 {
                    return "특급"
                }else if totalTime <= 17 * 6 + 40 {
                    return "1급"
                }else if totalTime <= 19 * 6 + 19 {
                    return "2급"
                }else if totalTime <= 20 * 6 + 59 {
                    return "3급"
                }else {
                    return "불합격"
                }
            }
        }else if type == "pushup" {
            guard let count = count else {
                return "불합격"
            }
            if age < 26 {
                if count >= 72 {
                    return "특급"
                }else if count >= 64 {
                    return "1급"
                }else if count >= 56 {
                    return "2급"
                }else if count >= 48 {
                    return "3급"
                }else {
                    return "불합격"
                }
            }else if age < 31 {
                if count >= 70 {
                    return "특급"
                }else if count >= 62 {
                    return "1급"
                }else if count >= 54 {
                    return "2급"
                }else if count >= 46 {
                    return "3급"
                }else {
                    return "불합격"
                }
            }else if age < 36 {
                if count >= 68 {
                    return "특급"
                }else if count >= 60 {
                    return "1급"
                }else if count >= 52 {
                    return "2급"
                }else if count >= 44 {
                    return "3급"
                }else {
                    return "불합격"
                }
            }else if age < 41 {
                if count >= 65 {
                    return "특급"
                }else if count >= 57 {
                    return "1급"
                }else if count >= 49 {
                    return "2급"
                }else if count >= 41 {
                    return "3급"
                }else {
                    return "불합격"
                }
            }else if age < 44 {
                if count >= 61 {
                    return "특급"
                }else if count >= 53 {
                    return "1급"
                }else if count >= 45 {
                    return "2급"
                }else if count >= 37 {
                    return "3급"
                }else {
                    return "불합격"
                }
            }else if age < 47 {
                if count >= 57 {
                    return "특급"
                }else if count >= 49 {
                    return "1급"
                }else if count >= 41 {
                    return "2급"
                }else if count >= 33 {
                    return "3급"
                }else {
                    return "불합격"
                }
            }else if age < 50 {
                if count >= 54 {
                    return "특급"
                }else if count >= 46 {
                    return "1급"
                }else if count >= 38 {
                    return "2급"
                }else if count >= 30 {
                    return "3급"
                }else {
                    return "불합격"
                }
            }else if age < 52 {
                if count >= 51 {
                    return "특급"
                }else if count >= 43 {
                    return "1급"
                }else if count >= 35 {
                    return "2급"
                }else if count >= 27 {
                    return "3급"
                }else {
                    return "불합격"
                }
            }else if age < 54 {
                if count >= 49 {
                    return "특급"
                }else if count >= 41 {
                    return "1급"
                }else if count >= 33 {
                    return "2급"
                }else if count >= 25 {
                    return "3급"
                }else {
                    return "불합격"
                }
            }else if age < 56 {
                if count >= 47 {
                    return "특급"
                }else if count >= 39 {
                    return "1급"
                }else if count >= 31 {
                    return "2급"
                }else if count >= 23 {
                    return "3급"
                }else {
                    return "불합격"
                }
            }else if age < 58 {
                if count >= 44 {
                    return "특급"
                }else if count >= 36 {
                    return "1급"
                }else if count >= 28 {
                    return "2급"
                }else if count >= 20 {
                    return "3급"
                }else {
                    return "불합격"
                }
            }else if age < 60 {
                if count >= 42 {
                    return "특급"
                }else if count >= 34 {
                    return "1급"
                }else if count >= 26 {
                    return "2급"
                }else if count >= 18 {
                    return "3급"
                }else {
                    return "불합격"
                }
            }else {
                if count >= 40 {
                    return "특급"
                }else if count >= 32 {
                    return "1급"
                }else if count >= 24 {
                    return "2급"
                }else if count >= 16 {
                    return "3급"
                }else {
                    return "불합격"
                }
            }
        }else {
            guard let count = count else {
                return "불합격"
            }
            if age < 26 {
                if count >= 86 {
                    return "특급"
                }else if count >= 78 {
                    return "1급"
                }else if count >= 70 {
                    return "2급"
                }else if count >= 62 {
                    return "3급"
                }else {
                    return "불합격"
                }
            }else if age < 31 {
                if count >= 84 {
                    return "특급"
                }else if count >= 76 {
                    return "1급"
                }else if count >= 68 {
                    return "2급"
                }else if count >= 60 {
                    return "3급"
                }else {
                    return "불합격"
                }
            }else if age < 36 {
                if count >= 80 {
                    return "특급"
                }else if count >= 72 {
                    return "1급"
                }else if count >= 65 {
                    return "2급"
                }else if count >= 57 {
                    return "3급"
                }else {
                    return "불합격"
                }
            }else if age < 41 {
                if count >= 76 {
                    return "특급"
                }else if count >= 68 {
                    return "1급"
                }else if count >= 60 {
                    return "2급"
                }else if count >= 52 {
                    return "3급"
                }else {
                    return "불합격"
                }
            }else if age < 44 {
                if count >= 72 {
                    return "특급"
                }else if count >= 64 {
                    return "1급"
                }else if count >= 56 {
                    return "2급"
                }else if count >= 48 {
                    return "3급"
                }else {
                    return "불합격"
                }
            }else if age < 47 {
                if count >= 68 {
                    return "특급"
                }else if count >= 60 {
                    return "1급"
                }else if count >= 52 {
                    return "2급"
                }else if count >= 44 {
                    return "3급"
                }else {
                    return "불합격"
                }
            }else if age < 50 {
                if count >= 65 {
                    return "특급"
                }else if count >= 57 {
                    return "1급"
                }else if count >= 49 {
                    return "2급"
                }else if count >= 41 {
                    return "3급"
                }else {
                    return "불합격"
                }
            }else if age < 52 {
                if count >= 62 {
                    return "특급"
                }else if count >= 54 {
                    return "1급"
                }else if count >= 46 {
                    return "2급"
                }else if count >= 38 {
                    return "3급"
                }else {
                    return "불합격"
                }
            }else if age < 54 {
                if count >= 60 {
                    return "특급"
                }else if count >= 52 {
                    return "1급"
                }else if count >= 44 {
                    return "2급"
                }else if count >= 36 {
                    return "3급"
                }else {
                    return "불합격"
                }
            }else if age < 56 {
                if count >= 58 {
                    return "특급"
                }else if count >= 48 {
                    return "1급"
                }else if count >= 40 {
                    return "2급"
                }else if count >= 32 {
                    return "3급"
                }else {
                    return "불합격"
                }
            }else if age < 58 {
                if count >= 56 {
                    return "특급"
                }else if count >= 48 {
                    return "1급"
                }else if count >= 40 {
                    return "2급"
                }else if count >= 32 {
                    return "3급"
                }else {
                    return "불합격"
                }
            }else if age < 60 {
                if count >= 54 {
                    return "특급"
                }else if count >= 46 {
                    return "1급"
                }else if count >= 38 {
                    return "2급"
                }else if count >= 30 {
                    return "3급"
                }else {
                    return "불합격"
                }
            }else {
                if count >= 52 {
                    return "특급"
                }else if count >= 44 {
                    return "1급"
                }else if count >= 36 {
                    return "2급"
                }else if count >= 28 {
                    return "3급"
                }else {
                    return "불합격"
                }
            }
        }
    }
}
*/
