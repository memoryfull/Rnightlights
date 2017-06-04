######################## getNlTileZipLclNameVIIRS ###################################

#' Constructs the filename used to save/access the downloaded VIIRS tile .tgz file
#'
#' Constructs the filename used to save/access the downloaded VIIRS tile .tgz file
#'
#' @param nlYearMonth The nlYearMonth in which the tile was created
#'
#' @param tileNum The index of the tile as given in nlTileIndex
#'
#' @param dir The directory storing the tiles. Defaults to the global variable dirRasterVIIRS
#'
#' @return A character string filename of the compressed .tgz VIIRS tile
#'
#' @examples
#' \dontrun{getNlTileZipLclNameVIIRS("201401", "1")}
#'  #returns "./tiles/viirs_2014_01_75N180W.tgz"
#'
getNlTileZipLclNameVIIRS <- function(nlYearMonth, tileNum, dir=getNlDir("dirRasterVIIRS"))
{
  if(missing(nlYearMonth))
    stop("Missing required parameter nlYearMonth")
  
  if(missing(tileNum))
    stop("Missing required parameter tileNum")
  
  if(!validNlPeriodVIIRS(nlYearMonth))
    stop("Invalid nlYearMonth: ", nlYearMonth)
  
  if(!validNlTileNumVIIRS(tileNum))
    stop("Invalid tileNum: ", tileNum)
  
  nlYear <- substr(nlYearMonth, 1, 4)
  
  nlMonth <- substr(nlYearMonth, 5, 6)
  
  return (paste0("viirs_", nlYear, "_", nlMonth, "_", tileIdx2Name(tileNum, "VIIRS"), ".tgz"))
}

######################## getNlTileZipLclNamePath ###################################

#' Constructs the full path used to save/access the compressed downloaded tile
#'
#' Constructs the full path used to save/access the compressed downloaded tile
#'     Calls the relevant function for the given nlType
#'
#' @param nlType the nlType of interest
#' 
#' @param nlPeriod the nlYearMonth in which the tile was created
#'
#' @param tileNum the index of the tile as given in nlTileIndex
#'
#' @return a character string filename of the compressed .tgz VIIRS tile
#'
#' @examples
#' \dontrun{getNlTileZipLclNamePath("VIIRS", "201401", "1")}
#'  #returns "/dataPath/viirs_2014_01_75N180W.tgz"
#'  
#' \dontrun{getNlTileZipLclNamePath("OLS", "2004", "1")}
#'  #returns "/dataPath/ols_2004.tgz"
#'
getNlTileZipLclNamePath <- function(nlType, nlPeriod, tileNum)
{
  if(missing(nlType))
    stop("Missing required parameter nlType")
  
  if(missing(nlPeriod))
    stop("Missing required parameter nlPeriod")
  
  if(nlType == "VIIRS" && missing(tileNum))
    stop("Missing required parameter tileNum")
  
  if(!validNlType(nlType))
    stop("Invalid nlType: ", nlType)
  
  if(!validNlPeriod(nlPeriod, nlType))
    stop("Invalid nlPeriod: ", nlPeriod, " for nlType: ", nlType)
  
  if(nlType == "VIIRS" && !validNlTileNumVIIRS(tileNum))
    stop("Invalid tileNum: ", tileNum)
  
  if(nlType == "OLS")
    return (file.path(getNlDir("dirRasterOLS"), getNlTileZipLclNameOLS(nlPeriod)))
  else if(nlType == "VIIRS")
    return (file.path(getNlDir("dirRasterVIIRS"), getNlTileZipLclNameVIIRS(nlPeriod, tileNum)))
}

######################## getNlTileTifLclNamePath ###################################

