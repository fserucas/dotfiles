(defun my-lib-hello ()
  "A test command."
  (interactive)
  (message "This is my lib")
)

;; Name the feature according to the file name
(provide 'my-lib)
