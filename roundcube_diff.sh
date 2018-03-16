#!/bin/sh
#
# Script to display diffs in Roundcube localisation between releases
#
# CLI parameters can be displayed by parsing `-h`. See the README for more
# informations.

usage () {
  echo ""
  echo "USAGE: "
  echo "  $0 -p path/to/git/repo -i 1.3.4 -f 1.3.5 -l en_US -o roundcube_diff.txt"
  echo "    -h show this help message"
  echo "    -p path to the roundcube git repository (default: roundcubemail)"
  echo "    -i initial roundcube release"
  echo "    -f final roundcube release"
  echo "    -l locale code (default: en_US)"
  echo "    -o output file (default: diff.txt)"
  echo ""
  exit 1
}

repo_path="roundcubemail"
locale="en_US"
output="diff.txt"

# CLI arguments comprehension
while getopts "p:i:f:l:o:h" opt; do
  case $opt in
    h) usage ;;
    p) repo_path=$OPTARG ;;
    i) initial=$OPTARG ;;
    f) final=$OPTARG ;;
    l) locale=$OPTARG ;;
    o) output=$OPTARG ;;
    *)
      usage
    ;;
  esac
done

# Download git repository or update it if it exists
if [ ! -d "$repo_path" ]
then
  echo "Cloning RoundCube repository"
  git clone https://github.com/roundcube/roundcubemail.git $repo_path > /dev/null 2>&1
else
  echo "Pulling latest release"
  git -C $repo_path checkout master > /dev/null 2>&1
  git -C $repo_path pull --rebase origin master > /dev/null 2>&1
fi
git -C $repo_path checkout $final > /dev/null 2>&1

# Check if there are new localisation files in the new release
echo "Checking if there are new localisation files"
echo "#\n# NEW LOCALIZATION FILES\n#\n" > $output
git -C $repo_path diff $initial $final -- .tx/config >> $output

# Show diffs for the localisation files
echo "Generating diffs for the localisation files between $initial and $final"
echo "\n#\n# LOCALISATION FILES DIFF BETWEEN $initial and $final\n#\n" >> $output
cat "$repo_path/.tx/config" | grep file_filter | sed "s/file_filter = //; s/<lang>/$locale/" | while read -r file
do
  git -C $repo_path diff $initial $final -- $file >> $output
done
git -C $repo_path diff $initial $final -- program/localisation/$locale/csv2vcard.inc >> $output
