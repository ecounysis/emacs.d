;;;;
;; Packages
;;;;

;; Define package repositories
(require 'package)
(add-to-list 'package-archives
             '("marmalade" . "http://marmalade-repo.org/packages/") t)
(add-to-list 'package-archives
             '("tromey" . "http://tromey.com/elpa/") t)
(add-to-list 'package-archives
             '("melpa" . "http://melpa.milkbox.net/packages/") t)

;; (setq package-archives '(("gnu" . "http://elpa.gnu.org/packages/")
;;                          ("marmalade" . "http://marmalade-repo.org/packages/")
;;                          ("melpa" . "http://melpa-stable.milkbox.net/packages/")))


;; Load and activate emacs packages. Do this first so that the
;; packages are loaded before you start trying to modify them.
;; This also sets the load path.
(package-initialize)


;; Download the ELPA archive description if needed.
;; This informs Emacs about the latest versions of all packages, and
;; makes them available for download.
(when (not package-archive-contents)
  (package-refresh-contents))





;; The packages you want installed. You can also install these
;; manually with M-x package-install
;; Add in your own as you wish:
(defvar my-packages
  '(;; makes handling lisp expressions much, much easier
    ;; Cheatsheet: http://www.emacswiki.org/emacs/PareditCheatsheet
    paredit

    ;; key bindings and code colorization for Clojure
    ;; https://github.com/clojure-emacs/clojure-mode
    clojure-mode

    ;; extra syntax highlighting for clojure
    clojure-mode-extra-font-locking

    ;; integration with a Clojure REPL
    ;; https://github.com/clojure-emacs/cider
    cider

    ;; allow ido usage in as many contexts as possible. see
    ;; customizations/navigation.el line 23 for a description
    ;; of ido
    ido-ubiquitous

    ;; Enhances M-x to allow easier execution of commands. Provides
    ;; a filterable list of possible commands in the minibuffer
    ;; http://www.emacswiki.org/emacs/Smex
    smex

    ;; project navigation
    projectile

    ;; colorful parenthesis matching
    rainbow-delimiters

    ;; edit html tags like sexps
    tagedit

    ;; git integration
    ;magit
    ))



(dolist (p my-packages)
  (when (not (package-installed-p p))
    (package-install p)))






;; Place downloaded elisp files in ~/.emacs.d/vendor. You'll then be able
;; to load them.
;;
;; For example, if you download yaml-mode.el to ~/.emacs.d/vendor,
;; then you can add the following code to this file:
;;
;; (require 'yaml-mode)
;; (add-to-list 'auto-mode-alist '("\\.yml$" . yaml-mode))
;; 
;; Adding this code will make Emacs enter yaml mode whenever you open
;; a .yml file
(add-to-list 'load-path "~/.emacs.d/vendor")






;;;;
;; Customization
;;;;

;; Add a directory to our load path so that when you `load` things
;; below, Emacs knows where to look for the corresponding file.
(add-to-list 'load-path "~/.emacs.d/customizations")

;; Sets up exec-path-from-shell so that Emacs will use the correct
;; environment variables
(load "shell-integration.el")

;; These customizations make it easier for you to navigate files,
;; switch buffers, and choose options from the minibuffer.
(load "navigation.el")

;; These customizations change the way emacs looks and disable/enable
;; some user interface elements
(load "ui.el")

;; These customizations make editing a bit nicer.
(load "editing.el")

;; Hard-to-categorize customizations
(load "misc.el")

;; For editing lisps
(load "elisp-editing.el")

;; Langauage-specific
(load "setup-clojure.el")
(load "setup-js.el")

;; Lisps
(load "lisps.el")


;; My custom stuff
(load "my.el")






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