#' Constructs the full path used to save/access the downloaded tile .tgz file
#'
#' Constructs the full path used to save/access the downloaded tile .tgz file
#'
#' @param nlType the nlType of interest
#'
#' @param nlPeriod the nlYearMonth in which the tile was created
#'
#' @param tileNum the index of the tile as given in nlTileIndex
#'
#' @return a character string filename of the compressed .tgz VIIRS tile
#'
#' @examples
#' \dontrun{getNlTileZipLclNamePath("OLS", "2014")}
#'  #returns "/dataPath/ols_2014_01.tgz"
#'
#' \dontrun{getNlTileZipLclNamePath("VIIRS", "201412", "1")}
#'  #returns "/dataPath/viirs_2014_12_75N180W.tgz"
#'  
getNlTileTifLclNamePath <- function(nlType, nlPeriod, tileNum)
{
  if(missing(nlType))
    stop("Missing required parameter nlType")
  
  if(missing(nlPeriod))
    stop("Missing required parameter nlPeriod")
  
  if(nlType == "VIIRS" && missing(tileNum))
    stop("Missing required parameter tileNum")
  
  if(!validNlType(nlType))
    stop("Invalid nlType: ", nlType)
  
  if(!validNlPeriod(nlPeriod, nlType))
    stop("Invalid nlPeriod: ", nlPeriod, " for nlType: ", nlType)
  
  if(nlType == "VIIRS" && !validNlTileNumVIIRS(tileNum))
    stop("Invalid tileNum: ", tileNum)
  
  if(nlType == "OLS")
    return (file.path(getNlDir("dirRasterVIIRS"), getNlTileTifLclNameOLS(nlPeriod)))
  else if(nlType == "VIIRS")
    return (file.path(getNlDir("dirRasterVIIRS"), getNlTileTifLclNameVIIRS(nlPeriod, tileNum)))
}

######################## getNlTileTifLclNameVIIRS ###################################

#' Constructs the filename of the decompressed VIIRS .tif file
#'
#' Constructs the filename of the decompressed VIIRS .tif file
#'
#' @param nlYearMonth the nlYearMonth in which the tile was created
#'
#' @param tileNum the index of the tile as given in nlTileIndex
#'
#' @param dir the directory storing the tiles. Defaults to the global variable dirRasterVIIRS
#'
#' @return a character vector filename of the .tif VIIRS tile
#'
#' @examples
#' #using default dirRasterVIIRS
#' \dontrun{getNlTileTifLclNameVIIRS("2014", "01", "1")}
#'  #returns "viirs_2014_01_75N180W.tif"
#'
getNlTileTifLclNameVIIRS <- function(nlYearMonth, tileNum, dir=getNlDir("dirRasterVIIRS"))
{
  if(missing(nlYearMonth))
    stop("Missing required parameter nlYearMonth")
  
  if(missing(tileNum))
    stop("Missing required parameter tileNum")
  
  if(!validNlPeriodVIIRS(nlYearMonth))
    stop("Invalid nlYearMonth: ", nlYearMonth)
  
  if(!validNlTileNumVIIRS(tileNum))
    stop("Invalid tileNum: ", tileNum)
  
  nlYear <- substr(nlYearMonth, 1, 4)
  
  nlMonth <- substr(nlYearMonth, 5, 6)
  
  return (paste0("viirs_", nlYear, "_", nlMonth, "_", tileIdx2Name(tileNum, "VIIRS"), ".tif"))
}

######################## getNlTileTifLclNameOLS ###################################

#' Constructs the filename of the decompressed OLS .tif file
#'
#' Constructs the filename of the decompressed OLS .tif file
#'
#' @param nlYear the nlYear in which the tile was created
#'
#' @return a character vector filename of the .tif OLS tile
#'
#' @examples
#' #using default dirRasterOLS
#' \dontrun{getNlTileTifLclNameVIIRS("2004")}
#'  #returns "OLS_2004.tif"
#'
getNlTileTifLclNameOLS <- function(nlYear)
{
  if(missing(nlYear))
    stop("Missing required parameter nlYear")
  
  if(!validNlPeriodOLS(nlYear))
    stop("Invalid nlYear: ", nlYear)
  
  return (paste0("ols_", nlYear, ".tif"))
}

