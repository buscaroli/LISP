(defun is-long-2 (a-list)
  "Returns true if the given list has a length
    of two"
  (equal 2 (length a-list)))

(defun pick-long-2 (a-list-of-lists)
  "Given a list of lists, returns the ones that
    have a length of 2"
  (remove-if-not #'is-long-2 a-list-of-lists))
