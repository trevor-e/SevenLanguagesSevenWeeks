package com.trevore

import scala.io._
import scala.actors._
import Actor._

/**
 * Created by trevor on 4/6/15.
 */
class Day3 {
  object PageLoader {
    def getLinkCount(url : String) = """(?i)<a([^>]+)>(.+?)</a>""".r
      .findAllIn(Source.fromURL(url).mkString).toList.length
  }

  val urls = List(
    "http://www.amazon.com/",
    "http://www.twitter.com/" ,
    "http://www.google.com/" ,
    "http://www.cnn.com/"
  )

  def timeMethod(method: () => Unit) = {
    val start = System.nanoTime
    method()
    val end = System.nanoTime
    println("Method took " + (end - start)/1000000000.0 + " seconds.")
  }

  def getPageSizeSequentially() = { for(url <- urls) {
    println("Number of links for " + url + ": " + PageLoader.getLinkCount(url)) }
  }

  def getPageSizeConcurrently() = {
    val caller = self
    for(url <- urls) {
      actor { caller ! (url, PageLoader.getLinkCount(url)) }
    }
    for(i <- 1 to urls.size) {
      receive {
        case (url, count) =>
          println("Number of links for " + url + ": " + count)
      }
    }
  }

  println("Sequential run:")
  timeMethod { getPageSizeSequentially }
  println("Concurrent run")
  timeMethod { getPageSizeConcurrently }
}
