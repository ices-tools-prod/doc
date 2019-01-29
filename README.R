## R script to convert README.Rmd -> README.md

## To get TOC and numbered sections, just create HTML and call it .md
rmarkdown::render("README.Rmd", output_file="README.md")

## To achieve proper GitHub rendering, comment out doctype, title, and style
md <- readLines("README.md")
md[md=="<!DOCTYPE html>"] <- "<!-- <!DOCTYPE html> -->"
md <- gsub("(<title>.*</title>)", "<!-- \\1 -->", md)
md <- gsub("<style", "<!-- <style", md)
md <- gsub("</style>", "</style> -->", md)
writeLines(md, "README.md")
