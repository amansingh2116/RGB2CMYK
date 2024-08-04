library(jpeg)

# Function to adjust RGB color using CMYK conversion
adjust_rgb_with_cmyk <- function(rgb_tuple) {
  # Convert RGB to CMYK
  rgb_to_cmyk <- function(rgb_tuple) {
    r <- rgb_tuple[1]
    g <- rgb_tuple[2]
    b <- rgb_tuple[3]
    
    c <- 1 - r
    m <- 1 - g
    y <- 1 - b
    
    k <- min(c, m, y)
    
    if (k == 1) {
      cmyk_tuple <- c(0, 0, 0, 1)
    } else {
      cmyk_tuple <- c((c - k) / (1 - k), (m - k) / (1 - k), (y - k) / (1 - k), k)
    }
    
    return(cmyk_tuple)
  }
  
  # Convert CMYK to RGB
  cmyk_to_rgb <- function(cmyk_tuple) {
    c <- cmyk_tuple[1] * (1 - cmyk_tuple[4]) + cmyk_tuple[4]
    m <- cmyk_tuple[2] * (1 - cmyk_tuple[4]) + cmyk_tuple[4]
    y <- cmyk_tuple[3] * (1 - cmyk_tuple[4]) + cmyk_tuple[4]
    
    r <- (1 - c)
    g <- (1 - m)
    b <- (1 - y)
    
    return(c(round(r), round(g), round(b)))
  }
  
  # Adjust RGB color using CMYK conversion
  cmyk_tuple <- rgb_to_cmyk(rgb_tuple)
  adjusted_rgb_tuple <- cmyk_to_rgb(cmyk_tuple)
  
  return(adjusted_rgb_tuple)
}

# Read the input image
x <- readJPEG("image_path.jpeg")
dimn <- dim(x)
result <- array(0, dim = dimn)

# Iterate over each pixel
for (i in 1:dimn[1]) {
  for (j in 1:dimn[2]) {
    pixel <- x[i, j, ]
    result[i, j, ] <- adjust_rgb_with_cmyk(pixel)
  }
}

# Plot the adjusted RGB image
plot(as.raster(result))
