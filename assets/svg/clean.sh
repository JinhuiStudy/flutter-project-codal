# for entry in *

# do
#         newFileName="2$entry"
#         cp $entry $newFileName
#         echo "2_$entry copied"
# done





for entry in *

do
        originFileName="${entry:1}"
        svgcleaner $entry $originFileName
        echo "$originFileName cleaned"
done