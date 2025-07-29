#!/bin/bash

# Запрос исходной и целевой директории у пользователя

# Запрос расширения файлов, которые нужно скопировать

# Запросить новое расширение для файлов.

# Проверка существования исходной директории и целевой директории


# Проверка, есть ли файлы с указанным расширением в исходной директории

# Копирование файлов с указанным расширением в целевую директорию
#переменные, которые должны быть созданы до данного этапа:
#source_directory="source_directory"
#target_directory="target_directory"
#file_extension=".file_extension"
#new_file_extension=".new_file_extension"

mkdir -p "$target_directory"

for file in "$source_directory"/*"$file_extension"; do
    if [ -f "$file" ]; then
	filename=$(basename "$file")
	filename_without_ext="${filename%$file_extension}"
	new_filename="${filename_without_ext}${new_file_extension}"
	cp "$file" "$target_directory/$new_filename"
	echo "Копирование файла: $filename в $target_directory/$new_filename"
fi

# Архивация исходных файлов.

