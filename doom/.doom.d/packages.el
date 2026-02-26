;; -*- no-byte-compile: t; -*-
;;; $DOOMDIR/packages.el

(package! typst-preview
  :recipe (:host github :repo "havarddj/typst-preview.el"))

(package! typst-ts-mode)

(package! pandoc-mode)

(package! ess-plot
  :recipe (:host github :repo "DennieTeMolder/ess-plot"))
