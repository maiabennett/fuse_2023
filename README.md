# An analysis of human donor NK cell immunophenotype composition and cancer killing capacity 

This is the repository for Maia Bennett's 2022-2023 Fund for Undergraduate Scholarly Activities (FUSE) grant project at the University of Nebraska at Omaha. This project, "Algorithmic graph theory analysis of human donor NK cell immunophenotype composition and cancer killing capacity," was completed in February 2023.

Natural killer (NK) cells are an integral component of the human immune system with the capacity to kill malignant cells via direct killing as well as via antibody-dependent cellular cytotoxicity (ADCC). As NK cells interact with stimuli, they express various activating and inhibitory protein markers on their surface in a process that continuously changes their surface marker composition (immunophenotype). Our lab has developed and currently utilizes a flow cytometry-based assay, the natural killer cell simultaneous ADCC and direct killing assay (NK-SADKA), for investigation of NK cell capacity in response to combination immunotherapies. Additionally, I have developed an eight-color NK cell immunophenotyping flow cytometry panel to assess donor NK cell profiles in parallel to the NK-SADKA. Immunophenotyping data from 9 human donors was analyzed using FlowSOM, a well-established algorithm for subtype clustering of single-cell cytometry data, to predict the composition of distinct NK cell immunophenotypes present in each donor’s samples. Immunophenotype composition in baseline and killing samples for each donor were separately assessed in relation to their ADCC and direct killing efficacies. Resulting data will help anticipate donor response in the NK-SADKA, and the described analytical pipeline may be applied to combination immunotherapy trials to predict donor response to various treatments.  

## The main goal of this project was to identify whether human donor NK cell immunophenotype compositions are consistently related to their killing efficacies when analyzed using graph theory methods.
- The first aim of this project was to effectively cluster human donors by killing efficacy per killing modality (ADCC, direct killing, and paired killing) using k-means clustering.
- The second aim of this project was to analyze human donor NK cell immunophenotype compositions using FlowSOM.
- The third aim of this project was to analyze NK cell immunophenotype differences between high-, moderate-, and low-killing donors.

## General overview of the analysis

![analytical_overview](https://user-images.githubusercontent.com/123126475/224165084-b904e348-ff48-4b8e-9f49-6ea3562729fb.png)
