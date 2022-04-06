// learning how to do arrays and finding mean, median and mode
// Andrew Du-frigstad
// version 1
// since 2022-03-23

import Foundation

func calcMean(arrayOfInts: [Int]) -> Double {

  var total = 0.0
  let arrayNum = arrayOfInts.count

  for ints in arrayOfInts {
    total = total + Double(ints)
  }
  
  let mean = total/Double(arrayNum)

  return Double(mean)
}

func calcMedian(arrayOfInts: [Int]) -> Double {

  var findMedian1 = 0
  var findMedian2 = 0
  var median = 0

  if (arrayOfInts.count % 2 == 0) {
    findMedian1 = arrayOfInts[arrayOfInts.count / 2]
    findMedian2 = arrayOfInts[(arrayOfInts.count / 2) + 1]

    median = (findMedian1 + findMedian2) / 2
  }
  
  else {
    median = arrayOfInts[arrayOfInts.count / 2]
  }

  return Double(median)
}

func calcMode(arrayOfInts: [Int]) -> [Int] {
  
  // declaring variables
  var counter = 0
  var biggestNum = counter
  var mode = [Int]()

  for (index, ints) in arrayOfInts.enumerated() {
    if (ints != ints - 1) {

      if (counter > biggestNum) {
        biggestNum = counter

        mode.removeAll()
        mode.append(ints - 1)
      }

      else if (counter == biggestNum) {
        mode.append(ints - 1)
      }
      counter = counter + 1
    }

    else {
      counter = counter + 1
    }
  }

  return mode
}

func readFile(_ path: String) -> [Int] {

  var arrayOfInts: [Int] = []
  let errno = 0

  if freopen(path, "r", stdin) == nil {
    perror(path)
    return []
  }

  while let line = readLine() {
    arrayOfInts.append(Int(line) ?? -1)
    
  }

  return arrayOfInts
}

func main() {

  // get which file to use
  print("Which txt file do you want to read from: ")
  let fileNum = readLine()
  let file = "set"+fileNum!+".txt"

  var arrayOfInts: [Int] = readFile(file)

  arrayOfInts.sort()

  print(arrayOfInts)

  let meanMain = calcMean(arrayOfInts: arrayOfInts)
  print("Your mean is \(meanMain)")

  let medianMain = calcMedian(arrayOfInts: arrayOfInts)
  print("Your median is \(medianMain)")

  let modeMain = calcMode(arrayOfInts: arrayOfInts)
  print("Your mode is \(modeMain)")

}

main()