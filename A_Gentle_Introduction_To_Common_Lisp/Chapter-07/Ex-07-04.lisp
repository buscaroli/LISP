(defun greater-than-five-p (n)
  "Returns true if n is greater than 5"
  (> n 5))

(defun map-greater-than-five (list-of-nums)
  (mapcar #'greater-than-five-p list-of-nums))

