;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Doom exposes five (optional) variables for controlling fonts in Doom:
;;
;; - `doom-font' -- the primary font to use
;; - `doom-variable-pitch-font' -- a non-monospace font (where applicable)
;; - `doom-big-font' -- used for `doom-big-font-mode'; use this for
;;   presentations or streaming.
;; - `doom-symbol-font' -- for symbols
;; - `doom-serif-font' -- for the `fixed-pitch-serif' face
;;

(setq doom-font (font-spec :family "JuliaMono" :size 14 :weight 'light)
      doom-variable-pitch-font (font-spec :family "Gentium" :size 14))

(setq doom-theme 'modus-operandi)

(setq +tree-sitter-hl-enabled-modes t)


(after! ess-r-mode
  (defun mgh/r-docs ()
    (interactive)
    (if (one-window-p t)
        (let ((origin (selected-window)))
          (call-interactively #'+lookup/documentation)
          (when-let ((buf (get-buffer "*lsp-help*")))
            (delete-windows-on buf)
            (select-window origin)
            (display-buffer-in-direction
             buf
             '((direction . right)
               (window-width . 0.5)
               (inhibit-same-window . t)))
            (select-window origin)))
      (call-interactively #'+lookup/documentation)))

  (map! :map ess-r-mode-map :n "K" #'mgh/r-docs))



;; tinymist + lsp-mode for typst-ts-mode
(after! lsp-mode
  ;; Make sure lsp-mode knows what language Typst buffers are
  (add-to-list 'lsp-language-id-configuration '(typst-ts-mode . "typst"))
  (add-to-list 'lsp-language-id-configuration '("\\.typ\\'" . "typst"))

  ;; Register the server
  (lsp-register-client
   (make-lsp-client
    :new-connection (lsp-stdio-connection '("tinymist"))
    :major-modes '(typst-ts-mode)
    :server-id 'tinymist))

  ;; Start LSP automatically in Typst buffers
  (add-hook 'typst-ts-mode-hook #'lsp-deferred))


(setq display-line-numbers-type `relative)

(add-to-list 'initial-frame-alist '(fullscreen . maximized))

;; If you use `org' and don't want your org files in the default location below,
;; change `org-directory'. It must be set before org loads!
(setq org-directory "~/wiki/")

(after! evil-org
  (map! :map evil-org-mode-map
        :nv "gj" #'evil-next-visual-line
        :nv "gk" #'evil-previous-visual-line
        :nv "<down>" #'evil-next-visual-line
        :nv "<up>" #'evil-previous-visual-line))

(setq +latex-viewers '(pdf-tools))

;; Whenever you reconfigure a package, make sure to wrap your config in an
;; `after!' block, otherwise Doom's defaults may override your settings. E.g.
;;
;;   (after! PACKAGE
;;     (setq x y))
;;
;; The exceptions to this rule:
;;
;;   - Setting file/directory variables (like `org-directory')
;;   - Setting variables which explicitly tell you to set them before their
;;     package is loaded (see 'C-h v VARIABLE' to look up their documentation).
;;   - Setting doom variables (which start with 'doom-' or '+').
;;
;; Here are some additional functions/macros that will help you configure Doom.
;;
;; - `load!' for loading external *.el files relative to this one
;; - `use-package!' for configuring packages
;; - `after!' for running code after a package has loaded
;; - `add-load-path!' for adding directories to the `load-path', relative to
;;   this file. Emacs searches the `load-path' when you load packages with
;;   `require' or `use-package'.
;; - `map!' for binding new keys
;;
;; To get information about any of these functions/macros, move the cursor over
;; the highlighted symbol at press 'K' (non-evil users must press 'C-c c k').
;; This will open documentation for it, including demos of how they are used.
;; Alternatively, use `C-h o' to look up a symbol (functions, variables, faces,
;; etc).
;;
;; You can also try 'gd' (or 'C-c c d') to jump to their definition and see how
;; they are implemented.
