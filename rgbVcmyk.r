# Function to convert RGB to CMYK
rgb_to_cmyk <- function(rgb_tuple) {
  # Normalize RGB values
  r <- rgb_tuple[1] / 255
  g <- rgb_tuple[2] / 255
  b <- rgb_tuple[3] / 255
  
  # Convert to CMY
  c <- 1 - r
  m <- 1 - g
  y <- 1 - b
  
  # Find K (Black)
  k <- min(c, m, y)
  
  # Adjust CMY values for Black
  if (k == 1) {
    cmyk_tuple <- c(0, 0, 0, 1)
  } else {
    cmyk_tuple <- c((c - k) / (1 - k), (m - k) / (1 - k), (y - k) / (1 - k), k)
  }
  
  return(cmyk_tuple)
}

# Function to convert CMYK to RGB
cmyk_to_rgb <- function(cmyk_tuple) {
  c <- cmyk_tuple[1] * (1 - cmyk_tuple[4]) + cmyk_tuple[4]
  m <- cmyk_tuple[2] * (1 - cmyk_tuple[4]) + cmyk_tuple[4]
  y <- cmyk_tuple[3] * (1 - cmyk_tuple[4]) + cmyk_tuple[4]
  
  r <- (1 - c) * 255
  g <- (1 - m) * 255
  b <- (1 - y) * 255
  
  return(c(round(r), round(g), round(b)))
}

# Example usage
rgb_color <- c(255, 0, 0)  # Red
cmyk_color <- rgb_to_cmyk(rgb_color)
cat("RGB:", rgb_color, "\n")
cat("CMYK:", cmyk_color, "\n")

# Convert back to RGB
rgb_from_cmyk <- cmyk_to_rgb(cmyk_color)
cat("RGB from CMYK:", rgb_from_cmyk, "\n")
