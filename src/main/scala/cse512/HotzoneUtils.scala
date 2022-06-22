package cse512

object HotzoneUtils {

  def ST_Contains(queryRectangle: String, pointString: String ): Boolean = {
    // YOU NEED TO CHANGE THIS PART
    val coords = queryRectangle.split(",")
    val bottomLeftX = coords(0).trim().toDouble
    val bottomLeftY = coords(1).trim().toDouble
    val topRightX = coords(2).trim().toDouble
    val topRightY = coords(3).trim().toDouble
    val queryPoint = pointString.split(",")
    val queryPointX = queryPoint(0).trim().toDouble
    val queryPointY = queryPoint(1).trim().toDouble
    if (bottomLeftX > topRightX || bottomLeftY > topRightY) {
      throw new RuntimeException("Your points are not bottom-left and top-right as you assumed; " +
        "bottomLeftX="+bottomLeftX + ", bottomLeftY="+bottomLeftY +
        ", topRightX="+topRightX + ", topRightY="+topRightY)
    }
    queryPointX>=bottomLeftX && queryPointX<=topRightX && queryPointY<=topRightY && queryPointY>=bottomLeftY
  }
}
