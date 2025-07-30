#!/bin/bash
# Запрос исходной и целевой директории у пользователя
read -p "Введите путь к исходной директорий: " source_directory
read -p "Введите путь к целевой директории: " target_directory

# Запрос расширения файлов, которые нужно скопировать
read -p "Введите расширение файлов для копирования" file_extension 
# дополнительная задача: добавить проверку существования файлов с заданным расширением
file_check=$(find "$source_directory" -type f -name "*$file_extension")
if [[ ! -z "$file_check" ]]; then
    echo "Файлы с расширением $file_extension не найдены в $source_directory"
else
    echo "Найдены файлы:"
    echo "$file_check"
fi

#Запросить у пользователя новое расширения файлов.

read -p "Привет, введите новое расширение файлов (например .txt, .doc): " new_file_extension

echo "Вы ввели новое расширение файла: $new_file_extension"


# Проверка существования исходной директории и целевой директории
	if [ ! -d "$source_directory" ]; then
		echo "Исходная директория Не существует. Создаю.."
		exit 1
	else 
		echo "Исходная директория существует."
	fi
	if [ ! -d "$target_directory" ]; then
    echo "Целевая директория НЕ существует. Создаю.."
		mkdir -p "$target_directory"
        else 
		echo "Целевая директория существует."
        fi


# Проверка, есть ли файлы с указанным расширением в исходной директории

#--Поиск файлов с указанным расширением в тек. директории
FILE_FOUNDER=$(find $source_directory -type f -name "*.$file_extension")

#--проверка на наличия файлов
if [ -z "$FILE_FOUNDER" ]; then
	echo "Ошибка: Файлы с расширением .$file_extension не были найдены"
	exit 1
else
	echo "Были найдены файлы с расширением .$file_extension "
	echo "Найденые файлы: $FILE_FOUNDER"
fi
# Копирование файлов с указанным расширением в целевую директорию

# Архивация данных

arcive_name="old_file_$(date +%Y%M%D).tar.gz"
tar -czf "$target_directory"/"$archive_name"  "$source_directory"/*."$file_extension"

