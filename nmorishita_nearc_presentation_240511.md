# Basic mathematics revealed forest dynamics in MA.
This will be presented at NEARC Conference on 21st May, 2024 by Naoya Morishita.
This presentation summarizes the presenter's master thesis, submitted to Clark University.

## 0. Summary
1. 
2. 
3. 

## 1. Introduction
- Previous studies reported that forest loss and forest fragmentation mainly occurred in east MA.
    - It is important to note habitat fragmentation per se may provide different effect on biodiversity.
- However, I believed that they could be improved if:
    1. areas with high change and loss intensities are identified.
    2. studies defines "fragmentation" for a specific species.
- Also, there are a lot of "cool" techs, but they are often complicated.
    - Thus, simple metrices can play a role especially when presenting people with less knowledge about GIS.
- Thus, I focused on American Black Bears' minimum home range (24km^2) to identify forest fragmentation change and non- forest gain throughout MA.
    - I calculated the change intensities by municipalities.
        - It would help local governers to balance out conservation and economic development.

*TODO: Insert conceptual diagram*

## 2. Data
- I used 30m regional land cover data from NOAA at the time point of 2006 and 2016. 
    - NCLD had 2021 land cover data
        - However it was avoided because I and my supervisor were concerned about too generalized data.
- I also used municipality boundary layer from MassGIS.

## 3. Methods
### 3.1 Workflow Image
*Todo: Insert workflow*

### 3.2 What is foreground area intensity (FAD)?
1. I reclassified the LC layers into 3 categories:
    - Foreground (category of interest): Forest
    - Background: Non- forest
    - No data
2. GuidoToolbox calculated foreground area density.
    - We set a moving window size of approximately 24 sqkm.
    - If the center pixel is the foreground, then
        - FAD = Number of foreground pixels/ Number of total pixels in the moving window.
    - If the center pixel is the background, then the FAD was not calculated, and categorized as background.
3. I reclassified each pixel as follows:
    - If the FAD value was lower than 60%, then the pixel is "fragmented forest (FF)."
    - If the FAD value was more than 60%, then the pixel is "non- fragmented (NFF)."
    - If the FAD value was background, then the pixel is "non- forest (NF)"

See this document for the details.

### 3.3 What is change metrics?
- We compared the 2 maps at the time point of 2006 (TP06) and at the time point of 2016 (TP16).
    - The map contains fragmented forest, non- fragmented forest, and non- forest.

#### 3.3.1 What is change intensity?
1. Change includes gain and losses for each category.
    - Number of loss = Number of pixels that were of the category at TP06, but not of the category at TP16.
    - Number of gain = Number of pixels that were of the category at TP06, but not of the category at TP16.
    - Please note that "change" means that categories are different at the two time points.
        - Thus if a pixel changed into another category and changed back to the original category during the same time interval, then it is not changed.
2. Loss intensity and gain intensity for a category of interest were calculated as follows for each municipality:
    - Loss intensity = Number of loss/ Total number of pixel of the category at TP06
    - Gain intensity = Number of gain/ Total number of pixel of the category at TP16
3. I calculated change intensity between the two time points as follows, which is also called gross change intensity:
    - Change intensity = Number of pixels that changed, including all categories/ Number of total pixels including all categories

*TODO insert images*

#### 3.3.2 What is quantity intensity?
1. Quantity is also called net change.
2. This is a change without simultaneous loss and gain among categories.
    - Loss quantity = Number of pixels of the category at 2006 - Number of pixels of the category at 2016
    - Gain quantity = Number of pixels of the category at 2016 - Number of pixels of the category at 2006
        - If the result is negative, then the quantity is zero.
        - If a category have the gain quantity for a municipality, then it is impossible that the category in the municipality have loss quantity more than 0.
3. The quantity intensities were calculated as below.
    - Loss quantity intensity = Loss quantity/ Total number of pixel of the category at 2006
    - Gain quantity intensity = Gain quantity/ Total number of pixels of the category at 2016.
*TODO insert images*

### 3.4 What is local Moran's I?
1. Local moran's I identifies spatial clusters of high and low values, as well as spatial outliers for each record in a vector layer.
    - Note the "high" and "low" are relative to mean value.
2. If the local moran's I is high, then the value of the record is similar to those of its neighbors, whichever the value is high or low.
    - The statistical significance was caluculated by comparing the value with an expected value.
3. By comparing the attribute values with mean, the resulting layer would highlight high clusters, low clusters, and spatial outliers.

See this webpage for the detail.

## 4. Result & Discussion
*Use slides*

## 5. Future Direction

## 6. Appendix
### 6.1 Key References

### 6.2 Awknowledgement
I would like to thank Professor John Rogan for his guidance throughout my research.