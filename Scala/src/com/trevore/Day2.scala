package com.trevore

/**
 * Created by trevor on 3/30/15.
 */
class Day2 {
  
  def foldLeftStringArrayTotalSize() = {
    val listOfStrings = List("one", "two", "three", "four", "five")
    val total = listOfStrings.foldLeft(0)((B, String) => B + String.length)
    println(total)
  }
  
  def censureWords() = {
    var listOfWords = List("shoot", "darn", "bummer")
    val listOfSwears = Map("shoot" -> "$@#!*", "darn" -> "$#@!")
    listOfWords = listOfWords.map(word => {
      if(listOfSwears.contains(word)) listOfSwears(word) else word
    })
    println(listOfWords)
  }

}
