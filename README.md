# Traumatic-Brain-Injury-TBI
## Final Capstone for the 30-Day Challenge by [Zindua School](https://zinduaschool.com)

Brain Injury Awareness Month, observed each March, was established 3 decades ago to educate the public about the incidence of brain injury and the needs of persons with brain injuries and their families (1). Caused by a bump, blow, or jolt to the head, or penetrating head injury, a traumatic brain injury (TBI) can lead to short- or long-term changes affecting thinking, sensation, language, or emotion.

- This project involves doing an analysis on the effects of TBI incidents on civillian and military populations. It involved a database modelling step and an analysis step using powerBI.

### The Data was sourced from a [CDC](https://www.cdc.gov/traumaticbraininjury/pdf/TBI-Surveillance-Report-FINAL_508.pdf) report.

The data was extracted by scraping important details from the above mentioned pdf report to build a case study.

## Data Dictionary

## `tbi_age.csv`

|variable         |class     |description |
|:----------------|:---------|:-----------|
|age_group        |character | Age group |
|type             |character | Type of measure |
|injury_mechanism |character | Injury mechanism |
|number_est       |double    | Estimated observed cases in 2014 |
|rate_est         |double    | Rate/100,000 in 2014 |

## `tbi_year.csv`

|variable         |class     |description |
|:----------------|:---------|:-----------|
|injury_mechanism |character | Injury mechanism |
|type             |character | Type of measure |
|year             |character | Year |
|rate_est         |double    | Rate/100,000 in 2014 |
|number_est       |integer   | Estimated observed cases in each year |

## `tbi_military.csv`

|variable  |class     |description |
|:---------|:---------|:-----------|
|service   |character | Military branch |
|component |character | Military component (active, guard, reserve) |
|severity  |character | Severity/type of TBI |
|diagnosed |double    | Number diagnosed |
|year      |integer   | Year for observation|
Analyzing TBI incidents on civilian and Military populations

### Project Collaborators
- **Angela Wahito:** Enter short bio | [Github]() | [LinkedIn]()
- **Ndege Ototo:** Enter short bio | [Github]() | [LinkedIn]()
- **Emily Kinoti:** Enter short bio | [Github]() | [LinkedIn]()
