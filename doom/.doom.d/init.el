;;; init.el -*- lexical-binding: t; -*-

(doom! :input

       :completion
       ;;company
       (corfu +orderless)
       (ivy +fuzzy +icons)
       ;;vertico

       :ui
       doom
       ;;doom-dashboard
       hl-todo
       (modeline)
       ophints
       (popup +defaults)
       ;;smooth-scroll
       unicode
       (vc-gutter +pretty)
       vi-tilde-fringe
       workspaces

       :editor
       (evil +everywhere)
       file-templates
       (format +onsave)
       parinfer
       snippets
       (whitespace +guess +trim)
       (word-wrap +extra)

       :emacs
       (dired +icons)
       electric
       eww
       (ibuffer +icons)
       tramp
       undo
       vc

       :term
       eshell
       vterm

       :checkers
       syntax
       (spell +flyspell)

       :tools
       biblio
       editorconfig
       (eval +overlay)
       (lookup +dictionary +offline)
       (lsp +peek)
       magit
       pdf
       tree-sitter

       :os
       (:if (featurep :system 'macos) macos)
       tty

       :lang
       emacs-lisp
       (ess +lsp)
       (latex)
       (lua +fennel +lsp +tree-sitter)
       (markdown +tree-sitter)
       (org +pandoc +roam)
       (python +lsp +pyright +tree-sitter)
       (racket +lsp)
       (rust +lsp +tree-sitter)
       (scheme +guile +mit + racket)
       (sh +lsp)
       (web +lsp)
       (yaml +lsp)

       :email
       ;;(mu4e +org +gmail)
       ;;notmuch
       ;;(wanderlust +gmail)

       :app
       rss

       :config
       (default +bindings +smartparens))
