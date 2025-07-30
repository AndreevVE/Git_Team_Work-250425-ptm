#!/bin/bash
#Описание: Скопировать все файлы с указанным расширением из исходной директории в целевую. 
#file_extension
#Действие: Копирование каждого файла с указанным расширением из исходной директории в целевую.
# Вывести сообщение о копировании каждого файла

#Исходная директория - source_directory Расширение - file_extension
#Целевая директория - target_directory Новое расширение - new_file_extension

# Запрос исходной и целевой директории у пользователя

# Запрос расширения файлов, которые нужно скопировать

# Запросить новое расширение для файлов.

# Проверка существования исходной директории и целевой директории


# Проверка, есть ли файлы с указанным расширением в исходной директории

# Копирование файлов с указанным расширением в целевую директорию
#source_directory="c:/Users/1/300725_old"
#target_directory="c:/Users/1/300725_new"
#file_extension="sql"
#new_file_extension="txt"

counter=0

for file in "$source_directory"/*."$file_extension"
do
  if [ -f "$file" ]; then
        filename=$(basename "$file")
        new_filename="${filename%$file_extension}$new_file_extension"
        
        if cp -v "$file" "$target_directory/$new_filename"; then
            echo "Успешно скопирован: $filename -> $new_filename"
            ((counter++))
        else
            echo "Ошибка при копировании $filename"
        fi
  fi

done

echo "Готово! Скопировано файлов: $counter"

# Архивация исходных файлов.

