# For this file to run your pc muct have pillow(PIL) liblary installed
from sys import argv
from pathlib import Path
from os import listdir, makedirs
from PIL import Image


def exist(file_dir):
    """
    function will check if the file/directory exists if not it will raise FileExistsError
    :type file_dir: Path
    :Param file_dir: The file or directory to check if exists
    :return Error: If not found it will raise error
    """
    if not file_dir.exists():
        raise FileExistsError


def mainFile():
    """
    This function will return the file which exists....
    :return main_file: The file where images can be stored
    :type main_file: Path
    """
    try:
        main_file = Path(argv[1])
        exist(main_file)
        return main_file
    except:
        print("No file found!!!")
        while True:
            try:
                main_file = Path(input("Please enter file where the images are stored: "))
                exist(main_file)
                break
            except FileExistsError:
                print("The given file Not Found......")
                print("Please enter a directory in the same folder in which the script is!!!")
        return main_file

if __name__ == '__main__':
    main_file = mainFile()
    file_ind = 0
    while True:
        try:             
            opf = "CI_" + main_file.stem + "(" + str(file_ind) + ")"
            if file_ind == 0:
                opf = opf = "CI_" + main_file.stem
            makedirs(opf)
            output_folder = Path(opf)
            break
        except FileExistsError:
            file_ind += 1

    print(f"The coverted images will be stored in {opf} folder")

    try:
        
        file_type = input("please enter the filetype(png,jpg, ico,etc.): "
    
        for filename in listdir(main_file):
            imagef = Path(filename)
            img  = Image.open(f"./{main_file}/{filename}")
            img.save(f"./{output_folder}/{imagef.stem}.{file_type}", file_type)
    except:
        print("Sorry we couldent convert your images")
