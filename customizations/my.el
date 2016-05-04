(setq inhibit-startup-message t)


(fset 'quotify
   (lambda (&optional arg) 
     "Keyboard macro." 
     (interactive "p") 
     (kmacro-exec-ring-item (quote ("''," 0 "%d")) arg)))

(global-set-key "\M-q" 'quotify)

(global-set-key "\C-x\C-u" 'undo)

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



