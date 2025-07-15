(setq inhibit-startup-screen t)
(setq initial-scratch-message "")
(fset 'yes-or-no-p 'y-or-n-p)
(setq use-dialog-box nil)
(setq ring-bell-function 'ignore)
(global-auto-revert-mode t)
(delete-selection-mode t)
(setq make-backup-files nil)
(setq auto-save-default nil)

(electric-pair-mode t)
(show-paren-mode t)
(column-number-mode t)
(global-display-line-numbers-mode t)
(setq tab-width 4)
(setq-default indent-tabs-mode nil)
(setq sentence-end-double-space nil)
(setq word-wrap t)

(setq scroll-step 1
      scroll-conservatively 10000
      scroll-margin 5)

(menu-bar-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)
(blink-cursor-mode -1)
(global-goto-address-mode -1)
(global-visual-line-mode +1)
(delete-selection-mode +1)
(save-place-mode +1)
(setq visible-bell t)
(setq frame-title-format "%b")

(load-theme 'modus-vivendi)

;; Disable line numbers for some modes
(dolist (mode '(org-mode-hook
                term-mode-hook
                shell-mode-hook
                eshell-mode-hook
                add-hook mode (lambda () (display-line-numbers-mode 0)))))

(set-language-environment "UTF-8")
(set-keyboard-coding-system 'utf-8-unix)
(set-terminal-coding-system 'utf-8-unix)

(when (display-graphic-p)
  (set-face-attribute 'default nil :font "Fira Code-12")
  (setq-default line-spacing 0.2))

(global-set-key "\C-x\ \C-r" 'recentf-open-files)

(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
(add-to-list 'package-archives '("elpa" . "https://elpa.gnu.org/packages/") t)
(add-to-list 'package-archives '("gnu" . "https://elpa.gnu.org/packages/") t)

;; (package-refresh-contents)

(setq use-package-always-ensure t)
(setq use-package-always-ensure t)

(use-package vertico
  :init
  (vertico-mode)
  (setq vertico-cycle t)
  (setq vertico-resize t)
  (setq vertico-count 15)
)
(use-package orderless
  :init
  (setq completion-styles '(orderless basic)
        completion-category-defaults nil
        completion-category-overrides '((file (styles.  (partial-competion)))))
  (setq orderless-matching-styles '(partial-completion initial-cmael-case))
  (setq orderless-matching-styles '(orderless-flex orderless-regexp))
)
(use-package consult

  :bind (("C-x b" . consult-buffer)
         ("C-x C-f" . consult-find-file)
         ("C-s" . consult-line)
         ("C-r" . consult-ripgrep)
         ("M-g M-g" . consult-goto-line)
         ("M-g M-f" . consult-recent-file)

         ("C-c C-o" . consult-outline)
         ("C-c C-l" . consult-locate)
         ("C-c M-l" . consult-line-grep)
         ("C-c m" . consult-mark)
         ("C-c i" . consult-imenu)
         )
  :config
  ;; (setq consult-preview-key 'any)
  ;; (setq consult-preview-key 'nil)
)
(use-package marginalia
  :after vertico
  :init
  (marginalia-mode)
  (setq marginalia-annotators '(marginalia-annotators-heavy marginalia-annotators-light))
  )
(use-package embark
  :ensure t
  :bind (("C-." . embark-act)
         ("C-;" . embark-dwim)
         ("C-h B" . embark-bindings))
  :config
  (add-to-list 'display-buffer-alist
               '("\\`\\*Embark Collect .*\\*\\'"
                 (display-buffer-reuse-window
                  display-buffer-in-side-window)
                 (side . bottom)
                 (window-height . 10))
  )
)
(use-package embark-consult
  :after (embark consult)
  :ensure t)
(use-package consult-dir
  :ensure t
  :bind (("C-x C-d" . consult-dir)))

(setq enable-recursive-minibuffers t)
(setq completion-ignore-case t)

(setq completion-styles '(orderless basic))
(setq completion-category-defaults '(command (styles . (orderless basic))))
(custom-set-variables

 '(package-selected-packages
   '(consult consult-dir counsel doom-modeline embark embark-consult
             marginalia nerd-icons-grep nerd-icons-ibuffer orderless
             rainbow-delimiters vertico yasnippet)))
(custom-set-faces
 )
