(defun map-is-zero (list-of-nums)
 "Checks if the elements of a list are zeros"
  (mapcar #'zerop list-of-nums))
