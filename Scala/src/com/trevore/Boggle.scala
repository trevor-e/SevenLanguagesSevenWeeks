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

  private val MAX_WORD_SIZE = 6;
  private val MAX_BOARD_INDEX = 3;
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
    if (word.length() > MAX_WORD_SIZE) return

    if (x+1 <= MAX_BOARD_INDEX && !path.contains((x+1, y))) permute(x+1, y, word + board(x+1)(y), path :+ (x+1, y))
    if (x-1 >= MIN_BOARD_INDEX && !path.contains((x-1, y))) permute(x-1, y, word + board(x-1)(y), path :+ (x-1, y))
    if (y+1 <= MAX_BOARD_INDEX && !path.contains((x, y+1))) permute(x, y+1, word + board(x)(y+1), path :+ (x, y+1))
    if (y-1 >= MIN_BOARD_INDEX && !path.contains((x, y-1))) permute(x, y-1, word + board(x)(y-1), path :+ (x, y-1))

    if (wordsToFind.contains(word)) {
      println("Found " + word)
      path.foreach(tuple => print(tuple.toString() + " "))
      println("")
    }
  }

}
