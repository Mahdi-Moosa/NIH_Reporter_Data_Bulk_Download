set -e

DEFAULTVALUE="projects"

START_YEAR=$1   # 1985
END_YEAR=$2     # 2021
DATA_TYPE="${3:-$DEFAULTVALUE}"

URL_PREFIX="https://reporter.nih.gov/exporter/${DATA_TYPE}/download"

# Bulk ExPORTER data can be downloaded from RePORTER using the following URL format, where <fy> indicates the four-digit fiscal year:

#     Projects files, (/exporter/projects/download/<fy>)
#     Abstracts files, (/exporter/abstracts/download/<fy>)
#     Publications files, (/exporter/publications/download/<fy>)
#     Link tables files, and (/exporter/linktables/download/<fy>)
#     Clinical studies files (/exporter/clinicalstudies/download)
#     Patents files (/exporter/patents/download)

# For example, https://reporter.nih.gov/exporter/projects/download/2020 will download Projects for FY2020.

# This bash script only works for project, abstracts, publications, linktables.

for YEAR in $(seq $START_YEAR $END_YEAR); do
    URL="${URL_PREFIX}/${YEAR}"
    LOCAL_PREFIX="${DATA_TYPE}/data"
    LOCAL_FILE="${LOCAL_PREFIX}/${YEAR}.zip"

    echo "Downloading ${URL}; saving as ${LOCAL_FILE}."

    mkdir -p ${LOCAL_PREFIX}
    wget ${URL} -O ${LOCAL_FILE}

    echo "Unzipping ${LOCAL_FILE}."

    unzip ${LOCAL_FILE} -d ${LOCAL_PREFIX}

    echo "Removing ${LOCAL_FILE}."

    rm ${LOCAL_FILE}

done