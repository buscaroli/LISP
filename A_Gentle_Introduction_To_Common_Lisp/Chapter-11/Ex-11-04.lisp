(defun it-length (alist)
  "Counts6 the elements of a list using dolist"
  (let ((counter 0))
    (dolist (element alist counter)
      (setf counter (+ counter 1)))))

