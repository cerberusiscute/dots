;;; start of Marks .emacs file

(set-face-attribute 'default nil :font  "DejaVu Sans Mono-11" )
(set-frame-font   "DejaVu Sans Mono-11" nil t)

(setq column-number-mode t)

(define-key input-decode-map "\e[1;2D" [S-left])
(define-key input-decode-map "\e[1;2C" [S-right])

;;; add melpa-yasnippet to load-path
(add-to-list 'load-path "~/.emacs.d/elpa/yasnippet-20150405.1526")
(require 'yasnippet)

(setq default-tab-width 4)

(setq inhibit-startup-message t)
(put 'upcase-region 'disabled nil)

;;; init with ~/elisp folder
(add-to-list 'load-path (expand-file-name "~/.emacs.d/elpa"))
(add-to-list 'load-path (expand-file-name "~/elisp"))
(add-to-list 'load-path (expand-file-name "~/.emacs.d/auto-install"))
;;; require auto-install
(require 'auto-install)
;;; set default download dir for auto-install
(setq auto-install-directory "~/.emacs.d/auto-install")

;;; android stuffs
(require 'android-mode)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(android-mode-sdk-dir "/usr/local/Cellar/android-sdk/22.6.2")
 '(ansi-color-faces-vector
   [default default default italic underline success warning error])
 '(ansi-color-names-vector
   ["black" "red3" "ForestGreen" "yellow3" "blue" "magenta3" "DeepSkyBlue" "gray50"])
 '(custom-enabled-themes (quote (solarized-dark)))
 '(custom-safe-themes
   (quote
	("d677ef584c6dfc0697901a44b885cc18e206f05114c8a3b7fde674fce6180879" "8db4b03b9ae654d4a57804286eb3e332725c84d7cdab38463cb6b97d5762ad26" "e16a771a13a202ee6e276d06098bc77f008b73bbac4d526f160faa2d76c1dd0e" "8aebf25556399b58091e533e455dd50a6a9cba958cc4ebb0aab175863c25b9a4" "7bf64a1839bf4dbc61395bd034c21204f652185d17084761a648251041b70233" "9dae95cdbed1505d45322ef8b5aa90ccb6cb59e0ff26fef0b8f411dfc416c552" default)))
 '(custom-theme--load-path (quote (custom-theme-directory t)))
 '(custom-theme-directory "~/.emacs.d/themes")
 '(electric-pair-mode t)
 '(electric-pair-pairs (quote ((34 . 34))))
 '(flymake-fringe-indicator-position (quote right-fringe))
 '(flymake-gui-warnings-enabled nil)
 '(fringe-mode 6 nil (fringe))
 '(global-auto-complete-mode t)
 '(haskell-check-command "ghc -fno-code")
 '(haskell-complete-module-preferred nil)
 '(haskell-indent-spaces 4)
 '(haskell-indentation-delete-backward-indentation t)
 '(haskell-indentation-delete-backward-jump-line t)
 '(haskell-mode-hook (quote (turn-on-haskell-indent)))
 '(linum-format " %7d ")
 '(main-line-color1 "#191919")
 '(main-line-color2 "#111111")
 '(org-capture-templates
   (quote
	(("P" "programming todo" entry
	  (file+datetree+prompt "~/.prognotes/todo.org")
	  "* TODO %^{prompt} %f %U"))))
 '(package-archives
   (quote
	(("marmalade" . "http://marmalade-repo.org/packages/")
	 ("melpa" . "http://melpa.org/packages/")
	 ("gnu" . "http://elpa.gnu.org/packages/"))))
 '(powerline-color1 "#191919")
 '(powerline-color2 "#111111")
 '(whitespace-action (quote (cleanup)))
 '(whitespace-space-before-tab-regexp "\\( +\\)\\(	+\\)")
 '(whitespace-style
   (quote
	(tab-mark lines-tail space-mark newline-mark trailing)))
 '(whitespace-tab-regexp "\\\\(^\\t+\\\\|\\t+$\\\\|\\t+\\\\)")
 '(yas-also-auto-indent-first-line t)
 '(yas-global-mode t nil (yasnippet))
 '(yas-use-menu (quote full)))

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(flymake-errline ((((class color) (min-colors 89)) (:foreground "#990A1B" :background "#FF6E64" :weight bold :underline t)))))

;;; set linum mode by default
(global-linum-mode 1)

;;; haskell stuffs
(add-to-list 'load-path "~/.emacs.d/auto-install/haskell-mode")
(require 'haskell-mode-autoloads)
(add-to-list 'Info-default-directory-list "~/.emacs.d/auto-install/haskell-mode")
(eval-after-load "haskell-mode"
					'(define-key haskell-mode-map (kbd "C-c C-c") 'haskell-compile))

(eval-after-load "haskell-cabal"
			'(define-key haskell-cabal-mode-map (kbd "C-c C-c") 'haskell-compile))

;;; align by regexp and goto
(global-set-key (kbd "C-x a r") 'align-regexp)
(global-set-key (kbd "M-g g") 'goto-line)

;;; auto-complete

(let ((default-directory "~/.emacs.d/auto-install/auto-complete"))
    (normal-top-level-add-subdirs-to-load-path))
(require 'auto-complete-config)
(ac-config-default)

;;; rust-mode.el
(add-to-list 'load-path "~/.emacs.d/auto-install")
(autoload 'rust-mode "rust-mode" nil t)
(add-to-list 'auto-mode-alist '("\\.rs\\'" . rust-mode))

(add-hook 'rust-mode-hook '(lambda ()
					 (local-set-key (kbd "RET") 'newline-and-indent)))

;;; org-mode
(require 'org)
(define-key global-map "\C-cl" 'org-store-link)
(define-key global-map "\C-ca" 'org-agenda)
(setq org-log-done t)

;;; markdown-mode
(add-to-list 'load-path "~/.emacs.d/markdown-mode")
(autoload 'markdown-mode "markdown-mode"
	"major mode for md files" t)
(add-to-list 'auto-mode-alist '("\\.text\\'" . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.md\\'" . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.markdown'" . markdown-mode))

;;; lisp stuff
(load (expand-file-name "~/quicklisp/slime-helper.el"))
;; Replace "sbcl" with the path to your implementation
(setq inferior-lisp-program "sbcl")

;;; inf-ruby suffs
(add-to-list 'load-path "~/.emacs.d/elpa/inf-ruby-2.3.2")
(require 'inf-ruby)

(eval-after-load 'inf-ruby '
	'(define-key inf-ruby-mode-map (kbd "TAB") 'auto-complete))

;;; ruby suffs
(add-to-list 'load-path "~/.emacs.d/ruby")
(require 'ruby-debug)

;;; ac-inf-ruby suffs
;; (add-to-lisload-path "~/.emacs.d/elpa/ac-inf-ruby-0.4")
;; (require 'ac-inf-ruby) ;; when not installed via package.el
;;		 (eval-after-load 'auto-complete
;;			 '(add-to-list 'ac-modes 'inf-ruby-mode))
;; (add-hook 'inf-ruby-mode-hook 'ac-inf-ruby-enable)


;;; color column like vim
;; (require 'whitespace)
;; (global-whitespace-mode)

;; whitespace mode
(whitespace-mode -1)

;;;add a setq for tab width based on mode-hook
(add-hook 'ruby-mode-hook '(lambda()(setq tab-width 2)))


;;; org-mode
(global-set-key "\C-cl" 'org-store-link)
(global-set-key "\C-c3" 'org-capture)
(global-set-key "\C-ca" 'org-agenda)
(global-set-key "\C-cb" 'org-iswitchb)

;;; multiple cursors

(add-to-list 'load-path "~/.emacs.d/elpa/multiple-cursors-20141026.503")

(require 'multiple-cursors)

(global-set-key (kbd "C-c m c") 'mc/edit-lines)
(global-set-key (kbd "C-c m n") 'mc/mark-next-like-this)
(global-set-key (kbd "C-c m p") 'mc/mark-previous-like-this)
(global-set-key (kbd "C-c m a") 'mc/mark-all-like-this)
(global-set-key (kbd "C-c m r") 'mc/mark-all-in-region)

;;; mac copy paste
(defun pbcopy ()
  (interactive)
  (call-process-region (point) (mark) "pbcopy")
  (setq deactivate-mark t))

(defun pbpaste ()
  (interactive)
  (call-process-region (point) (if mark-active (mark) (point)) "pbpaste" t t))

(defun pbcut ()
  (interactive)
  (pbcopy)
  (delete-region (region-beginning) (region-end)))

(global-set-key (kbd "C-c c") 'pbcopy)
(global-set-key (kbd "C-c v") 'pbpaste)
(global-set-key (kbd "C-c x") 'pbcut)

(global-set-key (kbd "M-RET") 'open-previous-line)

;;; ace-jump-mode
(add-to-list 'load-path "~/.emacs.d/elpa/ace-jump-mode-2.0.0.0")
(require 'ace-jump-mode)
(define-key global-map (kbd "C-c SPC") 'ace-jump-mode)

;;; column-marker
(add-to-list 'load-path "~/.emacs.d/elpa/column-marker-20121128.43")
(require 'column-marker)
(add-hook 'prog-mode-hook (lambda () (interactive) (column-marker-2 80)))


;; The following lines are always needed.  Choose your own keys.
(global-set-key "\C-cl" 'org-store-link)
(global-set-key "\C-ca" 'org-agenda)
(global-set-key "\C-cc" 'org-capture)
(global-set-key "\C-cb" 'org-iswitchb)


;;rust

(add-to-list 'load-path "~/emacs.d/elpa/rust-mode-0.1.0")
(require 'rust-mode)


;; scala
(add-to-list 'load-path "~/.emacs.d/elpa/scala-mode-0.0.2")
(require 'scala-mode)
