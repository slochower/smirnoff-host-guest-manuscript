import os
import subprocess
import argparse
import logging


def int_to_letter(int):
    alphabet = list("abcdefghijklmnopqrstuvwxyz".upper())
    return alphabet[int]


def label(input, output, annotation, pointsize=18):

    command = f"""
    export MAGICK_HOME="$HOME/Documents/ImageMagick-7.0.8"; \
    export DYLD_LIBRARY_PATH="$MAGICK_HOME/lib/"; 
    export PATH="$HOME/bin:$MAGICK_HOME/bin:$PATH"; \
    convert \
    -font arial \
    -stroke black \
    -pointsize {pointsize} \
    -gravity northwest \
    -undercolor 'rgba(100%, 100%, 100%, 0.8)' \
    -strokewidth 2 \
    -draw "text 2,2 '{int_to_letter(annotation)}'" \
    -density 300 \
    {input} \
    "tmp/{output}"
    """
    logging.debug(command)
    subprocess.call(command, shell=True)


def get_sizes(input, width=True):

    if width:
        command = f"""
        export MAGICK_HOME="$HOME/Documents/ImageMagick-7.0.8"; \
        export DYLD_LIBRARY_PATH="$MAGICK_HOME/lib/"; 
        export PATH="$HOME/bin:$MAGICK_HOME/bin:$PATH"; \
        convert \
        {input} \
        -ping \
        -format \
        '%w' \
        info:
        """
    else:
        command = f"""
        export MAGICK_HOME="$HOME/Documents/ImageMagick-7.0.8"; \
        export DYLD_LIBRARY_PATH="$MAGICK_HOME/lib/"; 
        export PATH="$HOME/bin:$MAGICK_HOME/bin:$PATH"; \
        convert \
        {input} \
        -ping \
        -format \
        '%h' \
        info:
        """
    logging.debug(command)
    p = subprocess.check_output(command, shell=True)
    return int(p.decode("utf-8"))


def resize(input, output, dim, width=True):

    print(f"Resizing {args['input'][index]} to tmp/{output}")
    if not os.path.exists("tmp"):
        os.makedirs("tmp")

    if width:
        command = f"""
        export MAGICK_HOME="$HOME/Documents/ImageMagick-7.0.8"; \
        export DYLD_LIBRARY_PATH="$MAGICK_HOME/lib/"; 
        export PATH="$HOME/bin:$MAGICK_HOME/bin:$PATH"; \
        convert \
        -density 300 \
        -resize {dim}x \
        {input} \
        "tmp/{output}"
        """
    else:
        command = f"""
        export MAGICK_HOME="$HOME/Documents/ImageMagick-7.0.8"; \
        export DYLD_LIBRARY_PATH="$MAGICK_HOME/lib/"; 
        export PATH="$HOME/bin:$MAGICK_HOME/bin:$PATH"; \
        convert \
        -density 300 \
        -resize x{dim} \
        {input} \
        "tmp/{output}"
        """

    logging.debug(command)
    subprocess.call(command, shell=True)


def tile(output, geometry="2x2", gravity="center"):
    # The `<` means don't make smaller, I think.

    command = f"""
    export MAGICK_HOME="$HOME/Documents/ImageMagick-7.0.8"; \
    export DYLD_LIBRARY_PATH="$MAGICK_HOME/lib/"; 
    export PATH="$HOME/bin:$MAGICK_HOME/bin:$PATH"; \
    montage \
    tmp/tmp-?.png \
    -tile {geometry} \
    -geometry '1x1+0+0<' \
    -gravity {gravity} \
    {output}
    """
    logging.debug(command)
    subprocess.call(command, shell=True)


def clean(mask):
    command = f"""
    rm tmp/{mask}*.png
    """
    logging.debug(command)
    subprocess.call(command, shell=True)
    subprocess.call("rmdir tmp", shell=True)


if __name__ == "__main__":
    logger = logging.getLogger()

    ap = argparse.ArgumentParser()
    ap.add_argument("-i", "--input", help="Individual files", nargs="+", required=True)
    ap.add_argument("-o", "--output", help="Merged file", required=True)
    ap.add_argument(
        "-g",
        "--geometry",
        help="ImageMagick geometry of tiles",
        required=False,
        default="2x2",
    )
    ap.add_argument(
        "-y",
        "--gravity",
        help="ImageMagick gravity of tile alignment",
        required=False,
        default="center",
    )
    ap.add_argument(
        "-f", "--fontsize", help="Font size of label", required=False, default="18"
    )
    ap.add_argument(
        "-r",
        "--resize",
        help="Whether to resize smallest",
        required=False,
        default=False,
        action="store_true",
    )
    ap.add_argument(
        "-d",
        "--debug",
        help="Whether to print debugging information",
        required=False,
        default=False,
        action="store_true",
    )

    args = vars(ap.parse_args())

    if args["debug"]:
        logger.setLevel(logging.DEBUG)

    if args["resize"]:
        sizes = []
        print("Determining sizes...")

        for figure in args["input"]:
            sizes.append(get_sizes(input=figure, width=True))
            print(f"Found dimension {sizes[-1]}")

        for index, size in enumerate(sizes):
            if size < max(sizes):

                resize(
                    input=args["input"][index],
                    output=f"tmp-{index}.png",
                    dim=max(sizes),
                    width=True,
                )

                args["input"][index] = f"tmp/tmp-{index}.png"

    for index, figure in enumerate(args["input"]):

        if not os.path.exists("tmp"):
            os.makedirs("tmp")

        label(
            input=figure,
            output=f"tmp-{index}.png",
            annotation=index,
            pointsize=args["fontsize"],
        )

    tile(output=args["output"], geometry=args["geometry"], gravity=args["gravity"])
    clean(mask="tmp")
