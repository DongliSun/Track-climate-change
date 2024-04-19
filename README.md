# The factors influence the climate change

## Overview

This repo provides the reason for climate change and the factors with the CO2 emissions and population density and forest coverage. In the process that the tempertuera will built by using model to know the 4 variables relationship.


## File Structure

The repo is structured as:

-   `data/raw_data` contains the raw data as obtained from WorldBank website.
-   `data/cleaning_data` contains the cleaned dataset that was constructed.
-   `outputs` contains fitted models. 
-   `other` contains relevant details about LLM chat interactions, sketches.
-   `paper` contains the files used to generate the paper, including the Quarto document, the datasheet and reference bibliography file, as well as the PDF of the paper. 
-   `scripts` contains the R scripts used to simulate, download, clean, test and made model with data.

## Statement on LLM usage

Aspects of the code were written with the help of ChatGPT. The entire chat history is available in other/llms/usage.txt.

##  Instructions of generate the paper
1. Click the 'Code' button and download the zip.
2. Open the 'scripts folder' to run the 5 part R code - 'scripts/01_download_data.R', 'scripts/02_cleaning_data.R', 'scripts/03_explore_data.R', 'scripts/04_test_data.R', 'scripts/05_model_data.R'.
3. Adjust the code as needed.
4. Put the resulting data in the `paper/paper.qmd` and render it that will generate the PDF.
