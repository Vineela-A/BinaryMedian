//
//  ViewController.swift
//  BindaryMedian
//
//  Created by Vineela on 8/20/17.
//  Copyright © 2017 Sri. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        example(inputA: [1, 2, 3, 4, 50, 62, 77],
                inputB: [ 17, 27, 33, 89, 600, 700, 900])
        // result: [33 50]
        
        example(inputA: [10, 11, 12, 13, 14, 20],
                 inputB: [10, 11, 12, 14, 20])
        // result : [12, 13]
        
        example(inputA: [10, 11, 12, 13, 14, 800],
                inputB: [10, 11, 12, 14, 20, 21, 900])
        // result : [13, 14]
        
        example(inputA: [1, 2, 3, 4, 5],
                inputB: [7, 8, 9, 10, 11])
        // return [7, 5]
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func example(inputA: [Int], inputB: [Int]) {
        print("---Example----")
        print(inputA)
        print(inputB)
        print(findMedianInSortedArray(inputA: inputA, inputB: inputB, startIndexA: 0, endIndexA: inputA.count-1, startIndexB: 0, endIndexB: inputB.count-1))
    }
    
    
    func findMedianInSortedArray(inputA: [Int], inputB: [Int], startIndexA: Int, endIndexA: Int, startIndexB: Int, endIndexB: Int) -> [Int] {
        var findMedianNumArr:[Int] = []
        
        var startIndexA = startIndexA
        var endIndexA   = endIndexA
        var startIndexB = startIndexB
        var endIndexB   = endIndexB
        
        if ((endIndexA - startIndexA) < 0) || ((endIndexB - startIndexB) < 0) {
            print("Invalid Input")
        }
        
        if (endIndexA - startIndexA == 0) && (endIndexB - startIndexB == 0) {
            findMedianNumArr.append(inputA[0])
            findMedianNumArr.append(inputB[0])
            return findMedianNumArr
        }
        
        if endIndexA - startIndexA == 1 && endIndexB - startIndexB == 1 {
            findMedianNumArr.append(max(inputA[startIndexA], inputB[startIndexB]))
            findMedianNumArr.append( min(inputA[endIndexA], inputB[endIndexB]))
            return findMedianNumArr
        }
        
        let medianA = findMedian(input: inputA, startIndex: startIndexA, endIndex: endIndexA)
        let medianB = findMedian(input: inputB, startIndex: startIndexB, endIndex: endIndexB)
        
        if medianB == medianA {
            let medianArrA = findMedianArray(input: inputA, startIndex: startIndexA, endIndex: endIndexA)
            let medianArrB = findMedianArray(input: inputB, startIndex: startIndexB, endIndex: endIndexB)
            findMedianNumArr.append(contentsOf: medianArrA)
            findMedianNumArr.append(contentsOf: medianArrB)
            return findMedianNumArr
        }
        
        let medianAIndex = (startIndexA + endIndexA) / 2
        let medianBIndex = (startIndexB + endIndexB) / 2
        if medianB > medianA {
            if((endIndexA - startIndexA) % 2 == 0) {
                startIndexA = medianAIndex
                endIndexB = medianBIndex
            } else {
                startIndexA = medianAIndex
                endIndexB = medianBIndex + 1
            }
        } else {
            if((endIndexA - startIndexA) % 2 == 0) {
                endIndexA = medianAIndex
                startIndexB = medianBIndex
            } else {
                endIndexA = medianAIndex + 1
                startIndexB = medianBIndex
            }
        }
        
        return findMedianInSortedArray(inputA: inputA, inputB: inputB, startIndexA: startIndexA, endIndexA: endIndexA, startIndexB: startIndexB, endIndexB: endIndexB)
    }
    
    func findMedian(input: [Int], startIndex: Int, endIndex: Int) -> Double {
        let indexMid = (startIndex + endIndex) / 2
        let indexDifference = (endIndex - startIndex)
        if indexDifference % 2 == 1 {
            return Double(input[indexMid+1]+input[indexMid])/2.0
        } else {
            return Double(input[indexMid])
        }
    }
    
    func findMedianArray(input: [Int], startIndex: Int, endIndex: Int) -> [Int] {
        var findMedianNumArr:[Int] = []
        
        let indexMid = (startIndex + endIndex) / 2
        let indexDifference = (endIndex - startIndex)
        if indexDifference % 2 == 1 {
            findMedianNumArr.append(input[indexMid+1])
        }
        findMedianNumArr.append(input[indexMid])
        return findMedianNumArr
    }
}

