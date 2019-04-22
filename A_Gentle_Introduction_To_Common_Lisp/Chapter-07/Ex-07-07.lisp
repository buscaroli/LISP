(defun flip-up-down (n)
  "Takes in a list and converts 
    every UP to a DOWN, 
    every DOWN to a UP and leaves
    everything else untouched"
  (mapcar #'(lambda (x)
              (cond ((equal 'up x) 'down)
                    ((equal 'down x) 'up)
                    (t x)))
          n))
