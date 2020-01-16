TODO_path="~/TODO.md"
alias TODO_read="cat -n $TODO_path"
alias TODO_edit="subl $TODO_path"
function TODO() {
  if [ $# -eq 0 ]
  then
    TODO_read
  else
    echo "$*" >> $TODO_path
    echo "Added TODO"
    TODO_read
  fi
}
function DONE() {
  if [ $# -eq 0 ]
  then
    linenum=1
  else
    linenum=$1
  fi
  doneline=`sed "${linenum}q;d" $TODO_path`
  echo "GOOD JOB completing: ${doneline}"
  sed -i "${linenum}d" $TODO_path
  echo "TODO"
  TODO_read
}