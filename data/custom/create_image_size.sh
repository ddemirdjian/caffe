#!/bin/bash

root_dir=/mnt/data
sub_dir=SignDB
bash_dir="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
for dataset in trainval test
do
  dst_file=$root_dir/$sub_dir/$dataset.txt
  echo $dst_file

  # Generate image name and size infomation.
  if [ $dataset == "test" ]
  then
    $bash_dir/../../build/tools/get_image_size $root_dir/$sub_dir $dst_file $root_dir/$sub_dir/$dataset"_name_size.txt"
  fi

  # Shuffle trainval file.
  #if [ $dataset == "trainval" ]
  #then
  #  rand_file=$dst_file.random
  #  cat $dst_file | perl -MList::Util=shuffle -e 'print shuffle(<STDIN>);' > $rand_file
  #  mv $rand_file $dst_file
  #fi
done
