(TeX-add-style-hook
 "main"
 (lambda ()
   (TeX-run-style-hooks
    "preamble"
    "abstract"
    "introduction"
    "background"
    "implementation"
    "evaluation"
    "conclusion")
   (LaTeX-add-labels
    "intro"
    "back"
    "imp"
    "eval"
    "con")
   (LaTeX-add-environments
    "Figure"))
 :latex)

