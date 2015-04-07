package com.trevore

/**
 * Created by trevor on 4/3/15.
 */
class Boggle {
  private val board: List[List[String]] = List(
    List("A", "B", "O", "G"),
    List("E", "F", "G", "G"),
    List("I", "J", "K", "L"),
    List("M", "N", "O", "E")
  )

  private val wordsToFind: List[String] = List(
    "BOGGLE"
  )

  private val MAX_WORD_SIZE = wordsToFind.maxBy(item => item.length).length;
  private val MAX_BOARD_INDEX = board.length - 1;
  private val MIN_BOARD_INDEX = 0;

  def solve() = {
    for (x <- 0 to board.length - 1) {
      for (y <- 0 to board(x).length - 1) {
        permute(x, y, board(x)(y), List((x,y)))
      }
    }
    println("Finished solving")
  }

  def permute(x: Int, y: Int, word: String, path: List[(Int, Int)]) : Unit = {
    permuteIfValid(x+1, y, word, path)
    permuteIfValid(x-1, y, word, path)
    permuteIfValid(x, y+1, word, path)
    permuteIfValid(x, y-1, word, path)

    if (wordsToFind.contains(word)) {
      println("Found " + word)
      path.foreach(tuple => print(tuple.toString() + " "))
      println("")
    }
  }

  def permuteIfValid(x: Int, y: Int, word: String, path: List[(Int, Int)]) : Unit = {
    if (isInBoardBounds(x, y) && !path.contains((x, y)) && word.length() <= MAX_WORD_SIZE)
      permute(x, y, word + board(x)(y), path :+(x, y))
  }

  def isInBoardBounds(x: Int, y: Int) : Boolean = {
    return x <= MAX_BOARD_INDEX && x >= 0 &&
      y <= MAX_BOARD_INDEX && y >= 0;
  }
}
