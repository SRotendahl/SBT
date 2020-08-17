(TeX-add-style-hook
 "preamble"
 (lambda ()
   (TeX-add-to-alist 'LaTeX-provided-class-options
                     '(("article" "11pt" "a4paper" "titlepage")))
   (TeX-add-to-alist 'LaTeX-provided-package-options
                     '(("inputenc" "utf8") ("fontenc" "T1") ("babel" "english") ("geometry" "margin=2cm" "headheight=13.6cm") ("pdfpages" "final") ("hyperref" "hidelinks")))
   (add-to-list 'LaTeX-verbatim-environments-local "lstlisting")
   (add-to-list 'LaTeX-verbatim-macros-with-braces-local "lstinline")
   (add-to-list 'LaTeX-verbatim-macros-with-braces-local "href")
   (add-to-list 'LaTeX-verbatim-macros-with-braces-local "hyperref")
   (add-to-list 'LaTeX-verbatim-macros-with-braces-local "hyperimage")
   (add-to-list 'LaTeX-verbatim-macros-with-braces-local "hyperbaseurl")
   (add-to-list 'LaTeX-verbatim-macros-with-braces-local "nolinkurl")
   (add-to-list 'LaTeX-verbatim-macros-with-braces-local "url")
   (add-to-list 'LaTeX-verbatim-macros-with-braces-local "path")
   (add-to-list 'LaTeX-verbatim-macros-with-delims-local "lstinline")
   (add-to-list 'LaTeX-verbatim-macros-with-delims-local "path")
   (TeX-run-style-hooks
    "latex2e"
    "article"
    "art11"
    "inputenc"
    "fontenc"
    "babel"
    "geometry"
    "pdfpages"
    "amsmath"
    "amssymb"
    "biblatex"
    "caption"
    "color"
    "csquotes"
    "enumitem"
    "float"
    "graphicx"
    "hyperref"
    "listings"
    "mdwlist"
    "multicol"
    "pgfkeys"
    "subfig"
    "textcomp"
    "titling"
    "tikz"
    "pgfplotstable"
    "pgfplots"
    "fancyhdr"
    "datetime"
    "moresize")
   (TeX-add-symbols
    '("coverpage" 1)
    '("link" 2)
    "dgreen"
    "green"
    "yello"
    "blue"
    "red"
    "grey"
    "dgrey"
    "rulebreak")
   (LaTeX-add-bibliographies
    "references")
   (LaTeX-add-color-definecolors
    "mygreen"
    "mygray"
    "mymauve"
    "lgray"
    "KU-red"
    "lightblue"
    "deepblue"
    "deepred"
    "deepgreen"
    "yellow"
    "mattegreen"
    "gray"
    "mediumgray"
    "darkgray"
    "mattered"))
 :latex)

