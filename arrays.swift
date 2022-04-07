// learning how to do arrays and finding mean, median and mode
// Andrew Du-frigstad
// version 1
// since 2022-03-23

import Foundation

// mean finding function
func calcMean(arrayOfInts: [Int]) -> Double {

  // declaring variables
  var total = 0.0
  let arrayNum = arrayOfInts.count

  // loop for calculating the total
  for ints in arrayOfInts {
    total = total + Double(ints)
  }

  // calculating mean
  let mean = total/Double(arrayNum)

  return Double(mean)
}

// median finding function
func calcMedian(arrayOfInts: [Int]) -> Double {

  // declaring variables
  var findMedian1 = 0
  var findMedian2 = 0
  var median = 0

  // if statement to find the median depending if it is odd or not
  if (arrayOfInts.count % 2 == 0) {

    // if it is even then find the number inbetween the 2 numbers
    findMedian1 = arrayOfInts[arrayOfInts.count / 2]
    findMedian2 = arrayOfInts[(arrayOfInts.count / 2) + 1]

    median = (findMedian1 + findMedian2) / 2
  }

  // if odd then just take the middle number
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

  // making another array to get the mode to run properly
  var i = 0
  var array: [Int] = arrayOfInts
  array.append(-1)

  // for loop to run until all numbers are scanned
  for (index, ints) in arrayOfInts.enumerated() {
    
    i = index + 1

    // if loop to find the mode
    if (array[i] != array[i - 1]) {

      if (counter > biggestNum) {
        // seeing which number repeats
        biggestNum = counter

        // remembering the number if new
        mode.removeAll()
        mode.append(array[i - 1])
      }

      else if (counter == biggestNum) {

        // addin gthe number to the mode because it repeats
        mode.append(array[i - 1])
      }
      counter = 1
    }

    else {
      counter = counter + 1
    }
  }

  return mode
}

// reading the .txt files
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

  // calling and printing the functions
  let meanMain = calcMean(arrayOfInts: arrayOfInts)
  print("Your mean is \(meanMain)")

  let medianMain = calcMedian(arrayOfInts: arrayOfInts)
  print("Your median is \(medianMain)")

  let modeMain = calcMode(arrayOfInts: arrayOfInts)
  print("Your mode is \(modeMain)")

}

main()