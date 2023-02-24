# Objective

Bulk download of [NIH RePORTER](https://reporter.nih.gov/) data.

# Usage

The bash script in the repositroy can be used to download

* Projects files, (/exporter/projects/download/<fy>)
* Abstracts files, (/exporter/abstracts/download/<fy>)
* Publications files, (/exporter/publications/download/<fy>)
* Link tables files, and (/exporter/linktables/download/<fy>)

As per NIH RePORT guideline, https://reporter.nih.gov/exporter/projects/download/2020 will download Projects for FY2020.

See https://report.nih.gov/faqs for further details.

# Run

To run the script:

    bash dl_nih_project_data.sh 2015 2021 publications

This command will download publications from 2015 to 2021 (in NIH RePORTER database).