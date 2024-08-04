# RGB2CMYK
 There are two different models for colours: additive (i.e., light) and subtractive (i.e., paint). The additive primaries are Red (R) , Green (G) and Blue (B). The subtractive primaries are Cyan (C), Magenta (M), and Yellow (Y). The three subtractive primares are supposed to make perfect black when mixed together in equal amounts. However, since black paint is generally cheaper than mixing the three primaries, we also consider black (K for key) as a subtractive primary. The RGB system is used for computer monitors, while the CMYK system is ised for colour printers. In order to produce comparable result based on on-screen designs, we need a reliable mappiing between the two systems. Surprisingly, such a mapping is rather hard to find. This project will explore this.

check the [project report](https://github.com/amansingh2116/RGB2CMYK/blob/main/RGB_CMYK.pdf) for detailed explaination.

## The Algorithm

### 1. Normalize RGB Values
- Convert RGB values from the range of 0-255 to a range of 0-1 by dividing each RGB value by 255. This normalization simplifies subsequent calculations.

### 2. Convert RGB to CMY
- Invert each RGB value by subtracting it from 1 to obtain the corresponding CMY values.
  - **Cyan (C)** = 1 - **Red (R)**
  - **Magenta (M)** = 1 - **Green (G)**
  - **Yellow (Y)** = 1 - **Blue (B)**

### 3. Find Black (K)
- Determine the black component (K) by finding the maximum value among the CMY values. This identifies the amount of black ink required to reproduce the color.
  - **Black (K)** = 1 - max(C, M, Y)

### 4. Adjust CMY Values for Black
- Adjust the CMY values based on the amount of black (K) to obtain the final CMYK values. This adjustment compensates for the black component and ensures that the total ink usage doesn’t exceed 100%.
  - **Cyan (C)** = (C - K) / (1 - K)
  - **Magenta (M)** = (M - K) / (1 - K)
  - **Yellow (Y)** = (Y - K) / (1 - K)

## Derivation

### RGB (Red, Green, Blue) Color Model
- Additive color model used in electronic displays.
- Colors are created by combining various intensities of red, green, and blue light.
- Each RGB component ranges from 0 to 255, representing the intensity of the color.

### CMYK (Cyan, Magenta, Yellow, Black) Color Model
- Subtractive color model used in color printing.
- Colors are created by subtracting varying amounts of cyan, magenta, yellow, and black ink from a white background.
- Each CMYK component ranges from 0 to 100%, representing the amount of ink used for printing.

### Conversion Process
- **Normalization**: Convert RGB values to a standardized range for consistent calculations.
- **Conversion**: Invert RGB values to obtain CMY values. Determine the black component (K) based on the maximum CMY value.
- **Adjustment**: Compensate for the black component by adjusting CMY values to ensure accurate color representation in printing.

### Insights
- **RGB to CMY Conversion**: Reflects the complementary nature of RGB and CMY color models.
- **CMYK Integration**: Incorporates black (K) to enhance color depth and contrast in printed materials.
- **Consistency**: Ensures consistent color representation across digital and print media platforms.

## CMYK to RGB Conversion
Similarly, by reversing the steps, we can achieve CMYK to RGB conversion. By following this algorithm, we can effectively convert colors between the RGB and CMYK color models, addressing the challenges posed by differences in color spaces and ensuring accurate color reproduction in various mediums.

[Here](https://github.com/amansingh2116/RGB2CMYK/blob/main/rgbVcmyk.r) is the code to implement this process, and [here](https://github.com/amansingh2116/RGB2CMYK/blob/main/rgb2adjusted.r) is the code for actual practical implementation and testing of the algorithm.