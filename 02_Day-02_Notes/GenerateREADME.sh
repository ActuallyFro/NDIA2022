#!/bin/bash
outFile="README.adoc"
echo "= Day 01 Notes" > $outFile

for file in *.adoc; do
  if [ "$file" != "$outFile" ]; then
    title=$(grep -m 1 "^= " $file)
    title=${title:2}

    # get two digit number from file name
    num=$(echo $file | grep -oE '[0-9]{2}')

    echo "$num. Notes Title: \`"$title"\`">> $outFile
    echo "link:$file[$title]" >> $outFile

    # echo "[DEBUG] Looking for: $slidesPDF"
    if [ -f "$num"_*.pdf ]; then
      #save file name in var
      slidesPDF=$(ls $num*.pdf)

      # echo "[DEBUG] PDF/slides ($slidesPDF) MATCH FOUND for $title"
      echo "link:$slidesPDF[(Slides)]" >> $outFile
    fi
 
    echo "" >> $outFile
  fi
  
done
