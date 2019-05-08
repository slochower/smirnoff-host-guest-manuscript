import os
import subprocess
import argparse


def int_to_letter(int):
    alphabet = list('abcdefghijklmnopqrstuvwxyz'.upper())
    return alphabet[int]


def label(input, output, annotation):

    command = f"""
    convert \
    -font arial \
    -stroke black \
    -pointsize 18 \
    -gravity northwest \
    -draw "text 2,2 '{int_to_letter(annotation)}'" \
    -density 300 \
    {input} \
    "tmp/{output}"
    """
    subprocess.call(command, shell=True)

def get_sizes(input, width=True):
    
    if width:
        command = f"""
        convert \
        {input} \
        -ping \
        -format \
        '%w' \
        info:
        """
    else:
        command = f"""
        convert \
        {input} \
        -ping \
        -format \
        '%h' \
        info:
        """

    p = subprocess.check_output(command, shell=True)
    return int(p.decode("utf-8"))

def resize(input, output, dim, width=True):
    
    print(f"Resizing {args['input'][index]} to tmp/{output}")
    if width:
        command = f"""
        convert \
        -density 300 \
        -resize {dim}x \
        {input} \
        "tmp/{output}"
        """
    else:
        command = f"""
        convert \
        -density 300 \
        -resize x{dim} \
        {input} \
        "tmp/{output}"
        """


    subprocess.call(command, shell=True)

def tile(output, geometry="2x2"):
    # The `<` means don't make smaller, I think.

    command = f"""
    montage \
    tmp/tmp-?.png \
    -tile {geometry} \
    -geometry '1x1+0+0<' \
    -gravity center \
    tmp/{output}
    """
    subprocess.call(command, shell=True)

def clean(mask):
    command = f"""
    rm tmp/{mask}*.png
    """
    subprocess.call(command, shell=True)


if __name__ == "__main__":
    ap = argparse.ArgumentParser()
    ap.add_argument("-i", "--input", help="Individual files", nargs="+",
    required=True)
    ap.add_argument("-o", "--output", help="Merged file", required=True)
    ap.add_argument("-g", "--geometry", help="ImageMagick geometry of tiles", 
    required=False, default="2x2")
    ap.add_argument("-r", "--resize", help="Whether to resize smallest", 
    required=False, default=False, action="store_true")

    args = vars(ap.parse_args())

    if args["resize"]:
        sizes = []
        print("Determining sizes...")

        for figure in args["input"]:
            sizes.append(get_sizes(input = figure,
            width = False))            
            print(f"Found dimension {sizes[-1]}")
        
        for index, size in enumerate(sizes):
            if size < max(sizes):

                resize(input = args['input'][index],
                       output = f"tmp-{index}.png",
                       dim = max(sizes),
                       width = False)

                args["input"][index] = f"tmp/tmp-{index}.png"


    for index, figure in enumerate(args["input"]):

        if not os.path.exists("tmp"):
            os.makedirs("tmp")

        label(input = figure, 
            output = f"tmp-{index}.png",
            annotation = index)
        

    tile(output = args["output"],
         geometry = args["geometry"])
    # clean(mask = "tmp")