######################## getNlTileTifLclNamePathVIIRS ###################################

#' Constructs the full path used to save/access the decompressed VIIRS .tif file
#'
#' Constructs the full path used to save/access the decompressed VIIRS .tif file
#'
#' @param nlYearMonth the yearMonth in which the tile was created
#'
#' @param tileNum the index of the tile as given in nlTileIndex
#'
#' @return a character vector filename of the .tif VIIRS tile
#'
#' @examples
#' #using default dirRasterVIIRS
#' \dontrun{getNlTileTifLclNamePathVIIRS("201401", "1")}
#'  #returns "/dataPath/tiles/viirs_2014_01_75N180W.tif"
#'
getNlTileTifLclNamePathVIIRS <- function(nlYearMonth, tileNum)
{
  nlType <- "VIIRS"
  
  if(missing(nlYearMonth))
    stop("Missing required parameter nlYearMonth")
  
  if(missing(tileNum))
    stop("Missing required parameter tileNum")
  
  if(!validNlPeriodVIIRS(nlYearMonth))
    stop("Invalid nlYearMonth: ", nlYearMonth)
  
  if(!validNlTileNumVIIRS(tileNum))
    stop("Invalid tileNum: ", tileNum)
  
  return (file.path(getNlDir("dirRasterVIIRS"), getNlTileTifLclNameVIIRS(nlYearMonth, tileNum)))
}

######################## getNlTileTifLclNamePathOLS ###################################

#' Constructs the full path used to save/access the decompressed OLS .tif file
#'
#' Constructs the full path used to save/access the decompressed OLS .tif file
#'
#' @param nlYear the year in which the tile was created
#' 
#' @param tileNum ignored
#'
#' @return a character vector filename of the .tif OLS tile
#'
#' @examples
#' #using default dirRasterVIIRS
#' \dontrun{getNlTileTifLclNamePathOLS("2014", "1")}
#'  #returns "/dataPath/tiles/ols_2014.tif"
#'
getNlTileTifLclNamePathOLS <- function(nlYear, tileNum)
{
  nlType <- "OLS"
  
  if(missing(nlYear))
    stop("Missing required parameter nlYear")
  
  if(!validNlPeriodOLS(nlYear))
    stop("Invalid nlYear: ", nlYear)
  
  return (file.path(getNlDir("dirRasterOLS"), getNlTileTifLclNameOLS(nlYear)))
}

######################## getNlTileZipLclNameOLS ###################################

#' The name with which to save the OLS tile locally
#'
#' The name with which to save the OLS tile locally
#'
#' @param nlYear The year of the OLS tile
#'
#' @return character string filename
#'
#' @examples
#' \dontrun{getNlTileZipLclNameOLS("2012")}
#'
getNlTileZipLclNameOLS <- function(nlYear)
{
  if(missing(nlYear))
    stop("Missing required parameter nlYear")
  
  if(!validNlPeriodOLS(nlYear))
    stop("Invalid nlYear")
  
  return (paste0("ols_", nlYear, ".tgz"))
}

######################## getNlTifLclNameOLS ###################################

#' Constructs the filename used to save/access the decompressed OLS .tif file
#'
#' Constructs the filename used to save/access the decompressed OLS .tif file
#'
#' @param nlYear the year in which the tile was created
#'
#' @return a character vector filename of the .tif VIIRS tile
#'
#' @examples
#' #using default dirRasterOLS
#' \dontrun{getNlTifLclNameOLS("2004")}
#'  #returns "ols_2004.tif"
#'
#'
getNlTifLclNameOLS <- function(nlYear)
{
  if(missing(nlYear))
    stop("Missing required parameter nlYear")
  
  if(!validNlPeriodOLS(nlYear))
    stop("Invalid nlYear")
  
  return (paste0("ols_", nlYear, ".tif"))
}