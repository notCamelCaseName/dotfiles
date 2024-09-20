import sys


def create_gradient(start: str, end: str, nvalues: int) -> list[str]:
    nvalues -= 1
    rs, gs, bs = int(start[:2], 16), int(start[2:4], 16), int(start[4:6], 16)
    re, ge, be = int(end[:2], 16), int(end[2:4], 16), int(end[4:6], 16)
    rstep = (re-rs)/nvalues
    gstep = (ge-gs)/nvalues
    bstep = (be-bs)/nvalues

    return [
        f"#{int(rs+i*rstep):02x}{int(gs+i*gstep):02x}{int(bs+i*bstep):02x}"
        for i in range(nvalues+1)
    ]


def print_scss(name: str, color: str):
    print(f"${name}: {color};")


def print_yuck(name: str, color: str):
    print(f"(defvar {name} \"{color}\")")


def print_dbug(name: str, color: str):
    print(f"{name} {color}")


bg = "#" + sys.argv[1]
text = "#" + sys.argv[2]
inactive = "#" + sys.argv[3]
color1 = sys.argv[4]
color2 = sys.argv[5]
color3 = sys.argv[6]

printing_function = print_dbug
if (len(sys.argv) == 8):
    if (sys.argv[7] == "scss"):
        printing_function = print_scss
    if (sys.argv[7] == "yuck"):
        printing_function = print_yuck

printing_function("bg", bg)
printing_function("text", text)
printing_function("inactive", inactive)

for i, col in enumerate(create_gradient(color1, bg[1:], 5)):
    printing_function(f"grad1-{i+1}", col)

for i, col in enumerate(create_gradient(color2, bg[1:], 5)):
    printing_function(f"grad2-{i+1}", col)

for i, col in enumerate(create_gradient(color3, bg[1:], 5)):
    printing_function(f"grad3-{i+1}", col)
