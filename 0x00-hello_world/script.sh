#!/bin/bash

commands=(
  'gcc -E  $CFILE -o c'
  'gcc -c  $CFILE '
  'gcc -S $CFILE'
  'gcc -c $CFILE -o cisfun'
)

file_names=(
  '0-preprocessor'
  '1-compiler'
  '2-assembler'
  '3-name'
)

length=${#file_names[@]}

function submit_tasks() {
  echo '# alx-low_level_programming' > README.md

  for ((i = 0; i <= "${length}"; i++)); do
    echo '#!/bin/bash' >"${file_names[i]}"
    echo "${commands[i]}" >>"${file_names[i]}"
    chmod +x "${file_names[i]}"

    git add .
    git commit -m "finished task ${i}"
  done
  
  git push

}

if [[ "${#file_names[@]}" == "${#commands[@]}" ]]; then
  submit_tasks
else
  echo 'file_name and commands length are not equal'
fi
