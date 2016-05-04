(require 'package)
(package-initialize)
(global-linum-mode t)


;(load-theme 'ubuntu t)
;(load-theme 'green-phosphor t)
(load-theme 'hipster t)
;(load-theme 'monokai t)


(add-to-list 'custom-theme-load-path "C:/Users/echristensen/AppData/Roaming/.emacs.d/manual-themes")
;couldn't get this to work with the package manager
;(load-theme 'mccarthy t)


(setq default-frame-alist '((font . "Consolas 11")
			    (width . 120)
			    (height . 45)))
(set-frame-font "Consolas 11")


;(golden-ratio-mode 1)


(setq scheme-program-name "petite")
;M-x run-scheme

(setq racket-racket-program "C:/Program Files/Racket/Racket.exe")
(setq racket-raco-program "C:/Program Files/Racket/raco.exe")

(add-to-list 'auto-mode-alist '("\\.js\\'" . js2-mode))

(set-default 'truncate-lines t)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(blink-cursor-mode nil)
 '(column-number-mode t)
 '(cua-mode t nil (cua-base))
 '(custom-safe-themes
   (quote
    ("1c50040ec3b3480b1fec3a0e912cac1eb011c27dd16d087d61e72054685de345" "c158c2a9f1c5fcf27598d313eec9f9dceadf131ccd10abc6448004b14984767c" default)))
 '(inhibit-startup-screen t)
 '(nxml-prefer-utf-16-little-to-big-endian-flag nil)
 '(tool-bar-mode nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

(fset 'quotify
   (lambda (&optional arg) "Keyboard macro." (interactive "p") (kmacro-exec-ring-item (quote ("''," 0 "%d")) arg)))

(global-set-key "\M-q" 'quotify)
(global-set-key "\C-x\C-u" 'undo)

(setq inferior-lisp-program "clisp")
;(setq slime-contribs '(slime-fancy))

(defun sizify (ht wt x y)
  "resize and position the frame"
  (interactive)
  (progn
    (set-frame-size (selected-frame) wt ht)
    (set-frame-position (selected-frame) x y)))

(defun my-sizify ()
  (interactive)
  (sizify 55 234 0 0))

(global-set-key "\M-s\M-s" 'my-sizify)
;(my-sizify)


(defun unix-file ()
  "Change the current buffer to Latin 1 with Unix line-ends."
  (interactive)
  (set-buffer-file-coding-system 'iso-latin-1-unix t))

(defun dos-file ()
  "Change the current buffer to Latin 1 with DOS line-ends."
  (interactive)
  (set-buffer-file-coding-system 'iso-latin-1-dos t))

(defun mac-file ()
  "Change the current buffer to Latin 1 with Mac line-ends."
  (interactive)
  (set-buffer-file-coding-system 'iso-latin-1-mac t))

(defun edit-init ()
  "Edit .emacs file"
  (interactive)
  (find-file "~/.emacs"))




(add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/"))
(add-to-list 'package-archives '("marmalade" . "http://marmalade-repo.org/packages/"))
(unless package-archive-contents (package-refresh-contents))





;;;  3.5 Where do I put my init file?
;;;  On Windows, the .emacs file may be called _emacs for backward compatibility with
;;;  DOS and FAT filesystems where filenames could not start with a dot. Some users
;;;  prefer to continue using such a name due to historical problems various Windows
;;;  tools had in the past with file names that begin with a dot. In Emacs 22 and
;;;  later, the init file may also be called .emacs.d/init.el. Many of the other files
;;;  that are created by lisp packages are now stored in the .emacs.d directory too,
;;;  so this keeps all your Emacs related files in one place.
;;;  
;;;  All the files mentioned above should go in your HOME directory. The HOME directory
;;;  is determined by following the steps below:
;;;  
;;;  1) If the environment variable HOME is set, use the directory it indicates.
;;;  2) If the registry entry HKCU\SOFTWARE\GNU\Emacs\HOME is set, use the directory
;;;     it indicates.
;;;  3) If the registry entry HKLM\SOFTWARE\GNU\Emacs\HOME is set, use the directory
;;;     it indicates. Not recommended, as it results in users sharing the same HOME directory.
;;;  4) If C:\.emacs exists, then use C:/. This is for backward compatibility, as previous
;;;     versions defaulted to C:/ if HOME was not set.
;;;  5) Use the user's AppData directory, usually a directory called AppData under the
;;;     user's profile directory, the location of which varies according to Windows version
;;;     and whether the computer is part of a domain.
;;;
;;;  Within Emacs, ~ at the beginning of a file name is expanded to your HOME directory,
;;;  so you can always find your .emacs file by typing the command C-x C-f ~/.emacs.


