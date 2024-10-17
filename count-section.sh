wcount="$(texcount main.tex -nobib)"
echo "$wcount" | awk '/Words in text: /{text=$4} /Words in headers: /{headers=$4} END{print "\\item TOTAL WC (12000-18000) | GOT Words=" text + headers}'
echo "$wcount" | awk '/Section: Abstract/,/Section: Project overview/ {
    if ($1 ~ /^[0-9]/) {
        split($1, counts, "+");
        sum_words += counts[1];
        sum_headers += counts[2];
    }
} END {print "\\item INTRODUCTION AND LITERATURE REVIEW: 3000 TO 4500 WORDS | GOT Words =", sum_words + sum_headers}'
echo "$wcount" | awk '/Section: Project overview/,/Section: Final design of DAQ system/ {
    if ($1 ~ /^[0-9]/) {
        split($1, counts, "+");
        sum_words += counts[1];
        sum_headers += counts[2];
    }
} END {print "\\item EXPERIMENTAL DESIGN: 2250 TO 3375 | GOT Words =", sum_words + sum_headers}'
echo "$wcount" | awk '/Section: Final design of DAQ system/,/Section: Conclusion/ {
    if ($1 ~ /^[0-9]/) {
        split($1, counts, "+");
        sum_words += counts[1];
        sum_headers += counts[2];
    }
} END {print "\\item RESULTS AND DISCUSSION: 5250 TO 7875 | GOT Words =", sum_words + sum_headers}'
echo "$wcount" | awk '/Section: Conclusion/,0 {
    if ($1 ~ /^[0-9]/) {
        split($1, counts, "+");
        sum_words += counts[1];
        sum_headers += counts[2];
    }
} END {print "\\item CONCLUSION AND FUTURE WORK: 1500 TO 2250 | GOT Words =", sum_words + sum_headers}'
